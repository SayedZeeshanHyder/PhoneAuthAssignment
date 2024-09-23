import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy/Screens/PhoneAuthScreen.dart';

class HomeScreen extends StatelessWidget {

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          ElevatedButton(onPressed: ()async{
            await auth.signOut();
            Get.off(()=>PhoneAuthScreen(),);
          }, child: Text("Log Out"),),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Center(
        child: Text("This would be the Home Screen"),
      ),
    );
  }
}
