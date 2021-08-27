import 'package:cached_network_image/cached_network_image.dart';
import 'package:engelli_uygulama/config/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class EventDetail extends StatefulWidget {
  final index;

  EventDetail({Key key, this.index}) : super(key: key);

  @override
  _EventDetailState createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: widget.index,
                  child: Image.asset(
                    'assets/a1.jpg',
                    width: Get.width,
                    height: Get.height*0.3,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios,),
                    color: Colors.white,
                    onPressed: (){
                      Get.back();
                    },
                  ),
                  top: 40,
                  left: 20,
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Festival of the Arts 2020',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: Get.height * 0.01, bottom: Get.height * 0.02),
                    child: Text(
                      '27 ŞUB, 2020',
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'ORTAHİSAR, TRABZON',
                    style:
                        TextStyle(color: grimsi, fontSize: 12),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    'Paragraf, herhangi bir yazının bir satır başından öteki satır başına kadar olan bölümüne denir. Daha geniş bir ifadeyle, paragraf "bir duyguyu, bir düşünceyi, bir isteği, bir durumu, bir öneriyi, olayın bir yönünü, yalnızca bir yönüyle anlatım tekniklerin­den ve düşünceyi geliştirme yollarından yararlanarak anlatan yazı türüdür. Kelimeler cümleleri, cümleler paragrafları, paragraflar da yazıları oluşturur. Paragraf bir yazının küçültülmüş bir örneğidir. Bu yönüyle yapı bakımından bir yazıya benzer.',
                    style: TextStyle(letterSpacing: 1),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    'Katılanlar',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Container(
                    width: Get.width,
                    height: Get.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            FaIcon(FontAwesomeIcons.check,color:turkuaz ,),
                            SizedBox(width: 10,),
                            Text('7/7 katılanlar'),
                          ],
                        ),
                        Row(
                          children: [
                            ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder: (context, index) => Container(
                                margin: EdgeInsets.only(right: 5),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: CachedNetworkImageProvider(
                                    'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG98ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: acikMavi,
                              child: Container(margin: EdgeInsets.only(bottom: 5),child: Text('+3',style: TextStyle(color: Colors.white),),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Etkinlik Sorumlusu',style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('Berk Gizem')
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: Get.width*0.25,
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                        decoration: BoxDecoration(color: kirmizi,borderRadius: BorderRadius.circular(15)),
                        child: Text('Katıl',style: TextStyle(color: Colors.white,fontSize: 18),),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
