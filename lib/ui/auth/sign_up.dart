import 'package:engelli_uygulama/config/color.dart';
import 'package:engelli_uygulama/config/widgets/close_keyboard.dart';
import 'package:engelli_uygulama/config/widgets/my_padding.dart';
import 'package:engelli_uygulama/config/widgets/style.dart';
import 'package:engelli_uygulama/config/widgets/text_form_field.dart';
import 'package:engelli_uygulama/tabs.dart';
import 'package:engelli_uygulama/ui/auth/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String email, password,name;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CloseKeyboard(
      child: MyPadding(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.08,
                    ),
                    Text(
                      'ÜYE OL',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                    ),
                    emailPart(),
                    //userNamePart(),
                    passwordPart(),
                    passwordPartAgain(),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    forgotPasswordPart(),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    signUpButtonPart(),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    Text('Ya da'),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/facebook.png',
                          height: Get.height * 0.04,
                        ),
                        SizedBox(
                          width: Get.width*0.04,
                        ),
                        Image.asset(
                          'assets/twitter.png',
                          height: Get.height * 0.04,
                        ),
                        SizedBox(
                          width: Get.width*0.04,
                        ),
                        Image.asset(
                          'assets/google-plus.png',
                          height: Get.height * 0.04,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.17,
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Hesabınız Var Mı?",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: ' Giriş Yap!',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.off(()=> LoginPage(),opaque: false);
                              },
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
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

   signUpButtonPart() {
    return GestureDetector(
      onTap: (){
        Get.off(()=>Tabs(currentTab1: 0,));
      },
      child: Container(
        height: Get.height * 0.05,
        width: Get.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: kirmizi,
        ),
        child: Text(
          'ÜYE OL',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
    );
  }

  Container forgotPasswordPart() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      alignment: Alignment.centerRight,
      child: Text(
        'Şifremi Unuttum?',
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  Column passwordPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Get.size.height * 0.04),
        Text(
          'Şifre',
          style: loginStyle,
        ),
        MyTextForm(
          hintText: 'Şifre',
          onSaved: (value) {
            password = value;
          },
          icon: Icons.lock,
        ),
      ],
    );
  }

  Column passwordPartAgain() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Get.size.height * 0.04),
        Text(
          'Şifre Tekrar',
          style: loginStyle,
        ),
        MyTextForm(
          hintText: 'Şifre Tekrar',
          onSaved: (value) {
            password = value;
          },
          icon: Icons.lock,
        ),
      ],
    );
  }


  userNamePart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Get.height * 0.04,
        ),
        Text(
          'Kullanıcı Adı',
          style: loginStyle,
        ),
        MyTextForm(
          hintText: 'Kullanıcı Adı',
          onSaved: (value) {
            email = value;
          },
          icon: FontAwesomeIcons.user,
        ),
      ],
    );
  }

  Column emailPart(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Get.height * 0.05,
        ),
        Text(
          'Email',
          style: loginStyle,
        ),
        MyTextForm(
          hintText: 'Email',
          onSaved: (value) {
            email = value;
          },
          icon: FontAwesomeIcons.envelope,
        ),
      ],
    );
  }

  void goOtherPage(){
    Get.to(() => Tabs(currentTab1: 0,));
  }
}
