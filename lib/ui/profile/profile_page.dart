import 'package:cached_network_image/cached_network_image.dart';
import 'package:engelli_uygulama/config/color.dart';
import 'package:engelli_uygulama/config/widgets/profile_boxes.dart';
import 'package:engelli_uygulama/ui/profile/past_events.dart';
import 'package:engelli_uygulama/ui/profile/photos.dart';
import 'package:engelli_uygulama/ui/profile/complain.dart';
import 'package:engelli_uygulama/ui/profile/edit_profile.dart';
import 'package:engelli_uygulama/ui/profile/hobies.dart';
import 'package:engelli_uygulama/ui/profile/user_comments.dart';
import 'package:engelli_uygulama/ui/profile/user_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _sizedBox = SizedBox(
    height: Get.height * 0.02,
  );

  bool me = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kirmizi,
        body: SingleChildScrollView(
          child: SizedBox(
            height: Get.height + Get.height * 0.38,
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (!me)
                  Positioned(
                    right: Get.width * 0.06,
                    top: Get.height * 0.04,
                    child: PopupMenuButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                      onSelected: (value) {
                        switch (value) {
                          case '1':

                            break;
                          case '2':
                            Get.to(() => Complain());
                            break;
                          default:
                            Get.to(() => ProfilePage());
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(
                            child: Text('Mesaj At'),
                            value: '1',
                          ),
                          PopupMenuItem(
                            child: Text('Şikayet Et'),
                            value: '2',
                          ),
                        ];
                      },
                    ),
                  ),
                if (me)
                  Positioned(
                    left: Get.width * 0.07,
                    top: Get.height * 0.04,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                if (me)
                  Positioned(
                    right: Get.width * 0.07,
                    top: Get.height * 0.04,
                    child: GestureDetector(
                      onTap: (){
                        Get.to(()=> EditProfile());
                      },
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                Container(
                  margin: EdgeInsets.only(top: Get.height * 0.15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider('https://images.unsplash.com/photo-1608415295464-b5de23d21f59?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80'),
                      radius: Get.height * 0.1,
                    ),
                    _sizedBox,
                    Text(
                      'İstanbul',
                      style: TextStyle(fontSize: 20, color: koyuMavi),
                    ),
                    _sizedBox,
                    Text(
                      'Berk Yıldız',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    _sizedBox,
                    Wrap(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.05),
                          child: Text(
                            'Paragraf, herhangi bir yazının bir satır başından öteki satır başına kadar olan bölümüne denir. Daha geniş bir ifadeyle, paragraf "bir duyguyu, bir düşünceyi, bir isteği, bir durumu, bir öneriyi, olayın bir yönünü, yalnızca bir yönüyle anlatım tekniklerin­den ve düşünceyi geliştirme yollarından yararlanarak anlatan yazı türüdür. Kelimeler cümleleri, cümleler paragrafları, paragraflar da yazıları oluşturur.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12, letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                    _sizedBox,
                    _sizedBox,
                    _sizedBox,
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(onTap: (){
                            Get.to(()=>Hobies());
                          },child: ProfileBoxes(title: 'Hobiler', count: '10',photos:'assets/hobiler.png',color:Colors.orange),),
                          GestureDetector(onTap: (){
                            Get.to(()=> PastEvents());
                          },child: ProfileBoxes(title: 'Geçmiş Etkinlikler', count: '15',photos:'assets/past.png',color:Colors.green),),
                          GestureDetector(onTap: (){
                            Get.to(()=> UserEvents());
                          },child: ProfileBoxes(title: 'Etkinliklerim', count: '15',photos:'assets/etkinliklerim.png',color:Colors.red),),
                          GestureDetector(onTap: (){
                            Get.to(()=>UserComments());
                          },child: ProfileBoxes(title: 'Yorumlar', count: '24',photos:'assets/comments.png',color:Colors.yellow),),
                          GestureDetector(onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Photos()));
                          },child: ProfileBoxes(title: 'Fotoğraflar', count: '124',photos:'assets/gallery.png',color:Colors.blue))
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
Container(
          width: Get.width,
          height: Get.height,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.blue,
                    height: 200,
                    width: Get.width,
                    alignment: Alignment.center,
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        5,
                        (index) => Container(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/football.jpg',
                                height: 100,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Futbol')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 100,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/profil.jfif'),
                      radius: Get.height * 0.1,
                    ),
                    _sizedBox,
                    Text(
                      'Mehmet Aksoy',
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                    ),
                   Text('42343fdsopfd sdfpğlsfd sdf sdfğlpdsdf'),
                   /*
                    Text(
                      'Paragraf, herhangi bir yazının bir satır başından öteki satır başına kadar olan bölümüne denir. Daha geniş bir ifadeyle, paragraf "bir duyguyu, bir düşünceyi, bir isteği, bir durumu, bir öneriyi, olayın bir yönünü, yalnızca bir yönüyle anlatım tekniklerin­den ve düşünceyi geliştirme yollarından yararlanarak anlatan yazı türüdür. Kelimeler cümleleri, cümleler paragrafları, paragraflar da yazıları oluşturur. Paragraf bir yazının küçültülmüş bir örneğidir. Bu yönüyle yapı bakımından bir yazıya benzer.',
                      style: TextStyle(fontSize: 12),
                    ),
                    */

                    _sizedBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'İlgi Alanları',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
 */
