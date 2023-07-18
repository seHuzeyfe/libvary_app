
import 'package:flutter/material.dart';
import 'package:libvary_app/constants.dart';
import 'components/chat_body.dart';

class ChatsScreen extends StatefulWidget {
  static String routeName = "/ChatScreen";
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  //int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
    );
  }
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white24,
      automaticallyImplyLeading: false,
      title: const Text("Mesajlar"),
    );
  }
