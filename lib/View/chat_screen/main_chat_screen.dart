import 'package:flutter/material.dart';
import 'secondary_chat_screen.dart';

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
        title: Text('Mesajlar'),
      ),
      body: ListView.builder(
        itemCount: previousChats.length,
        itemBuilder: (context, index) {
          final chat = previousChats[index];
          bool isOnline = false;

          return Card(
            color: Colors.grey[300],
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    chat.substring(0, 1),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  chat,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Loren ipsum dolor sit amet',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
                trailing: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: isOnline ? Colors.green : Colors.red,
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
