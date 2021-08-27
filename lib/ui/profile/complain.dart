import 'package:engelli_uygulama/config/color.dart';
import 'package:engelli_uygulama/config/widgets/profile_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Complain extends StatefulWidget {
  const Complain({Key key}) : super(key: key);

  @override
  _ComplainState createState() => _ComplainState();
}

class _ComplainState extends State<Complain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          'Şikayet Et',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            ProfileTextField(text: 'Şikayetinizi Yazınız',lines:8),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(offset: Offset(0,0),color: Colors.white,spreadRadius: 1,blurRadius: 5)
                ]
              ),
              alignment: Alignment.center,
              height: 200,
              child: Icon(Icons.add_a_photo,size: 36,color: lacivert,),
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
              child: Text('Şikayet Et',style: TextStyle(fontSize: 20,color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
