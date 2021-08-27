import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Photos extends StatefulWidget {
  const Photos({Key key}) : super(key: key);

  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Fotoğraflar',style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add),)
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(bottom: Get.height*0.04),
          child: CachedNetworkImage(
            width: Get.width,
            imageUrl:
                'https://thumbor.forbes.com/thumbor/trim/0x112:960x954/fit-in/711x623/smart/https://specials-images.forbesimg.com/imageserve/5e6e26d9aa5428000759e96c/women-washing-purple-water-lilies-in-Vietnam/0x0.jpg',
          ),
        ),
      ),
    );
  }
}
