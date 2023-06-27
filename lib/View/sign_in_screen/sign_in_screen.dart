import 'package:flutter/material.dart';
import 'package:libvary_app/size_config.dart';
import 'components/sig_in_screen_body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/SignInScreen";
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(95)),
            child: Text("Giriş Yap")),
      ),
      body: Body(),
    );
  }
}
