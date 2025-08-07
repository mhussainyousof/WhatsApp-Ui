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

  void _onLoadMessages(LoadMessages event, Emitter<ChatState> emit) async{
    emit(ChatLoading());

    _messagesSubscription?.cancel();

   await emit.forEach(
    FirebaseFirestore.instance
        .collection('chats')
        .doc(event.chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots(),
    onData: (snapshot) {
      final messages = snapshot.docs.map((doc) => doc.data()).toList();
      return ChatLoaded(messages);
    },
    onError: (error, stackTrace) {
      return ChatError(error.toString());
    },
  );

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


      await ChatService.deleteMessage(
        chatId: event.chatId,
        messageId: event.messageId,
      );
    }
  }
}
