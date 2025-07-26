import 'dart:async';
import 'package:flutter/material.dart';
import 'package:whatsapp_series/Screens/OnBoarding/onboardingscreen.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const OnBoardingScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Spacer(),
            Image.asset("assets/images/whatsapp 1.png",scale: 10,),
            const Spacer(),
            UiHelper.CustomText(text: "from", height: 13),
            const SizedBox(height: 6,),
            Image.asset("assets/images/meta.png",scale: 30,),
            const SizedBox(height: 60,),
          ],
        ),
      ),
    );
  }
}
