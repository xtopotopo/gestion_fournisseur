import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/screens/mobile/mobile_custom_snackbar.dart';
import '../desktop/desktop_custom_snackbar.dart';

class CustomSnackbar{
  static void success({required String message,required BuildContext context}){
    if(MediaQuery.of(context).size.width<700){
      MobileCustomSnackbar.success(message: message, context: context);
    }else{
      DesktopCustomSnackbar.success(message: message, context: context);
    }
      
  }

  static void failure({required String message,required BuildContext context}){
    if(MediaQuery.of(context).size.width<700){
      MobileCustomSnackbar.failure(message: message, context: context);
    }else{
      DesktopCustomSnackbar.failure(message: message, context: context);
    }
  }
}