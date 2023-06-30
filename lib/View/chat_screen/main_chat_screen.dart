import 'package:flutter/material.dart';
import "secondary_chat_screen.dart";

class ChatListScreen extends StatelessWidget {
  final List<String> previousChats = [
    'Name 1',
    'Name 2',
    'Name 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: ListView.builder(
        itemCount: previousChats.length,
        itemBuilder: (context, index) {
          final chat = previousChats[index];
          return Card(
            color: Colors.grey[300],
            child: Padding(
              padding: EdgeInsets.all(5.0),

              child: ListTile(
                title: Text(
                  chat,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(chatTitle: chat),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}