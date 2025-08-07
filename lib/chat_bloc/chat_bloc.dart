import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:whatsapp_series/service/chat_services.dart';
import 'chat_event.dart';
import 'chat_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {

  ChatBloc() : super(ChatInitial()) {
    on<LoadMessages>(_onLoadMessages);
    on<SendMessage>(_onSendMessage);
    on<DeleteMessage>(_onDeleteMessage);
  }

  StreamSubscription? _messagesSubscription;

  void _onLoadMessages(LoadMessages event, Emitter<ChatState> emit) {
    emit(ChatLoading());

    _messagesSubscription?.cancel();

    _messagesSubscription = FirebaseFirestore.instance
        .collection('chats')
        .doc(event.chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((snapshot) {
      final messages = snapshot.docs.map((doc) => doc.data()).toList();
      emit(ChatLoaded(messages));
    }, onError: (error) {
      emit(ChatError(error.toString()));
    });
  }

  @override
  Future<void> close() {
    _messagesSubscription?.cancel();
    return super.close();
  }

   Future<void> _onSendMessage(SendMessage event, Emitter<ChatState> emit) async {
    await ChatService.sendMessage(
      chatId: event.chatId,
      text: event.text,
      sender: event.sender,
    );
  }

   Future<void> _onDeleteMessage(DeleteMessage event, Emitter<ChatState> emit) async {
    if (state is ChatLoaded) {
      // فرض می‌کنیم chatId ذخیره شده یا می‌تونیم از state بگیریم. اگر نه باید پاس بدیم
      // ساده برای مثال، فرض می‌کنیم chatId رو به متغیر ذخیره کردیم
      const chatId = "your_chat_id_here"; // باید جایگزین کنی یا مدیریت کنی

      await ChatService.deleteMessage(
        chatId: chatId,
        messageId: event.messageId,
      );
    }
  }
}
