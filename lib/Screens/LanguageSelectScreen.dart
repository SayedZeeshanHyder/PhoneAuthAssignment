import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy/Screens/PhoneAuthScreen.dart';
import 'package:liveasy/colors.dart';

class LanguageSelectScreem extends StatelessWidget {

  final items = [
    DropdownMenuEntry(value: "English", label: "English"),
    DropdownMenuEntry(value: "Hindi", label: "Hindi"),
  ];

  String value = "English";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height*0.2,
              ),
              Icon(Icons.photo_outlined,size: 60,),
              SizedBox(
                height: 30,
              ),
              Text("Please select your Language",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              SizedBox(
                height: 8,
              ),
              Text("You can change the language \n at any time",style: TextStyle(color: Colors.grey,fontSize: 17),textAlign: TextAlign.center,),
              SizedBox(
                height: 20,
              ),
              DropdownMenu(
                width: size.width*0.6,
                initialSelection: "English",
                dropdownMenuEntries: items,
                onSelected: (val){
                  print(val);
                },
              ),

              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: (){
                  Get.to(()=> PhoneAuthScreen(),transition: Transition.downToUp);
                },
                child: Container(
                  width: size.width*0.6,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: darkBlue,
                  ),
                  child: Text("NEXT",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18.5),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
