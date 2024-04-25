
 import 'package:get/get.dart';

class  InputValidation {

  static String? isEmailValid(String email) {
    
    final RegExp regex = RegExp(r'^[\w\-\.]+@([\w-]+\.)+[\w-]{2,}$',);
    if(!regex.hasMatch(email)) return"Adresse e-mail invalide".tr;
    return null;

  }

  static String? isPasswordValid(String pasword) {
    
    final RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-@#]{9,15}$',);
    if(!regex.hasMatch(pasword)) return"Mot de passe invalide".tr;
    return null;
    
  }

  static String? isNameValid(String lastName) {
    
    final RegExp regex = RegExp(r'^[a-zA-z ]{3,25}$',);
    if(!regex.hasMatch(lastName)) return"Nom invalide".tr;
    return null;
    
  }

 

  static String? isCinValid(String cin) {
    
    final RegExp regex = RegExp(r'^[A-z][0-9]{6}$$',);
    final RegExp regex2 = RegExp(r'^[A-z]{2}[0-9]{5}$',);
    if(!regex.hasMatch(cin) && !regex2.hasMatch(cin)) return"Prenom invalide".tr;
    return null;
    
  }

  static String? isPhoneNumberValid(String cin) {
    
    final RegExp regex = RegExp(r'^0[67][0-9]{8}$',);
  
    if(!regex.hasMatch(cin)) return"Cin invalide".tr;
    return null;
    
  }

  static String? isNumberValid(String cin) {
    
    final RegExp regex = RegExp(r'^[0-9]*$',);
  
    if(!regex.hasMatch(cin)) return"Cin invalide".tr;
    return null;
    
  }
}