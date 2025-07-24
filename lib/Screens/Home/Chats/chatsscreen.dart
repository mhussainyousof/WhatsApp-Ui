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
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753182655/1610430611248_kdrvcy.jpg",
      "name": "Dane Mackier",
      "lastmsg": "yes, flutter is awesome",
      "time": "07:14 AM",
      "msg": "3"
    },
    {
      "images":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753182656/1720090712577_fz1e6q.jpg",
      "name": "Muhammad Aqsam",
      "lastmsg": "Dane reacted 🌹 to ❤️",
      "time": "05:45 PM",
      "msg": "0"
    },
    // {
    //   "images":
    //       "https://images.healthshots.com/healthshots/en/uploads/2020/12/08182549/positive-person.jpg",
    //   "name": "Aron1",
    //   "lastmsg": "Flutter",
    //   "time": "06:45 AM",
    //   "msg": "1"
    // },
    {
      "images":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753182655/1681645758739_yrrvrn.jpg",
      "name": "Junaid Jameel",
      "lastmsg": "Out meeting is today.",
      "time": "12:00 PM",
      "msg": "1"
    },
    {
      "images":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753333906/1612942070030_isyhx0.jpg",
      "name": "Iqbal Ali Sultani",
      "lastmsg": "📵 Missed voice call",
      "time": "11:04 AM",
      "msg": ""
    },
    // {
    //   "images":
    //       "https://images.healthshots.com/healthshots/en/uploads/2020/12/08182549/positive-person.jpg",
    //   "name": "Aron1",
    //   "lastmsg": "Flutter",
    //   "time": "06:45 am",
    //   "msg": "1"
    // },
    // {
    //   "images":
    //       "https://digitalnectar.in/wp-content/uploads/2024/04/banner-right-img.webp",
    //   "name": "WSCUBETECH",
    //   "lastmsg": "Flutter Batch is Starting",
    //   "time": "07:45 am",
    //   "msg": "2"
    // }
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
