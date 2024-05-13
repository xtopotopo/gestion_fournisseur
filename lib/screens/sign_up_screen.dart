import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/screens/mobile/sign_up_mobile_screen.dart';
import 'package:get/get.dart';

import 'desktop/sign_up_desktop_screen.dart';


class SignUpScreen extends GetView{

  // Fields
  late final TextEditingController _nomController;
  late final TextEditingController _prenomController;
  late final TextEditingController _emailController;
  late final TextEditingController _numeroController;
  late final TextEditingController _cinController;
  late final TextEditingController _passworController;
  late final TextEditingController _confimationPassworController;

  // Constructor
  SignUpScreen({super.key}){
    _nomController=TextEditingController();
    _prenomController=TextEditingController();
    _emailController=TextEditingController();
    _numeroController=TextEditingController();
    _cinController=TextEditingController();
    _passworController=TextEditingController();
    _confimationPassworController=TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth<700){
            return SignUpMobileScreen(
              nomController: _nomController, 
              prenomController: _prenomController, 
              emailController: _emailController, 
              numeroController: _numeroController, 
              cinController: _cinController, 
              passwordController: _passworController, 
              confirmationPasswordController: _confimationPassworController
            );
          }else{
            return SignUpDesktopScreen(
              nomController: _nomController, 
              prenomController: _prenomController, 
              emailController: _emailController, 
              numeroController: _numeroController, 
              cinController: _cinController, 
              passwordController: _passworController, 
              confirmationPasswordController: _confimationPassworController
            );
          }
        },
      ),
    );
  }
  
}