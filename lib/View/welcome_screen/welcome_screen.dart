import 'package:flutter/material.dart';
import 'package:libvary_app/View/welcome_screen/components/welcome_screen_body.dart';
import 'package:libvary_app/size_config.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName = "/welcomeScreen";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      backgroundColor: Colors.white,
    );
  }
}
