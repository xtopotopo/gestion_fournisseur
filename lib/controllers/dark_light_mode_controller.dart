import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DarkLightModeController extends GetxController{

  // Fields
  late GetStorage _storage;
  late Mode _mode;
  late Color secondaryColor=Colors.blue;

  // Constructor
  DarkLightModeController(){
    _storage=GetStorage();
    _mode=(_storage.read('mode')=='dark')
    ?_mode=Mode.dark
    :(_storage.read('mode')=='light')
      ?_mode=Mode.light
      :(Get.isDarkMode)
        ?_mode=Mode.dark
        :_mode=Mode.light;
  }

  // Methods
  void toogle(){
    if(_mode==Mode.dark){
      _storage.write('mode','light');
      Get.changeThemeMode(ThemeMode.light);
      _mode=Mode.light;
    }else{
      _storage.write('mode','dark');
      Get.changeThemeMode(ThemeMode.dark);
      _mode=Mode.dark;
    }
    update();
    
  }

  //Getter
  Icon get icon =>(_mode==Mode.dark)
    ? const Icon(Icons.light_mode_rounded,)
    : const Icon(Icons.dark_mode_rounded);

  ThemeMode get themMode =>(_mode==Mode.dark)
    ? ThemeMode.dark 
    : ThemeMode.light;
  
}

enum Mode{
  light,
  dark
}