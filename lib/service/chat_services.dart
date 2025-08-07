import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> sendMessage({
    required String chatId,
    required String text,
    required String sender,
  }) async {
    //! Avoid sending empty messages
    if (text.trim().isEmpty) return; 

    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add({
      'text': text.trim(),
      'sender': sender,
      //! Use server time for consistency
      'timestamp': FieldValue.serverTimestamp(), 
    });
  }

  static Future<void> deleteMessage({
    required String chatId,
    required String messageId,
  }) async {
    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .doc(messageId)
        .delete();
  }

  static Stream<QuerySnapshot> getMessages(String chatId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        //! Show latest messages first
        .orderBy('timestamp', descending: true) 
        //! Return live updates (real-time stream)
        .snapshots(); 
  }
}
