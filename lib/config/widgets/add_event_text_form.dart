import 'package:engelli_uygulama/config/color.dart';
import 'package:flutter/material.dart';

class AddEventTextForm extends StatelessWidget {
  final text;

  AddEventTextForm({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(fontSize: 13, color: textColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
        ),
      ),
    );
  }
}
