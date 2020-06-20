import 'package:flutter/material.dart';

class InstaStory extends StatefulWidget {
  @override
  _InstaStoryState createState() => _InstaStoryState();
}

class _InstaStoryState extends State<InstaStory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.only(left: 10,right: 10,top: 10),
      child: ListView.builder(
          itemCount: 20,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, itemIndex) {
            return itemIndex == 0
                ? Container(
                    margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                  border: Border.all(
                                      color: itemIndex % 2 == 0 ? Colors.grey : Colors.red,
                                      width: 1)),
                              padding: EdgeInsets.all(2.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                child: Image.asset(
                                  'assets/images/nilesh.jpg',
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration:
                                    BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                                child: Center(
                                    child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 15,
                                )),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          width: 70,
                          child: Text(
                            'Your Story',
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              border: Border.all(
                                  color: itemIndex % 2 == 0 ? Colors.grey : Colors.red, width: 1)),
                          padding: EdgeInsets.all(2.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            child: Image.asset(
                              'assets/images/nilesh.jpg',
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          width: 70,
                          child: Text(
                            'asknilesh_',
                            style: TextStyle(
                                fontWeight:
                                    itemIndex % 2 == 0 ? FontWeight.normal : FontWeight.bold,
                                fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  );
          }),
    );
  }
}
