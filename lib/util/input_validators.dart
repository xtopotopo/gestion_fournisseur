
 import 'package:get/get.dart';

class  InputValidation {

  static String? isEmailValid(String email) {
    
    final RegExp regex = RegExp(r'^[\w\-\.]+@([\w-]+\.)+[\w-]{2,}$',);
    if(!regex.hasMatch(email)) return '7'.tr;
    return null;

  }

  static String? isPasswordValid(String pasword) {
    
    final RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-@#]{9,15}$',);
    if(!regex.hasMatch(pasword)) return '8'.tr;
    return null;
    
  }

  static String? isNameValid(String lastName) {
    
    final RegExp regex = RegExp(r'^[a-zA-z ]{1,25}$',);
    if(!regex.hasMatch(lastName)) return '9'.tr;
    return null;
    
  }

 

  static String? isCinValid(String cin) {
    
    final RegExp regex = RegExp(r'^[A-z][0-9]{6}$$',);
    final RegExp regex2 = RegExp(r'^[A-z]{2}[0-9]{5}$',);
    if(!regex.hasMatch(cin) && !regex2.hasMatch(cin)) return '10'.tr;
    return null;
    
  }

  static String? isPhoneNumberValid(String cin) {
    
    final RegExp regex = RegExp(r'^0[67][0-9]{8}$',);
  
    if(!regex.hasMatch(cin)) return '11'.tr;
    return null;
    
  }

  static String? isNumberValid(String number) {
    
    final RegExp regex = RegExp(r'^-?\d*(\.\d+)?$',);
  
    if(!regex.hasMatch(number)) return '12'.tr;
    return null;
    
  }

  static String? isTextValid(String text) {
    
    final RegExp regex = RegExp(r'^[azAZ ]$',);
  
    if(!regex.hasMatch(text)) return '11'.tr;
    return null;
    
  }
}