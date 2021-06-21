import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_storage/firebase_storage.dart';

class CreatePage extends StatefulWidget {
  final FirebaseUser user;

  CreatePage(this.user);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dipose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              final firebaseStorageRef = FirebaseStorage.instance
                  .ref()
                  .child('post')
                  .child('${DateTime.now().millisecondsSinceEpoch}.png');

              final task = firebaseStorageRef.putFile(
                  _image, StorageMetadata(contentType: 'image/png'));

              task.onComplete.then((value) {
                var downloadUrl = value.ref.getDownloadURL();
                downloadUrl.then((uri) {
                  var doc = Firestore.instance.collection('post').document();
                  doc.setData({
                    'id': doc.documentID,
                    'photoUrl': uri.toString(),
                    'contents': textEditingController.text,
                    'email': widget.user.email,
                    'displayName': widget.user.displayName,
                    'userPhotoUrl': widget.user.photoUrl
                  }).then((value) {
                    Navigator.pop(context);
                  });
                });
              });
            },
          ),
        ],
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _image == null ? Text('No Image') : Image.file(_image!),
          TextField(
            decoration: InputDecoration(hintText: '내용을 입력하세요.'),
            controller: textEditingController,
          )
        ],
      ),
    );
  }

  File? _image;

  Future _getImage() async {
    // 비동기 처리가 필요
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);

    // 이미지 파일을 갤러리에서 선택하면 이미지를 보여주기 위한 부분
    setState(() {
      _image = image;
    });
  }
}
