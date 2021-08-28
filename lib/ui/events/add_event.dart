import 'package:engelli_uygulama/config/color.dart';
import 'package:engelli_uygulama/config/widgets/add_event_text_form.dart';
import 'package:engelli_uygulama/config/widgets/close_keyboard.dart';
import 'package:engelli_uygulama/config/widgets/text_form_field.dart';
import 'package:engelli_uygulama/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key key}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  var _sizedBox = SizedBox(
    height: Get.height * 0.04,
  );

  @override
  Widget build(BuildContext context) {
    return CloseKeyboard(
      child: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(
                'Etkinlik Ekle',
                style: TextStyle(color: Color(0xff1e3d59)),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/check.png',
                    width: 22,
                    color: koyuMavi,
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade200,
                      ),
                      height: Get.height * 0.3,
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: (){
                            Get.snackbar('Bilgilendirme', 'Etkinlik fotosu yükle kardeşim');
                          },
                          child: Image.asset(
                            'assets/camera.png',
                            width: Get.width * 0.07,
                          ),
                        ),
                      ),
                    ),
                    _sizedBox,
                    AddEventTextForm(
                      text: 'Başlık',
                    ),
                    _sizedBox,
                    AddEventTextForm(
                      text: 'Konum',
                    ),
                    _sizedBox,
                    AddEventTextForm(
                      text: 'Açıklama',
                    ),
                    _sizedBox,
                    Container(
                      width: Get.width,
                      height: Get.height * 0.07,
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            color: Colors.grey.shade300,
                            spreadRadius: 1,
                            blurRadius: 7,)
                      ],),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Tarih Seçiniz',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color:Color(0xff1e3d59),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
