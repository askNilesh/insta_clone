import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchPage extends StatelessWidget {
  final list = [
    "https://i.stack.imgur.com/K8FFo.jpg?s=328&g=1",
    "https://assets.entrepreneur.com/content/3x2/2000/20191219170611-GettyImages-1152794789.jpeg",
    "https://icdn5.digitaltrends.com/image/dell-xps-15-2-in-1-review-front-display-720x720.jpg",
    "https://image.freepik.com/free-photo/laptop-office-desk_426-19315253.jpg",
    "https://resize.indiatvnews.com/en/resize/newbucket/715_-/2017/03/disha-patani-1-1488861958.jpg",
    "https://indianewengland.com/wp-content/uploads/2018/04/Disha-Patani.jpg",
    "https://images-na.ssl-images-amazon.com/images/I/81PRr0RBnTL._SL1500_.jpg",
    "https://superherojacked.com/wp-content/uploads/2018/07/Goku-Workout-1.jpg",
    "https://secureservercdn.net/160.153.137.99/c7f.ccf.myftpupload.com/wp-content/uploads/2019/04/goku_powers_and_abilities.jpg?time=1591942530",
    "https://attackofthefanboy.com/wp-content/uploads/2016/07/Dragon-ball-super-black-goku-fight.jpg",
  ];
  List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 1),
    const StaggeredTile.count(1, 2),
    const StaggeredTile.count(2, 1),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(1, 2),
    const StaggeredTile.count(2, 1),
    const StaggeredTile.count(2, 1),
    const StaggeredTile.count(4, 1),
    const StaggeredTile.count(4, 1),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          'Search',
          style: TextStyle(color: Colors.grey,),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            onPressed: () {}),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.camera,
                color: Colors.grey,
              ),
              onPressed: () {}),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: new StaggeredGridView.count(
            crossAxisCount: 4,
            staggeredTiles: _staggeredTiles,
            children: list
                .map((data) => GestureDetector(
              child: Container(

                child: FadeInImage(placeholder: AssetImage('assets/images/placeholder.jpg'), image: NetworkImage(data),fit: BoxFit.cover,),
              ),
              onTap: () {},
            ))
                .toList(),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            padding: const EdgeInsets.all(4.0),
          )));
  }
}