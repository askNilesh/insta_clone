import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/pages/add_post/post_list.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: false,
        title: Row(
          children: <Widget>[
            Text('Gallery',style: TextStyle(color: Colors.black),),
            Icon(Icons.arrow_drop_down,color: Colors.black,),
          ],
        ),
        leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        actions: <Widget>[
          InkWell(
            onTap: () {
            },
            child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Next',
                    style: TextStyle(
                        color: Colors.blue, fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                )),
          )
        ],
      ) ,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/nilesh.jpg'), fit: BoxFit.cover)),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        width: 40,
                        height: 40,
                        child: Icon(Icons.home,color: Colors.white,),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        width: 40,
                        height: 40,
                        child: Icon(Icons.home,color: Colors.white,),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        width: 40,
                        height: 40,
                        child: Icon(Icons.home,color: Colors.white,),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        padding: const EdgeInsets.all(10.0),
                        height: 40,
                        child: Center(
                            child: Text(
                              'Select Multiple'.toUpperCase(),
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AddPostList()
          ],
        ),
      )
    );
  }
}
