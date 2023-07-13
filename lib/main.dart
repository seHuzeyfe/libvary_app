import 'package:flutter/material.dart';

import 'package:libvary_app/View/profile_screen/profil_screen.dart';
//import 'package:libvary_app/View/welcome_screen/welcome_screen.dart';
//import 'package:libvary_app/constants.dart';
//import 'package:libvary_app/routs.dart';
import 'components/theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_options.dart';


void main() async {
  // firebase initilization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      /*theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        fontFamily: "Muli",
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: kTextColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),*/
      home: profilEkrani(),
     // initialRoute: WelcomeScreen.routeName,
      //routes: routes,

     theme: theme(),
      //home: WelcomeScreen(),
      //initialRoute: WelcomeScreen.routeName,
      //routes: routes,

    );
  }
}


