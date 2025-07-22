import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whatsapp_series/Screens/Home/Calls/callsscreen.dart';
import 'package:whatsapp_series/Screens/Home/Camera/camerascreen.dart';
import 'package:whatsapp_series/Screens/Home/Chats/chatsscreen.dart';
import 'package:whatsapp_series/Screens/Home/Status/statusscreen.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           bottom: const TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.camera_alt),
//               ),
//               Tab(
//                 text: "CHATS",
//               ),
//               Tab(
//                 text: "STATUS",
//               ),
//               Tab(
//                 text: "CALLS",
//               )
//             ],
//             indicatorColor: Colors.white,
//           ),
//           toolbarHeight: 100,
//           title: UiHelper.CustomText(
//               text: "WhatsApp", height: 20, color: Colors.white,fontweight: FontWeight.bold),
//           actions: [
//             IconButton(
//                 onPressed: () {},
//                 icon: Image.asset("assets/images/Search.png")),
//             IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_sharp))
//           ],
//         ),
//         body: TabBarView(children: [
//           CameraScreen(),
//           ChatsScreen(),
//           StatusScreen(),
//           CallsScreen()
//         ]),
//       ),
//     );
//   }
// }


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

    final List<Widget> _screens = [
      ChatsScreen(),
      StatusScreen(), // Rename to UpdatesScreen if you want
      // CommunitiesScreen(),
      CallsScreen(),
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "WhatsApp",
          style: TextStyle(
            color: Color(0XFF25D366),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt_outlined, color: Colors.black87),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black87),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.black87),
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
       items: const [
    BottomNavigationBarItem(icon: Icon(Iconsax.message), label: 'Chats'),
    BottomNavigationBarItem(icon: Icon(Iconsax.status), label: 'Updates'),
    BottomNavigationBarItem(icon: Icon(Iconsax.people), label: 'Communities'),
    BottomNavigationBarItem(icon: Icon(Iconsax.call), label: 'Calls'),
  ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 13, 158, 18),
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15) ),
        child: const Icon(Iconsax.message_add_15, color: Colors.white),
      ),
    );
  }
}
