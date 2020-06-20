import 'package:flutter/material.dart';
import 'package:instaclone/pages/activity/acrivity_page.dart';
import 'package:instaclone/pages/home_page/home_page.dart';
import 'package:instaclone/pages/search_page.dart';
import 'package:instaclone/widgets/common_navigation_bar.dart';

import 'add_post/add_post.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  void _next(Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: Colors.orange),
        unselectedIconTheme: IconThemeData(color: Colors.grey),

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            title: Text(''),
          ),
        ],
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber[800],
        elevation: 2.0,
        onTap: _onItemTapped,
      ),
      body: CommonBottomBar(
        selectedIndex: _selectedIndex,
        navigatorKeys: _navigatorKeys,
        childrens: [
          HomePage(),
//          BusinessFeed(
//            onNext: () {
//              _next(BusinessDetails());
//            },
//          ),
          SearchPage(),
          AddPost(),
          ActivityPage(),
          HomePage(),
        ],
      ),
    );
  }
}
