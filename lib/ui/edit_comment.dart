import 'package:engelli_uygulama/config/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditComment extends StatefulWidget {
  const EditComment({Key key}) : super(key: key);

  @override
  _EditCommentState createState() => _EditCommentState();
}

class _EditCommentState extends State<EditComment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lacivert,
        title: Text('Yorum Güncelle'),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Yorum Yazınız',
                hintStyle: TextStyle(fontSize: 13, color: Color(0xff1e3d59)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Container(
              width: Get.width,
              height: Get.height * 0.06,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: sari),
                onPressed: () {},
                child: Text('Güncelle',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
