import 'package:flutter/material.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

import '../Contact/contactscreen.dart';

class ChatsScreen extends StatelessWidget {
  var arrContent = [
    {
      "images":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753182657/1749954991539_vb9ea1.jpg",
      "name": "Haroon Mohammadi",
      "lastmsg": "📞 Voice call",
      "time": "10:45 am",
      "msg": ""
    },
    {
      "images":
          "https://images.healthshots.com/healthshots/en/uploads/2020/12/08182549/positive-person.jpg",
      "name": "Aron1",
      "lastmsg": "Flutter",
      "time": "06:45 am",
      "msg": "1"
    },
    {
      "images":
          "https://digitalnectar.in/wp-content/uploads/2024/04/banner-right-img.webp",
      "name": "WSCUBETECH",
      "lastmsg": "Flutter Batch is Starting",
      "time": "07:45 am",
      "msg": "2"
    },
    {
      "images":
          "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
      "name": "Aron",
      "lastmsg": "Lorem Ipsum",
      "time": "05:45 am",
      "msg": "7"
    },
    {
      "images":
          "https://images.healthshots.com/healthshots/en/uploads/2020/12/08182549/positive-person.jpg",
      "name": "Aron1",
      "lastmsg": "Flutter",
      "time": "06:45 am",
      "msg": "1"
    },
    {
      "images":
          "https://digitalnectar.in/wp-content/uploads/2024/04/banner-right-img.webp",
      "name": "WSCUBETECH",
      "lastmsg": "Flutter Batch is Starting",
      "time": "07:45 am",
      "msg": "2"
    },
    {
      "images":
          "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
      "name": "Aron",
      "lastmsg": "Lorem Ipsum",
      "time": "05:45 am",
      "msg": "7"
    },
    {
      "images":
          "https://images.healthshots.com/healthshots/en/uploads/2020/12/08182549/positive-person.jpg",
      "name": "Aron1",
      "lastmsg": "Flutter",
      "time": "06:45 am",
      "msg": "1"
    },
    {
      "images":
          "https://digitalnectar.in/wp-content/uploads/2024/04/banner-right-img.webp",
      "name": "WSCUBETECH",
      "lastmsg": "Flutter Batch is Starting",
      "time": "07:45 am",
      "msg": "2"
    }
  ];

  ChatsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          NetworkImage(arrContent[index]["images"].toString()),
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
                          height: 12,
                          color:
                              arrContent[index]["msg"].toString().isNotEmpty &&
                                      arrContent[index]["msg"].toString() != "0"
                                  ? const Color.fromARGB(255, 10, 160,
                                      15) 
                                  : Colors.black, // Black when no messages
                        ),
                        const SizedBox(height: 10,),
                        if (arrContent[index]["msg"].toString().isNotEmpty &&
                            arrContent[index]["msg"].toString() != "0")
                          Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor:
                                  const Color.fromARGB(255, 10, 160, 15),
                              child: UiHelper.CustomText(
                                text: arrContent[index]["msg"].toString(),
                                height: 12,
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
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContactScreen()));
          },
          child: CircleAvatar(
            radius: 30,
            backgroundColor: const Color(0XFF008665),
            child: Image.asset("assets/images/mode_comment_black_24dp 1.png"),
          ),
        ));
  }
}
