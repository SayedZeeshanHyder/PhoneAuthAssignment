import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy/Controller/PhoneAuthController.dart';
import 'package:liveasy/Screens/ProfileRoleSelectionScreen.dart';

class PhoneAuthService{

  static FirebaseAuth auth = FirebaseAuth.instance;
  static PhoneAuthController phoneAuthController = Get.put(PhoneAuthController(),);

  static verifyPhoneNumber(String phoneNumber){

      auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (cred) {
          print(cred.smsCode);
          print("Verification Completed");
        },
        verificationFailed: (e) {
          Get.snackbar("Auth Error Occured", e.toString());
        },
        codeSent: (String verificationId, int? resendToken) {
          phoneAuthController.verificationId.value = verificationId;
          print(resendToken);
          print(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        timeout: Duration(seconds: 60),
      );
  }

  static verifySmsCode(String smsCode) async{
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: phoneAuthController.verificationId.value, smsCode: smsCode);
    await auth.signInWithCredential(credential);
    Get.off(()=>ProfileRoleSelectionScreen(),);
  }

}