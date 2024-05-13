import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/screens/mobile/reset_password_mobile_screen.dart';
import 'package:get/get.dart';

import 'desktop/reset_password_desktop_screen.dart';




class ResetPasswordScreen extends GetView {

  // Field
  late final TextEditingController _emailController;

  // Constructor
  ResetPasswordScreen({super.key}){
    _emailController=TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth<700){
            return ResetPasswordMobileScreen(emailController: _emailController);
          }else{
            return ResetPasswordDesktopScreen(emailController: _emailController);
          }
        },
      ),
    );
  }
  
}