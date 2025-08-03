import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isUser;
  final VoidCallback onLongPress;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isUser,
    required this.onLongPress,
  });
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onLongPress: onLongPress,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
            color: isUser ? const Color(0XFFD8FDD2) : Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
