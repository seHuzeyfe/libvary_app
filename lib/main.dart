import 'package:flutter/material.dart';
import 'package:libvary_app/View/welcome_screen/welcome_screen.dart';
import 'package:libvary_app/routs.dart';
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
      theme: theme(),
      //home: WelcomeScreen(),
      initialRoute: WelcomeScreen.routeName,
      routes: routes,
    );
  }
}
