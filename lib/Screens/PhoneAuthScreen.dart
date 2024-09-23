import 'package:country_flags/country_flags.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:liveasy/Screens/OtpScreen.dart';
import 'package:liveasy/Services/phoneAuthService.dart';

import '../colors.dart';

class PhoneAuthScreen extends StatefulWidget {

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  String countryCode = "IN";
  String countryNumber = "+91";
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Get.back();
        }, icon: Icon(Icons.close),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text("Verify Phonenumber",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
              SizedBox(
                height: 8,
              ),
              Text("Code is sent to",style: TextStyle(color: Colors.grey,fontSize: 17),textAlign: TextAlign.center,),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(onTap: (){
                      showCountryPicker(showPhoneCode: true,context: context, onSelect: (val){


                        setState(() {
                          countryNumber = "+"+val.phoneCode.toString();
                          countryCode = val.countryCode.toString();
                        });

                      });
                    },child: Container(child: CountryFlag.fromCountryCode(countryCode),width: 30,height: 18.5,),),
                    SizedBox(
                      width: 10,
                    ),
                    Text(countryNumber,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.5),),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (val){

                          setState(() {
                            phoneNumber = val.toString();
                          });

                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Mobile Number",
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 35,
              ),

              InkWell(
                onTap: phoneNumber.length == 10 ? () async{
                  await PhoneAuthService.verifyPhoneNumber("$countryNumber$phoneNumber");
                  Get.to(()=> OtpScreen(phoneNumber: phoneNumber,),transition: Transition.rightToLeft);
                } : (){},
                child: Container(
                  width: size.width*0.85,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: phoneNumber.length == 10 ? darkBlue : Colors.grey,
                  ),
                  child: Text("CONTINUE",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 14.5),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
