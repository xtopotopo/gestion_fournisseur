import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar{
  static void success({required String message,required BuildContext context}){
    Get.snackbar(
      '',
      '',
      titleText: Text(
        '48'.tr,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground, // Blurred green color
          fontSize: 17,
          fontWeight: FontWeight.w800,
        ),
      ),
      messageText: Text(
        message,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground, // Blurred green color
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.check_circle,
          size: 30,
          color: Theme.of(context).colorScheme.onBackground, 
        ),
      ),
      shouldIconPulse: false,
      snackPosition: SnackPosition.TOP,
      padding: const EdgeInsets.all(10),
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
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground, // Blurred green color
          fontSize: 17,
          fontWeight: FontWeight.w800,
        ),
      ),
      messageText: Text(
        message,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground, // Blurred green color
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.error_outline_rounded,
          size: 30,
          color: Theme.of(context).colorScheme.onBackground, 
        ),
      ),
      shouldIconPulse: false,
      snackPosition: SnackPosition.TOP,
      padding: const EdgeInsets.all(10),
      borderRadius: 20,
      backgroundColor: Colors.redAccent, 
      colorText: Colors.transparent, 
    
    );
  }
}