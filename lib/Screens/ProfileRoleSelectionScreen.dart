import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy/Screens/HomeScreen.dart';

import '../colors.dart';

class ProfileRoleSelectionScreen extends StatefulWidget {

  @override
  State<ProfileRoleSelectionScreen> createState() => _ProfileRoleSelectionScreenState();
}

class _ProfileRoleSelectionScreenState extends State<ProfileRoleSelectionScreen> {
  bool? isShipper;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text("Please select your profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5,vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(width: 2)
                ),
                alignment: Alignment.center,
                width: size.width*0.9,
                child: Row(
                  children: [

                    Radio<bool>(
                      value: true,
                      groupValue: isShipper,
                      onChanged: (bool? value) {
                        setState(() {
                          isShipper = value!;
                        });
                      },
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      child: Image.asset("assets/icons/shipperIcon.png",fit: BoxFit.fitWidth,),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Shipper",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                          Text("Lorem ipsum dolor sit amet,consectetur adipiscing",style: TextStyle(color: Colors.grey),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5,vertical: 15),
                decoration: BoxDecoration(
                    border: Border.all(width: 2)
                ),
                alignment: Alignment.center,
                width: size.width*0.9,
                child: Row(
                  children: [
                    Radio<bool>(
                  value: false,
                  groupValue: isShipper,
                  onChanged: (bool? value) {
                    setState(() {
                      isShipper = value!;
                    });
                  },),
                    Container(
                      width: 60,
                      height: 60,
                      child: Image.asset("assets/icons/transporterIcon.png",fit: BoxFit.fitWidth,),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Shipper",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Lorem ipsum dolor sit amet,consectetur adipiscing",style: TextStyle(color: Colors.grey),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 30,
              ),

              InkWell(
                onTap: (){
                  Get.to(()=> HomeScreen(),);
                },
                child: Container(
                  width: size.width*0.85,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: darkBlue,
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
