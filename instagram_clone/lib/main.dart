import 'package:flutter/material.dart';
import 'package:instagram_clone/root_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Color pointColor = Colors.black; //포인트로 사용할 색상


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        // ignore: deprecated_member_use
        accentColor: pointColor
      ),
      home: RootPage(),
    );
  }
}

