import 'package:flutter/material.dart';
import 'package:libvary_app/View/welcome_screen/welcome_screen.dart';
import 'package:libvary_app/controller/chat_controller.dart';
import 'package:libvary_app/routs.dart';
import 'components/theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controller/book_controller.dart';
import 'firebase/firebase_options.dart';

void main() async {
  // firebase initilization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await fetchBook();
  await fetchChatsDataFromFirestore();
  final chatId = 'chat1'; // Provide the ID of the chat you want to fetch messages for
  await fetchChatMessagesFromFirestore(chatId);
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
