abstract class ChatEvent {}

class LoadMessages extends ChatEvent {
  final String chatId;
  LoadMessages(this.chatId);
}

class SendMessage extends ChatEvent {
  final String chatId;
  final String text;
  final String sender;
  SendMessage({
    required this.chatId,
    required this.text,
    required this.sender,
  });
}

class DeleteMessage extends ChatEvent {
  final String chatId;
  final String messageId;

  DeleteMessage({required this.chatId, required this.messageId});
}
