import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Activity',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: SafeArea(
            child: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    child: Icon(Icons.perm_contact_calendar),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 1)),
                  ),
                  SizedBox(width: 20),
                  Text('Branded Content',style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            Divider(),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    child: Icon(Icons.person_add),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 1)),
                  ),
                  SizedBox(width: 20),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Text('Follow Requests',style: TextStyle(fontWeight: FontWeight.normal),),
                     Text('Approve or ignore Requests',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey),)
                   ],
                 )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Text('This Month',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: 20,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context,index){
                return Container(
                  margin: const EdgeInsets.only(left: 0, right: 0, top: 10),
                  child: Row(
                    children: <Widget>[
                      ClipRRect(

                        child:Image.asset(
                          'assets/images/nilesh.jpg',
                          height: 40,
                          width: 40,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                text: '',
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(text: 'asknilsh_', style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: ' likes your photo.'),
                                ],
                              ),
                            ),
                            Text('4w',style: TextStyle(color: Colors.grey),)
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Image.asset(
                        'assets/images/nilesh.jpg',
                        height: 40,
                        width: 40,
                      )
                    ],
                  ),
                );
              }),
            )
          ],
        )),
      ),
    );
  }
}
