import 'package:flutter/material.dart';
import 'package:instaclone/pages/home_page/feed_item.dart';

class FeedList extends StatefulWidget {
  @override
  _FeedListState createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: 20,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, itemIndex) {
            return FeedItem();
          }),
    );
  }
}
