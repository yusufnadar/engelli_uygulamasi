import 'package:engelli_uygulama/ui/edit_comment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserComments extends StatefulWidget {
  const UserComments({Key key}) : super(key: key);

  @override
  _UserCommentsState createState() => _UserCommentsState();
}

class _UserCommentsState extends State<UserComments> {
  var liste = <String>[
    'Harika bir insan, gerçekten zaman geçirmek çok keyifliydi',
    'Bence biraz fazla egolu ama yine de çok cömert ve insanlara yardım ediyor, 4 yıldızı hakediyor'
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
          'Yorumlar',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
          child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(flex: 6,child: Text(liste[index])),
                      Expanded(
                        flex: 1,
                        child: PopupMenuButton(
                          onSelected: (value) {
                            switch (value) {
                              case '1':
                                Get.to(()=> EditComment());
                                break;
                              case '2':

                                break;
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

                ],
              ),
            ),
          ),
        ),
        itemCount: liste.length,
      ),
    );
  }
}
