import 'package:engelli_uygulama/config/color.dart';
import 'package:engelli_uygulama/ui/auth/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        backgroundColor: Colors.white,
        hintColor: textColor,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
        ),
        primaryColor: Color(0xff00a97d),
        fontFamily: GoogleFonts.capriola().fontFamily,
      ),
      home: SplashScreen(),
    );
  }
}
