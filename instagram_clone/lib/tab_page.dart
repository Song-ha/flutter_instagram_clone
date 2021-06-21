// 탭 페이지

import 'package:flutter/material.dart';
import 'package:instagram_clone/home_page.dart';
import 'package:instagram_clone/seach_page.dart';

class TabPage extends StatefulWidget {


  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {

  int _selectedPageIndex = 0;

  List _pages = [
    HomePage(),
    SearchPage(),
    Text('page3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedPageIndex]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
      currentIndex: _selectedPageIndex,
        fixedColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Search')),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('Account')),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
}


