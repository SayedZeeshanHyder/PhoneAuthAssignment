import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy/Screens/ProfileRoleSelectionScreen.dart';
import 'package:pinput/pinput.dart';

import '../colors.dart';

class OtpScreen extends StatefulWidget {

  final String phoneNumber;

  OtpScreen({required this.phoneNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Get.back();
        }, icon: Icon(Icons.arrow_back),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text("Verify Phone",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
              SizedBox(
                height: 8,
              ),
              Text("Code is sent to ${widget.phoneNumber}",style: TextStyle(color: Colors.grey,fontSize: 17),textAlign: TextAlign.center,),
              SizedBox(
                height: 15,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Pinput(
                  defaultPinTheme: PinTheme(decoration: BoxDecoration(color: Colors.blue.shade100),width: 50,height: 50),
                  onChanged: (val){

                    setState(() {
                      otp = val;
                    });

                  },
                  length: 6,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RichText(text: TextSpan(
                children:[
                  TextSpan(text: "Didn't recieve the code?  ",style: TextStyle(color: Colors.grey),),
                  TextSpan(text: "Request Again",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                ]
              ),),
              SizedBox(
                height: 35,
              ),
              InkWell(
                onTap: otp.length == 6 ? (){
                  Get.back();
                  Get.back();
                  Get.off(()=> ProfileRoleSelectionScreen(),);
                } : (){},
                child: Container(
                  width: size.width*0.85,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: otp.length == 6 ? darkBlue : Colors.grey,
                  ),
                  child: Text("VERIFY AND CONTINUE",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 14.5),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
