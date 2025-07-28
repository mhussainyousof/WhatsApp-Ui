import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_series/Screens/Home/homescreen.dart';
import 'package:whatsapp_series/firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_series/Screens/Home/homescreen.dart';
import 'package:whatsapp_series/firebase_options.dart';
import 'package:whatsapp_series/sender_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String currentSender = "unknown";

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

  void _setSender(String sender) async {
    await SenderManager.setSender(sender);
    setState(() {
      currentSender = sender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF25D366)),
        useMaterial3: false,
        fontFamily: "Regular",
      ),
      home: currentSender == "unknown"
          ? Scaffold(
              appBar: AppBar(title: const Text("Select Sender")),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _setSender("phone"),
                      child: const Text("Set as Phone"),
                    ),
                    ElevatedButton(
                      onPressed: () => _setSender("emulator"),
                      child: const Text("Set as Emulator"),
                    ),
                  ],
                ),
              ),
            )
          : const HomeScreen(),
    );
  }
}

