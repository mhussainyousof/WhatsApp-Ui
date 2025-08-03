// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:whatsapp_series/sender_manager.dart';

// class ChatController {
//   final String chatId;
//   String currentSender = "unknown";

//   ChatController({required this.chatId});

//   Future<void> loadSender() async {
//     currentSender = await SenderManager.getSender();
//   }

//   Future<void> sendMessage(String text) async {
//     if (text.trim().isEmpty) return;

//     await FirebaseFirestore.instance
//         .collection('chats')
//         .doc(chatId)
//         .collection('messages')
//         .add({
//       'text': text.trim(),
//       'sender': currentSender,
//       'timestamp': FieldValue.serverTimestamp(),
//     });
//   }

//   Future<void> deleteMessage(String messageId) async {
//     await FirebaseFirestore.instance
//         .collection('chats')
//         .doc(chatId)
//         .collection('messages')
//         .doc(messageId)
//         .delete();
//   }

//   Stream<QuerySnapshot> getMessageStream() {
//     return FirebaseFirestore.instance
//         .collection('chats')
//         .doc(chatId)
//         .collection('messages')
//         .orderBy('timestamp', descending: true)
//         .snapshots();
//   }
// }
