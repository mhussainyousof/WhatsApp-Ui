import 'package:shared_preferences/shared_preferences.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SenderManager {
  static const String _keySender = "current_sender";

  /// ذخیره senderId
  static Future<void> setSender(String sender) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keySender, sender);
  }

  /// گرفتن senderId
  static Future<String> getSender() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keySender) ?? "unknown";
  }
}
