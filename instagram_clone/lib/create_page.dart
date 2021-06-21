import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
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
          IconButton(onPressed: () {}, icon: Icon(Icons.send)),
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
