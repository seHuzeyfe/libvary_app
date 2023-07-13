import 'package:flutter/material.dart';
import 'components/main_screen_body.dart';
import '../../size_config.dart';

class MainScreen extends StatelessWidget {
  static String routeName = "/MainScreen";
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(95)),
            child: Text("Ana Sayfa")),
      ),
      body: Body(),

    );
  }
}


