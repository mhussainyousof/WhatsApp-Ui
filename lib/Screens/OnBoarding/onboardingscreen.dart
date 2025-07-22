import 'package:flutter/material.dart';
import 'package:whatsapp_series/Screens/Login/loginscreen.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/boarding.png"),
            const SizedBox(
              height: 20,
            ),
            UiHelper.CustomText(
                text: "Welcome to WhatsApp",
                height: 20,
                color: const Color(0XFF000000)),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.CustomText(text: "Read out", height: 14),
                UiHelper.CustomText(
                    text: " Privacy Policy. ",
                    height: 14,
                    color: const Color(0XFF0C42CC)),
                UiHelper.CustomText(
                    text: "Tap ''Agree and continue''", height: 14),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.CustomText(text: "to accept the", height: 14),
                UiHelper.CustomText(
                    text: "Teams of Service",
                    height: 14,
                    color: const Color(0XFF0C42CC))
              ],
            ),

            const SizedBox(height: 20),

            Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 239, 237, 237),
          borderRadius: BorderRadius.circular(25),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.language, color: Color(0xFF25D366),
            ),
            SizedBox(width: 8),
            Text(
              'English',
              style: TextStyle(
                fontSize: 12,
                // fontWeight: FontWeight.w500,
                color: Color(0xFF25D366),
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_drop_down_sharp, color: Color(0xFF25D366)),
          ],
        ),
      ),
          ],
        ),
      ),
      
      floatingActionButton: UiHelper.CustomButton(
          callback: () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
          }, buttonname: "Agree and continue"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
