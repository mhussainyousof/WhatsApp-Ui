import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommunitiesScreen extends StatelessWidget {
  const CommunitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Communities",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Icon(Icons.more_vert, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //! Illustration Image
              CachedNetworkImage(imageUrl: "https://res.cloudinary.com/dqdl8nui0/image/upload/v1753510644/photo19976427498_ycezk5.jpg",
              width: 170,
              height: 170,
              placeholder: (context, url) {
                return const CircularProgressIndicator();
              },
              ),
              const SizedBox(height: 25),

              //! Headline
              const Text(
                "Stay connected with a community",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),

              //! Subtext
              const Text(
                "Communities bring members together in topic-based groups, "
                "and make it easy to get admin announcements. Any community "
                "you're added to will appear here.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 30),

              //! Start your community button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFF1DAB61),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 80 ),
                ),
                onPressed: () {},
                child: const Text(
                  "Start your community",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              //! Footer
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Tap + on the Chats tab to create a new community.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
