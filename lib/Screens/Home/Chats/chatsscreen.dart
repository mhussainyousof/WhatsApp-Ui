import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

import '../Contact/contactscreen.dart';

class ChatsScreen extends StatelessWidget {
  var arrContent = [
    {
      "images":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753182657/1749954991539_vb9ea1.jpg",
      "name": "Haroon Mohammadi",
      "lastmsg": "📞 Voice call",
      "time": "10:45 PM",
      "msg": ""
    },
    {
      "images":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753182657/1709202037533_c2izlp.jpg",
      "name": "Shahanaj Parvin",
      "lastmsg": "The messages timer was updated. N...",
      "time": "09:11 AM",
      "msg": ""
    },
    {
      "images":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753337065/2496097_j89oph.png",
      "name": "LinkedIn",
      "lastmsg": "We just saw your profile and went… wow, just wow🔥",
      "time": "10:23 AM",
      "msg": ""
    },
    {
      "images":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753182655/1610430611248_kdrvcy.jpg",
      "name": "Dane Mackier",
      "lastmsg": "yes, flutter is awesome",
      "time": "07:14 AM",
      "msg": "3"
    },
    {
      "images":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753333906/1612942070030_isyhx0.jpg",
      "name": "Iqbal Ali Sultani",
      "lastmsg": "📵 Missed voice call",
      "time": "11:04 AM",
      "msg": ""
    },
    {
      "images":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753182656/1720090712577_fz1e6q.jpg",
      "name": "Muhammad Aqsam",
      "lastmsg": "Dane reacted 🌹 to ❤️",
      "time": "05:45 PM",
      "msg": "0"
    },
    {
      "images":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753182655/1681645758739_yrrvrn.jpg",
      "name": "Junaid Jameel",
      "lastmsg": "Our meeting is today.",
      "time": "12:00 PM",
      "msg": "1"
    },
  ];

  ChatsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "WhatsApp",
          style: TextStyle(
            color: Color.fromARGB(255, 7, 156, 62),
            fontWeight: FontWeight.bold,
            fontSize: 20,
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
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.black87),
            onSelected: (value) {
              debugPrint("Selected: $value");
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: 'new_group',
                child: Row(
                  children: [
                    Icon(Iconsax.user_add, color: Colors.black54, size: 20),
                    SizedBox(width: 10),
                    Text('New group'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'new_community',
                child: Row(
                  children: [
                    Icon(Iconsax.people, color: Colors.black54, size: 20),
                    SizedBox(width: 10),
                    Text('New community'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'new_broadcast',
                child: Row(
                  children: [
                    Icon(Iconsax.send_2, color: Colors.black54, size: 20),
                    SizedBox(width: 10),
                    Text('New broadcast'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'linked_devices',
                child: Row(
                  children: [
                    Icon(Iconsax.monitor, color: Colors.black54, size: 20),
                    SizedBox(width: 10),
                    Text('Linked devices'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'starred',
                child: Row(
                  children: [
                    Icon(Iconsax.star, color: Colors.black54, size: 20),
                    SizedBox(width: 10),
                    Text('Starred'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'read_all',
                child: Row(
                  children: [
                    Icon(Iconsax.tick_circle, color: Colors.black54, size: 20),
                    SizedBox(width: 10),
                    Text('Read all'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'settings',
                child: Row(
                  children: [
                    Icon(Iconsax.setting_2, color: Colors.black54, size: 20),
                    SizedBox(width: 10),
                    Text('Settings'),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  leading: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: index == 1 || index == 3
                            ? Border.all(
                                color: const Color(0xFF25D366), width: 2)
                            : null),
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: arrContent[index]["images"].toString(),
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  title: UiHelper.CustomText(
                      text: arrContent[index]["name"].toString(),
                      height: 14,
                      fontweight: FontWeight.bold),
                  subtitle: UiHelper.CustomText(
                      text: arrContent[index]["lastmsg"].toString(),
                      height: 13,
                      color: const Color(0XFF889095)),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UiHelper.CustomText(
                        text: arrContent[index]["time"].toString(),
                        height: 10,
                        color: arrContent[index]["msg"].toString().isNotEmpty &&
                                arrContent[index]["msg"].toString() != "0"
                            ? const Color.fromARGB(255, 10, 160, 15)
                            : Colors.black,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (arrContent[index]["msg"].toString().isNotEmpty &&
                          arrContent[index]["msg"].toString() != "0")
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: CircleAvatar(
                            radius: 9,
                            backgroundColor:
                                const Color.fromARGB(255, 10, 160, 15),
                            child: UiHelper.CustomText(
                              text: arrContent[index]["msg"].toString(),
                              height: 11,
                              color: const Color(0XFFFFFFFF),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
              itemCount: arrContent.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ContactScreen()));
        },
        backgroundColor: const Color.fromARGB(255, 13, 158, 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: const Icon(Iconsax.message_add_15, color: Colors.white),
      ),
    );
  }
}
