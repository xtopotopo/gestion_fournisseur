import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';


class TranslationsController extends GetxController{
  
  // Fields
  late GetStorage _storage ; 
  late String _chosenLanguage;
  final  List _languages = [
    {'name': 'Francais', 'locale': 'fr'},
    {'name': 'Anglais', 'locale': 'en'},
    {'name': 'العربية', 'locale': 'ar'},
  ];
  
  // Constructor
  TranslationsController(){
    _storage= GetStorage();
    _chosenLanguage= _storage.read('language') ?? Get.deviceLocale.toString();
  }

  // Methods
  void changeLanguage(String language) {

    Locale appLocale=Locale(language);
    _storage.write('language', language);
    Get.updateLocale(appLocale);
    update();

  }

  // Getters  
  String get chosenLanguage =>_chosenLanguage;
  List get languages =>_languages; 
 
 
}

