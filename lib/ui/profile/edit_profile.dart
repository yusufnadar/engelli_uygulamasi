import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:engelli_uygulama/config/color.dart';
import 'package:engelli_uygulama/config/widgets/profile_text_field.dart';
import 'package:engelli_uygulama/config/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var liste = [
    'Kitap Okuma',
    'Futbol',
    'Dizi izleme',
    'Basketbol',
    'Müzik dinleme',
    'Satranç',
    'Bilgisayar oyunları',
    'Yazılım',
    'Bisiklet',
    'Tasarım'
  ];

  String dateTimeTr;

  int id;
  var sehirler = [
    {'title':'İstanbul','id':1},
    {'title':'Ankara','id':2},
  ];

  int radioId = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kirmizi,
        title: Text('Profili Düzenle'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundImage:  CachedNetworkImageProvider('https://images.unsplash.com/photo-1608415295464-b5de23d21f59?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80'),
                    radius: Get.height * 0.1,
                  ),
                  Positioned(
                    child: CircleAvatar(
                      child: Icon(Icons.camera_alt_outlined,color: Colors.white,),
                      backgroundColor: kirmizi,
                    ),
                    bottom: 10,
                    right: 10,
                  )
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            ProfileTextField(text: 'Ad Soyad',),
            ProfileTextField(text: 'Hakkında',),
            ProfileTextField(text: 'Telefon Numarası',),
            ProfileTextField(text: 'Email',),
            ProfileTextField(text: 'TC',),
            Theme(
              data: ThemeData(canvasColor: Colors.white),
              child: DropdownButtonHideUnderline(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15,bottom: 10),
                      padding: EdgeInsets.symmetric(vertical: Get.height*0.005),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Color(0xffEFEFEF)),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: DropdownButton(
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.white,
                        isExpanded: true,
                        hint: Container(
                            width: Get.width,
                            color: Colors.white,
                            padding: EdgeInsets.only(left: Get.width * 0.05),
                            alignment: Alignment.center,
                            child: Text(
                              'Şehir Seçiniz',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                            )),
                        items: sehirler
                            .map(
                              (e) => DropdownMenuItem(
                            child: Container(
                                color: Colors.white,
                                width: Get.width,
                                padding:
                                EdgeInsets.only(left: Get.width * 0.05),
                                alignment: Alignment.center,
                                child: Text(
                                  e['title'],
                                  textAlign: TextAlign.center,
                                )),
                            value: e['id'],
                          ),
                        )
                            .toList(),
                        value: id,
                        onChanged: (value) {
                          setState(() {
                            id = value;
                          });
                        },
                      ),
                    ),
                    Positioned(child: Icon(Icons.arrow_circle_down_outlined),bottom: 25,right: 20,)
                  ],
                ),
              ),
            ),
            datePart(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Radio(value: 1, groupValue: radioId, onChanged: (value){
                      setState(() {
                        radioId = value;
                      });
                    }),
                    GestureDetector(onTap: (){
                      setState(() {
                        radioId = 1;
                      });
                    },child: Text('Engelli')),
                  ],
                ),
                Row(
                  children: [
                    Radio(value: 2, groupValue: radioId, onChanged: (value){
                      setState(() {
                        radioId = value;
                      });
                    }),
                    GestureDetector(onTap: (){
                      setState(() {
                        radioId = 2;
                      });
                    },child: Text('Gönüllü')),
                  ],
                )
              ],
            ),
            SizedBox(height: 15,),
            radioId == 1 ? ProfileTextField(text: 'Engelinizi kısaca açıklar mısınız?',) : Container(),
            Text('Yakın Bilgileri'),
            SizedBox(height: 15,),
            ProfileTextField(text: 'Yakın Ad Soyad',),
            ProfileTextField(text: 'Yakınlık Durumu',),
            ProfileTextField(text: 'Yakın Telefon',),
          ],
        ),
      ),
    );
  }

  Container datePart() {
    return Container(
      margin: EdgeInsets.only(bottom: context.height * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: context.height * 0.01),
            child: Text(
              'Doğum Tarihiniz',
            ),
          ),
          GestureDetector(
            onTap: () {
              chooseDate();
            },
            child: Container(
              alignment: Alignment.centerLeft,
              height: context.height * 0.08,
              width: context.width,
              padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.03,
                vertical: context.height * 0.01,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Color(0xffbdbdbd), width: 0.5),
              ),
              child: Text(
                dateTimeTr ?? 'Seçiniz',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void chooseDate() async {
    DateTime birthDate = await openCalendar(DateTime.now(), lastDate: DateTime.now());
    setState(() {
      dateTimeTr = DateFormat.yMMMMd('tr').format(birthDate);
    });
  }

  Future openCalendar(DateTime initialDateTime, {DateTime lastDate}) async {
    var completer = Completer();
    if (Platform.isAndroid) {
      await showDatePicker(
          locale: Locale('tr', 'TR'),
          context: context,
          initialDate: initialDateTime,
          firstDate: DateTime(1920),
          lastDate: lastDate ?? DateTime(initialDateTime.year + 10))
          .then((temp) {
        if (temp == null) return null;
        completer.complete(temp);
        setState(() {});
      });
    } else {
      /*
      await DatePicker.showDatePicker(context,
          theme: DatePickerTheme(
            containerHeight: 210.0,
          ),
          showTitleActions: true,
          minTime: DateTime(1920, 1, 1),
          maxTime: DateTime.now(), onConfirm: (date) {
            _date = date;
            completer.complete(_date);
            setState(() {});
          }, currentTime: DateTime.now(), locale: LocaleType.tr);
       */
    }
    return completer.future;
  }


}

