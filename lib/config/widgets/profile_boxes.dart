import 'package:engelli_uygulama/config/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileBoxes extends StatelessWidget {
  final title;
  final count;
  final photos;

  ProfileBoxes({Key key, this.title,this.count,this.photos});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: EdgeInsets.only(bottom: Get.height*0.03),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(offset: Offset(0,0),color: Colors.grey.shade300,blurRadius: 10,spreadRadius: 1)
        ],
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(4)),
      padding: EdgeInsets.symmetric(
           vertical: Get.height * 0.018),
      child: ListTile(
        leading: Image.asset(photos),
        title: Container(margin: EdgeInsets.only(bottom: 10),child: Text(title,style: TextStyle(color: koyuMavi,fontWeight: FontWeight.bold),),),
        subtitle: Text(count,style: TextStyle(fontSize: 15),),
      ),
    );
  }
}

