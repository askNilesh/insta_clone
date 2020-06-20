import 'package:flutter/material.dart';
import 'package:instaclone/pages/home_page/feed_list.dart';
import 'package:instaclone/pages/home_page/insta_story.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          'Instagram',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.camera_alt,
              color: Colors.black,
            ),
            onPressed: () {}),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.near_me,
                color: Colors.black,
              ),
              onPressed: () {}),
        ],
      ),
      body: Container(
        child: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[InstaStory(), FeedList()],
          ),
        )),
      ),
    );
  }
}
