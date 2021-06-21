import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final FirebaseUser user;
  HomePage(this.user);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram Clone',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    String title = 'Instagram에 오신 것을 환영합니다.';
    String contents = '사진과 도영상을 보려면 팔로우 하세요.';
    String email = user.email;
    String name = user.displayName;

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 20.0),
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              Text(
                contents,
                style: TextStyle(fontSize: 12.0),
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              SizedBox(
                width: 260.0,
                child: Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: 80.0,
                          height: 80.0,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                user.photoUrl),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(8.0)),
                        Text(email,style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(name),
                        Padding(padding: EdgeInsets.all(6.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 70.0,
                              height: 70.0,
                              child: Image.network('https://t1.daumcdn.net/cfile/tistory/994BEF355CD0313D05'),
                            ),
                            Padding(padding: EdgeInsets.all(1.0)),
                            SizedBox(
                              width: 70.0,
                              height: 70.0,
                              child: Image.network('https://t1.daumcdn.net/cfile/tistory/994BEF355CD0313D05'),
                            ),
                            Padding(padding: EdgeInsets.all(1.0)),
                            SizedBox(
                              width: 70.0,
                              height: 70.0,
                              child: Image.network('https://t1.daumcdn.net/cfile/tistory/994BEF355CD0313D05'),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(4.0)),
                        Text('페이스북 친구'),
                        Padding(padding: EdgeInsets.all(4.0)),
                        // ignore: deprecated_member_use
                        RaisedButton(
                            child: Text('팔로우'),
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                            onPressed: (){}
                            ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
