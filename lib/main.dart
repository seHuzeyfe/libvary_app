import 'package:flutter/material.dart';
import 'package:libvary_app/View/welcome_screen/welcome_screen.dart';
import 'package:libvary_app/routs.dart';
import 'theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      //home: WelcomeScreen(),
      initialRoute: WelcomeScreen.routeName,
      routes: routes,
    );
  }
}


