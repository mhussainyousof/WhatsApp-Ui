import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whatsapp_series/Screens/Home/Calls/callsscreen.dart';
import 'package:whatsapp_series/Screens/Home/Chats/chatsscreen.dart';
import 'package:whatsapp_series/Screens/Home/communities/communities.dart';
import 'package:whatsapp_series/Screens/Home/Status/statusscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    ChatsScreen(),
    StatusScreen(),
    const CommunitiesScreen(),
    // CallsScreen(),
    CallsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.message), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Iconsax.status), label: 'Updates'),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.people), label: 'Communities'),
          BottomNavigationBarItem(icon: Icon(Iconsax.call), label: 'Calls'),
        ],
      ),
    );
  }
}
