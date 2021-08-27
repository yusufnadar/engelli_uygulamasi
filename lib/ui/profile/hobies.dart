import 'package:engelli_uygulama/config/color.dart';
import 'package:engelli_uygulama/config/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Hobies extends StatefulWidget {
  const Hobies({Key key}) : super(key: key);

  @override
  _HobiesState createState() => _HobiesState();
}

class _HobiesState extends State<Hobies> {
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
    'Diğer'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Hobiler',style: TextStyle(color: koyuMavi),),
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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            width: Get.width,
            child: Wrap(
              spacing: 15,
              runSpacing: 10,
              alignment: WrapAlignment.start,
              children: List.generate(
                liste.length,
                (index) => ActionChip(
                  backgroundColor: index % 2 == 0 ? kirmizi : Colors.grey.shade300,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                  label: Text(
                    liste[index],
                    style: TextStyle(fontSize: 13, color: index % 2 == 1 ? Colors.black : beyaz),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
