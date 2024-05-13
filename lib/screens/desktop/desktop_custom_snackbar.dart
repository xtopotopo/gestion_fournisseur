import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesktopCustomSnackbar{
  static void success({required String message,required BuildContext context}){
    Get.snackbar(
      
      '',
      '',
      titleText: Text(
        '48'.tr,
        textAlign: TextAlign.start,
        style:const TextStyle(
          color: Colors.white, 
          fontSize: 17,
          fontWeight: FontWeight.w800,
        ),
      ),
      messageText: Text(
        message,
        textAlign: TextAlign.start,
        style:const TextStyle(
          color: Colors.white, 
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      icon:const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.check_circle,
          size: 30,
          color: Colors.white, 
        ),
      ),
      shouldIconPulse: false,
      snackPosition: SnackPosition.TOP,
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 10,left: MediaQuery.of(context).size.width*.7,right: 20),
      borderRadius: 20,
      backgroundColor: Colors.green.shade500, 
      colorText: Colors.transparent, 
    
    );
  }

  static void failure({required String message,required BuildContext context}){
    Get.snackbar(
      '',
      '',
      titleText: Text(
        '49'.tr,
        textAlign: TextAlign.start,
        style:const TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.w800,
        ),
      ),
      messageText: Text(
        message,
        textAlign: TextAlign.start,
        style:const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      icon: const Padding(
        padding: EdgeInsets.all(8.0),
        child:Icon(
          Icons.error_outline_rounded,
          size: 30,
          color: Colors.white
        ),
      ),
      shouldIconPulse: false,
      snackPosition: SnackPosition.TOP,
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 30,left: MediaQuery.of(context).size.width*.7,right: 20),
      borderRadius: 20,
      backgroundColor: Colors.redAccent, 
      colorText: Colors.transparent, 
    
    );
  }
}