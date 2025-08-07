import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whatsapp_series/Widgets/chat_bubble.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_series/chat_bloc/chat_bloc.dart';
import 'package:whatsapp_series/chat_bloc/chat_event.dart';
import 'package:whatsapp_series/chat_bloc/chat_state.dart';
import 'package:whatsapp_series/sender_manager.dart';
import 'package:whatsapp_series/service/chat_services.dart';

class ChatsPage extends StatefulWidget {
  final String name;
  final String imageUrl;

  const ChatsPage({super.key, required this.name, required this.imageUrl});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  String currentSender = "unknown";
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSender();
  }

  Future<void> _loadSender() async {
    final sender = await SenderManager.getSender();
    setState(() {
      currentSender = sender;
    });
  }

  String get chatId => widget.name.toLowerCase().replaceAll(" ", "_");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromARGB(255, 245, 237, 237),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                CircleAvatar(
                  radius: 18,
                  backgroundImage: CachedNetworkImageProvider(
                    widget.imageUrl,
                  ),
                ),
                const SizedBox(width: 5),
                UiHelper.CustomText(
                  text: widget.name,
                  height: 15,
                  color: Colors.black,
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Iconsax.video,
                  color: Colors.black,
                  size: 22,
                ),
                SizedBox(width: 20),
                Icon(
                  Iconsax.call,
                  color: Colors.black,
                  size: 22,
                ),
                SizedBox(width: 15),
                Icon(Icons.more_vert, color: Colors.black),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753681991/240319-gaza-famine-vertical-ch-1130-df83bd_kagc1y.webp"),
                    fit: BoxFit.cover)),
          ),
          Column(
            children: [
              Expanded(
                child: 
                BlocBuilder<ChatBloc, ChatState>(
                  builder: (context, state) {
                    if (state is ChatLoading){
                              return const Center(child: CircularProgressIndicator());

                    } else if (state is ChatLoaded){
                      final messages = state.messages;
                      if(messages.isEmpty){
                        return const Center(child: Text('There is no message yet'),);
                      }
                    return ListView.builder(
                      reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final msg = messages[index];
                        final text = msg['text'] ?? '';
                        final isUser = msg['sender'] == currentSender;

                        return ChatBubble(
                          text: text,
                          isUser: isUser,
                          onLongPress: () => context.read<ChatBloc>().add( DeleteMessage(messageId: msg['id'], chatId: chatId))
                          
                         
                        );
                      },
                    );
                    }
                    else if (state is ChatError) {
                      return Center(child: Text("Error: ${state.message}"));
                    }
                    return const SizedBox();
                  },
                )
              ),

             
              SafeArea(
                top: false,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40)),
                        child: Row(
                          children: [
                            const Icon(
                              Iconsax.emoji_happy,
                              size: 20,
                            ),
                            Expanded(
                              child: TextField(
                                controller: _messageController,
                                decoration: InputDecoration(
                                  hintText: "Message",
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                onSubmitted: (_) async {
                                  if (_messageController.text
                                      .trim()
                                      .isNotEmpty) {
                                   context.read<ChatBloc>().add(SendMessage(chatId: chatId, text: _messageController.text
                                      .trim(), sender: currentSender));
                                    _messageController.clear();
                                  }
                                },
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Iconsax.attach_circle,
                                  color: Colors.grey),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Iconsax.camera,
                                  color: Colors.grey),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      mini: true,
                      onPressed: () {
                          final text = _messageController.text.trim();
                        if (text.isNotEmpty) {
                          context.read<ChatBloc>().add(
                            SendMessage(
                              chatId: chatId,
                              text: text,
                              sender: currentSender,
                            ),
                          );
                          _messageController.clear();
                        }
                      }


                      // => ChatService.sendMessage(
                      //   chatId: chatId,
                      //   text: _messageController.text,
                      //   sender: currentSender,
                      // ),
                      // backgroundColor: const Color(0XFF1DAB61),
                      // child: const Icon(
                      //   Icons.send,
                      //   size: 22,
                      // ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
