// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/screens/desktop/sign_in_desktop_screen.dart';
import 'package:gestion_fournisseur/screens/mobile/sign_in_mobile_sscreen.dart';
import 'package:get/get.dart';

import '../services/session_variables_controller.dart';


class SignInScreen extends GetView{
  
  // Fields
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  // Constructor
  SignInScreen({super.key,String? name}){

      

    _emailController=TextEditingController();
    _passwordController=TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if(constraints.maxWidth<700){
          return SignInMobileScreen(emailController: _emailController,passwordController: _passwordController,);
        }else{
           return SignInDesktopScreen(emailController: _emailController,passwordController: _passwordController,);
        }
      },
    );
  }
}

