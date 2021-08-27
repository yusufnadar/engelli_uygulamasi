import 'package:engelli_uygulama/config/color.dart';
import 'package:engelli_uygulama/config/widgets/close_keyboard.dart';
import 'package:engelli_uygulama/config/widgets/my_padding.dart';
import 'package:engelli_uygulama/config/widgets/style.dart';
import 'package:engelli_uygulama/config/widgets/text_form_field.dart';
import 'package:engelli_uygulama/tabs.dart';
import 'package:engelli_uygulama/ui/auth/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password;
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
                      'Giriş Yap',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                    ),
                    emailPart(),
                    passwordPart(),
                    forgotPasswordPart(),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    loginButtonPart(),
                    SizedBox(
                      height: Get.height * 0.07,
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
                      height: Get.height * 0.27,
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Hesabınız Yok Mu?",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: ' Kaydol!',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.off(()=> SignUp(),opaque: false);
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector loginButtonPart() {
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
          'Giriş Yap',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
    );
  }

  Widget forgotPasswordPart() {
    return GestureDetector(
      onTap: (){
        //Get.to(()=> ForgotPassword());
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: Get.height*0.018),
        alignment: Alignment.centerRight,
        child: Text(
          'Şifremi Unuttum',
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }

  Column passwordPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Get.size.height * 0.03),
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

  emailPart() {
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
          icon: FontAwesomeIcons.user,
        ),
      ],
    );
  }

  void goOtherPage() {
    Get.to(() => Tabs(
          currentTab1: 1,
        ));
  }
}
