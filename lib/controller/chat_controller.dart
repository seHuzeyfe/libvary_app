import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/chat.dart';
import '../Model/message.dart';

Future<void> fetchChatsDataFromFirestore() async {
  try {
    final collectionSnapshot =
    await FirebaseFirestore.instance.collection('chats').get();

    chatsData = collectionSnapshot.docs.map((doc) {
      final data = doc.data();
      return Chat(
        name: data['name'],
        lastMessage: data['lastMessage'],
        image: data['image'],
        time: data['time'],
        isActive: data['isActive'],
      );
    }).toList();
  } catch (e) {
    // Handle any errors here
    print('Error fetching chat data: $e');
  }
}

Future<void> fetchChatMessagesFromFirestore(String chatId) async {
  try {
    final collectionSnapshot = await FirebaseFirestore.instance
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp')
        .get();

    var demoChatMessages = collectionSnapshot.docs.map((doc) {
      final data = doc.data();
      return ChatMessage(
        text: data['text'],
        messageType: data['messageType'],
        messageStatus: data['messageStatus'],
        isSender: data['isSender'],
      );
    }).toList();
  } catch (e) {
    print('Error fetching chat messages: $e');
  }
}