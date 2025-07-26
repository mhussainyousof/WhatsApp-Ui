import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class CallsScreen extends StatelessWidget {
  var callContent = [
    {
      "name": "Haroon Mohammadi",
      "img":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753182657/1749954991539_vb9ea1.jpg",
      "calltime": "⇙ Today, 9:42 AM"
    },
    {
      "name": "Iqbal Ali Sultani",
      "img":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753333906/1612942070030_isyhx0.jpg",
      "calltime": "⇗ Yesterday, 9:59 AM"
    },
    {
      "name": "Shahanaj Parvi",
      "img":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753182657/1709202037533_c2izlp.jpg",
      "calltime": "⇗ Today, 8:02 AM"
    },
    {
      "name": "Dane Mackier",
      "img":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753182655/1610430611248_kdrvcy.jpg",
      "calltime": "⇙ July 24, 9:42 PM"
    },
    {
      "name": "Muhammad Aqsam",
      "img":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753182656/1720090712577_fz1e6q.jpg",
      "calltime": "⇙ July 27, 9:20 PM"
    },
    {
      "name": "Junaid Jameel",
      "img":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753182655/1681645758739_yrrvrn.jpg",
      "calltime": "⇙ Sep 27, 10:20 AM"
    }
  ];

  CallsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title:
            UiHelper.CustomText(text: 'Calls', height: 18, color: Colors.black),
        actions: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.more_vert, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            UiHelper.CustomText(
                text: 'Favorites',
                height: 16,
                fontweight: FontWeight.bold,
                color: Colors.black),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(17),
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      color: const Color(0XFF1DAB61),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                UiHelper.CustomText(
                    text: "Add Favorite",
                    height: 15,
                    color: Colors.black,
                    fontweight: FontWeight.bold),
              ],
            ),
            UiHelper.CustomText(
                text: "Recent",
                height: 16,
                fontweight: FontWeight.bold,
                color: Colors.black),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          NetworkImage(callContent[index]["img"].toString()),
                    ),
                    title: UiHelper.CustomText(
                        text: callContent[index]["name"].toString(),
                        height: 14,
                        //! fontweight: FontWeight.bold,

                        color: Colors.black),
                    subtitle: UiHelper.CustomText(
                        text: callContent[index]["calltime"].toString(),
                        height: 14),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          size: 23,
                          Iconsax.call,
                          color: Colors.black,
                        )),
                  );
                },
                itemCount: callContent.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
