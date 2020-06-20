import 'package:flutter/material.dart';

class AddPostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
          crossAxisCount: 4,
          childAspectRatio: 1.0,
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(4.0),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: <String>[
            'assets/images/nilu.jpg',
            'assets/images/nilesh.jpg',
            'assets/images/nilu.jpg',
            'assets/images/nilesh.jpg',
            'assets/images/nilu.jpg',
            'assets/images/nilesh.jpg',
            'assets/images/nilu.jpg',
            'assets/images/nilesh.jpg',
            'assets/images/nilu.jpg',
            'assets/images/nilesh.jpg',
            'assets/images/nilu.jpg',
            'assets/images/nilesh.jpg',
            'assets/images/nilu.jpg',
            'assets/images/nilesh.jpg',
            'assets/images/nilu.jpg',
            'assets/images/nilesh.jpg',
            'assets/images/nilu.jpg',
            'assets/images/nilesh.jpg',
            'assets/images/nilu.jpg',
            'assets/images/nilesh.jpg',
            'assets/images/nilu.jpg',
            'assets/images/nilesh.jpg',
            'assets/images/nilu.jpg',
            'assets/images/nilesh.jpg',
          ].map((String url) {
            return GridTile(child: Image.asset(url, fit: BoxFit.cover));
          }).toList()),
    );
  }
}
