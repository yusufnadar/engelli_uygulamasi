import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileTextField extends StatelessWidget {
  final text;
  final lines;

  ProfileTextField({Key key, this.text, this.lines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: Get.height*0.03),
      child: TextFormField(
        maxLines: lines ?? 1,
        decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(fontSize: 13, color: Color(0xff1e3d59)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade400, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade400, width: 1))),
      ),
    );
  }
}
