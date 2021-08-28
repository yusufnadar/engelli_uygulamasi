import 'package:engelli_uygulama/config/color.dart';
import 'package:engelli_uygulama/ui/events/comment_to_event.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class EventComments extends StatefulWidget {
  const EventComments({Key key}) : super(key: key);

  @override
  _EventCommentsState createState() => _EventCommentsState();
}

class _EventCommentsState extends State<EventComments> {
  var liste = <String>[
    'Harika bir insan, gerçekten zaman geçirmek çok keyifliydi',
    'Bence biraz fazla egolu ama yine de çok cömert ve insanlara yardım ediyor, 4 yıldızı hakediyor'
  ];

  var colorList = <Color>[Colors.red,Colors.blue,Colors.yellow,Colors.green,Colors.orange];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => CommentToEvent());
            },
            icon: Icon(Icons.add),
          ),
        ],
        title: Text(
          'Etkinlik Yorumları',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
          child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sümeyye Aydoğan',style: TextStyle(fontWeight: FontWeight.bold,color: colorList[math.Random().nextInt(5)]),),
                  SizedBox(height: 15,),
                  Text(liste[index]),
                ],
              ),
            ),
          ),
        ),
        itemCount: liste.length,
      ),
    );
  }
}
