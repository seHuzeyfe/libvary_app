import 'package:flutter/material.dart';
import 'package:libvary_app/size_config.dart';
import 'components/sign_up_screen_body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/SignUpScreen";
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(95)),
            child: Text("Kayıt Ol")),
      ),
      body: Body(),
    );
  }
}