import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_series/Screens/OTP/otpscreen.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController=TextEditingController();
  String selectedcountry="Afghanistan";
  List<String>countries=[
    "Afghanistan",
    "America",
    "Africa",
    "Italy",
    "Germany"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Center(
            child: UiHelper.CustomText(
                text: "Enter your phone number",
                height: 20,
                fontweight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          UiHelper.CustomText(
              text: "WhatsApp will need to verify your phone", height: 14),
          UiHelper.CustomText(
              text: "number. Carrier charges may apply.", height: 14),
          UiHelper.CustomText(
              text: " What’s my number?", height: 14, fontweight: FontWeight.bold, color:const Color.fromARGB(255, 7, 115, 204)),
          const SizedBox(height: 50,),
         Padding(
           padding: const EdgeInsets.only(left: 37,right: 40),
           child: DropdownButtonFormField(items: countries.map((String country){
             return DropdownMenuItem(value: country,child: Center(child: Text(country,textAlign: TextAlign.center,)),);
           }).toList(), onChanged: (newvalue){
             setState(() {
               selectedcountry=newvalue!;
             });
           },value: selectedcountry,
           isExpanded: true,
           iconEnabledColor:const Color(0XFF25D366) ,
           decoration: const InputDecoration(
             enabledBorder: UnderlineInputBorder(
               borderSide: BorderSide(color: Color(0XFF25D366))
             ),
             focusedBorder: UnderlineInputBorder(
               borderSide: BorderSide(color: Color(0XFF25D366))
             )
           ),),
         ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 50,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "+ 93",
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF25D366))
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF25D366))
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF25D366))
                    )
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              SizedBox(
                width: 250,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF25D366))
                    )
                  ),
                ),
              )
            ],
          )
        ],
      ),
      floatingActionButton: UiHelper.CustomButton(callback: (){
        login(phoneController.text.toString());
      }, buttonname: "Next"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  login(String phonenumber){
    if(phonenumber==""){
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Enter Phone Number"),backgroundColor: Color(0XFF25D366),));
    }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPScreen(phonenumber: phonenumber,)));
    }
  }
}
