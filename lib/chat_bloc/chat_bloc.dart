import 'dart:async';
import 'package:bloc/bloc.dart';
import 'chat_event.dart';
import 'chat_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<LoadMessages>(_onLoadMessages);
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
}
