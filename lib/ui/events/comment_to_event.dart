import 'package:engelli_uygulama/config/widgets/profile_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentToEvent extends StatefulWidget {
  const CommentToEvent({Key key}) : super(key: key);

  @override
  _CommentToEventState createState() => _CommentToEventState();
}

class _CommentToEventState extends State<CommentToEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          'Etkinliği Değerlendir',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
        TextFormField(
          maxLines: 8,
          decoration: InputDecoration(
              hintText: 'Etkinliği Değerlendir',
              hintStyle: TextStyle(fontSize: 13, color: Color(0xff1e3d59)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.grey.shade400, width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.grey.shade400, width: 1))),
        ),
            Container(
              margin: EdgeInsets.only(top: Get.height*0.05),
              width: Get.width,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red
              ),
              child: Text('Gönder',style: TextStyle(fontSize: 20,color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
