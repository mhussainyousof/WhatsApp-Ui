import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

// class StatusScreen extends StatelessWidget {
//   var statusContent=[
//     {
//       "img":"https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg",
//       "name":"Micheal",
//       "statustime":"15 min ago"
//     },
//     {
//       "img":"https://static.vecteezy.com/system/resources/thumbnails/047/462/757/small/positive-man-on-clean-background-photo.jpg",
//       "name":"Franklin",
//       "statustime":"1 day ago"
//     },
//     {
//       "img":"https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-simon-robben-55958-614810.jpg&fm=jpg",
//       "name":"Trevor",
//       "statustime":"1 hr ago"
//     },
//   ];

//   StatusScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//       children: [
//         const SizedBox(
//           height: 30,
//         ),
//         Row(
//           children: [
//             const SizedBox(
//               width: 20,
//             ),
//             UiHelper.CustomText(text: "Status", height: 20)
//           ],
//         ),
//         //! sized box
//         const SizedBox(
//           height: 10,
//         ),
//         ListTile(
//           leading: const Padding(
//             padding: EdgeInsets.only(left: 5),
//             child: Stack(
//               children:[ CircleAvatar(
//                 radius: 25,
//                 backgroundImage: NetworkImage(
//                     "https://st3.depositphotos.com/9998432/13335/v/450/depositphotos_133352156-stock-illustration-default-placeholder-profile-icon.jpg"),
//               ),
//                Positioned(
//                  bottom: 0,
//                  right: 0,
//                  child: CircleAvatar(
//                    radius: 10,
//                    backgroundColor: Color(0XFF008069),
//                    child:  Center(child: Icon(Icons.add,color: Color(0XFFFFFFFF),size: 15,)),
//                  ),
//                )
//             ]
//             ),
//           ),
//           title: UiHelper.CustomText(text: "My Status", height: 20),
//           subtitle: UiHelper.CustomText(text: "Tap to add status update", height: 15),
//         ),
//         const SizedBox(height: 20,),
//         Padding(
//           padding: const EdgeInsets.only(left: 20,right: 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [

//             UiHelper.CustomText(text: "Recent updates", height: 15),
//             const Icon(Icons.arrow_drop_down,color: Color(0XFF5E5E5E),)
//           ],),
//         ),
//         const SizedBox(height: 10,),
//         Expanded(
//           child: ListView.builder(itemBuilder: (context,index){
//             return ListTile(
//               leading: CircleAvatar(
//                 backgroundImage: NetworkImage(statusContent[index]["img"].toString()),

//               ),
//               title: UiHelper.CustomText(text: statusContent[index]["name"].toString(), height: 16,fontweight: FontWeight.bold),
//               subtitle: UiHelper.CustomText(text: statusContent[index]["statustime"].toString(), height: 14),
//             );
//           },itemCount: statusContent.length,),
//         )
//       ],
//     ));
//   }
// }

class StatusScreen extends StatelessWidget {
  final List<Map<String, String>> stories = [
    {
      "image":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1748630948/images/ba99d82e-2be4-468b-b704-d6895e017d24.jpg",
      "name": "Jhon",
    },
    {
      "image":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753182657/1709202037533_c2izlp.jpg",
      "name": "Rabani",
    },
    {
      "image":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1746895831/profile_images/9E0PYa9MZSRAOEKl9dE1xnZQjI83.jpg",
      "name": "Vadym Pinchuk",
    },
    {
      "image":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1746895478/profile_images/vGKlXexPu5f8vMCXMm9Q2Gypgcy2.jpg",
      "name": "Danish",
    },
  ];

  final List<Map<String, String>> channels = [
    {
      "image":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753505626/images_ml0rin.png",
      "name": "Tech Updates",
      "time": "7/26/25",
      "desc": "Latest news and gadget reviews",
    },
    {
      "image":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753505723/03_09_Sept_blog_zjijbl.jpg",
      "name": "Health Tips",
      "time": "7/25/25",
      "desc": "Daily wellness & nutrition advice",
    },
  ];

  final List<Map<String, String>> suggestedChannels = [
    {
      "image":
          "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753506075/66de89d00c2c65c0f8976352_free_palestine_cr7qs6.png",
      "name": "Free Palestine",
      "followers": "120K followers",
    },
    {
      "image": "https://via.placeholder.com/60/44FF44/FFFFFF?text=Music",
      "name": "Melody Beats",
      "followers": "95K followers",
    },
    {
      "image": "https://via.placeholder.com/60/4444FF/FFFFFF?text=Food",
      "name": "Foodie Diaries",
      "followers": "150K followers",
    },
  ];

  StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Updates"),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actions: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.more_vert, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! Stories row
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: stories.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    //! Add Status
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipOval(
                                  child: CachedNetworkImage(
                                imageUrl:
                                    "https://res.cloudinary.com/dqdl8nui0/image/upload/v1746284292/post_images/1746284286011_1746284286012.jpg",
                                width: 63,
                                height: 63,
                                fit: BoxFit.cover,
                              )),
                              const Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.green,
                                  child: Icon(Icons.add,
                                      color: Colors.white, size: 16),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          const Text("Add status",
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    );
                  } else {
                    final story = stories[index - 1];
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: const Color(0xFF25D366), width: 2),
                            ),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(story["image"]!),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(story["name"]!,
                              style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),

            const Divider(),

            //! Channels Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Channels",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  TextButton(
                      onPressed: () {},
                      child: const Text("Explore",
                          style: TextStyle(color: Colors.green))),
                ],
              ),
            ),

            // Channels List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: channels.length,
              itemBuilder: (context, index) {
                final channel = channels[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(channel["image"]!),
                    radius: 25,
                  ),
                  title: Text(channel["name"]!),
                  subtitle: Text(channel["desc"]!),
                  trailing: Text(channel["time"]!,
                      style: const TextStyle(color: Colors.grey)),
                );
              },
            ),

            const Divider(),

            //! Suggested Channels
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Find channels to follow",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black54)),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: suggestedChannels.length,
              itemBuilder: (context, index) {
                final channel = suggestedChannels[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(channel["image"]!),
                    radius: 20,
                  ),
                  title: Text(channel["name"]!),
                  subtitle: Text(channel["followers"]!),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        backgroundColor: const Color.fromARGB(255, 143, 229, 146),
                        foregroundColor: Colors.white),
                    onPressed: () {},
                    child: UiHelper.CustomText(text: 'Follow', height: 12, color: const Color.fromARGB(255, 20, 41, 78), fontweight: FontWeight.bold),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
