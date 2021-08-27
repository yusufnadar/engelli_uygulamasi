import 'package:engelli_uygulama/config/color.dart';
import 'package:engelli_uygulama/ui/events/comment_to_event.dart';
import 'package:engelli_uygulama/ui/events/edit_event.dart';
import 'package:engelli_uygulama/ui/events/event_comments.dart';
import 'package:engelli_uygulama/ui/profile/photos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PastEvents extends StatefulWidget {
  const PastEvents({Key key}) : super(key: key);

  @override
  _PastEventsState createState() => _PastEventsState();
}

class _PastEventsState extends State<PastEvents> {
  var liste1 = ['assets/a1.jpg', 'assets/a2.jpg', 'assets/a3.jpg'];

  var liste2 = [
    'Tarihi Müze Gezisi',
    'Hayvanlar İçin Konser',
    'EFK 4.Konferansı'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          'Geçmiş Etkinliklerim',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: liste1.length,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Hero(
                  tag: index,
                  child: Stack(
                    children: [
                      Image.asset(
                        liste1[index],
                        width: 360,
                        height: 360,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        right: Get.width * 0.03,
                        top: Get.height * 0.02,
                        child: PopupMenuButton(
                          icon: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                            size: 35,
                          ),
                          onSelected: (value) {
                            switch (value) {
                              case '1':
                                Get.to(() => EditEvent());
                                break;
                              case '2':
                                break;
                              default:
                            }
                          },
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem(
                                child: Text('Düzenle'),
                                value: '1',
                              ),
                              PopupMenuItem(
                                child: Text('Sil'),
                                value: '2',
                              ),
                            ];
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '27 ŞUB, 2020',
                        style: TextStyle(
                          color: koyuMavi,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          liste2[index],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Text(
                        'ORTAHİSAR, TRABZON',
                        style: TextStyle(color: koyuMavi, fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => EventComments());
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: Get.height * 0.02),
                          height: Get.height * 0.05,
                          width: Get.width * 0.3,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: kirmizi,
                          ),
                          child: Text(
                            'Yorumlar',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => Photos());
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: Get.height * 0.03),
                          height: Get.height * 0.05,
                          width: Get.width * 0.3,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: kirmizi,
                          ),
                          child: Text(
                            'Fotoğraflar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
