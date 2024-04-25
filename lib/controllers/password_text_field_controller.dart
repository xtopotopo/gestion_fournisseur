import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordTextFieldController extends GetxController{

  // Field
  late bool _obscurity;
  late Icon _icon;
  //Constructor
  PasswordTextFieldController(){
    _obscurity=true;
    _icon=const Icon(Icons.visibility_off_rounded) ;
  }

  // Method
  void toogle() {
    _obscurity=!_obscurity;
    if(_obscurity){
      _icon=const Icon(Icons.visibility_off_rounded);
    }else{
      _icon=const Icon(Icons.visibility);
    }
    update();
  }
  
  // Getters

  bool get obscurity=>_obscurity;
  Icon get icon => _icon;

}