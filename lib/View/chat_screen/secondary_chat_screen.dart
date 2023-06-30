import 'package:flutter/material.dart';
class ChatScreen extends StatefulWidget {
  final String chatTitle;

  ChatScreen({required this.chatTitle});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, dynamic>> messages = [];
  TextEditingController textEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();
  bool isSent = true;

  void sendMessage(String message) {
    setState(() {
      messages.insert(
        0,
        {
          'message': message,
          'isSent': isSent,
        },
      );
    });
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chatTitle),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isSent = message['isSent'];
                final messageAlignment = isSent ? Alignment.bottomRight : Alignment.bottomLeft;
                final messageColor = isSent ? Colors.indigo : Colors.grey[300];
                final messageTextColor = isSent ? Colors.white : Colors.black;
                final messageFontSize = isSent ? 16.0 : 18.0;

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  child: Align(
                    alignment: messageAlignment,
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSent ? messageColor : Colors.grey[300], // Update messageColor when isSent is true
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        message['message'],
                        style: TextStyle(
                          color: messageTextColor,
                          fontSize: messageFontSize,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    onChanged: (value) {
                      // Handle text field changes
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter a message...',
                    ),
                  ),
                ),
                Switch(
                  value: isSent,
                  onChanged: (value) {
                    setState(() {
                      isSent = value;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String message = textEditingController.text;
                    sendMessage(message);
                    textEditingController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}