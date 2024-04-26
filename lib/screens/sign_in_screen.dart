// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/controllers/authentification_controller.dart';
import 'package:gestion_fournisseur/widgets/custom_text_field.dart';
import 'package:get/get.dart';
import '../widgets/custom_app_bar.dart';

final _loginFormKey = GlobalKey<FormState>();

class SignInScreen extends GetView{

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  SignInScreen({super.key,String? name}){
    _emailController=TextEditingController();
    _passwordController=TextEditingController();
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:30.0),
        child: ListView(
          children: [
            const SizedBox(height: 30,),
             Hero(
              tag: "logo",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Icon(
                      Icons.change_circle_rounded,
                      size: 310,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25,),
            Form(
              key: _loginFormKey,
              child: Column(
                children: [
                   Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding:const EdgeInsets.symmetric(horizontal: 7.0),
                        child: Text(
                          '2'.tr,
                          style:const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  CustomTextField.email(controller: _emailController),
                  const SizedBox(height: 15,),
                  CustomTextField.password(controller: _passwordController),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: 
                    [
                      
                      GestureDetector(
                        onTap: (){
                          Get.toNamed("resetPasswordScreen");
                        },
                        child: Text(
                          '3'.tr,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15,),
                  ElevatedButton(
                    onPressed: (){
                      if(_loginFormKey.currentState!.validate()){
                        Get.find<AuthentificationController>().signIn(
                          email: _emailController, 
                          password: _passwordController, 
                          context: context
                        );
                        
                      }
                    }, 
                    child: Text('4'.tr)
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: 
                    [
                      Text(
                        '5'.tr,
                        style:const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed("/signUpScreen");
                        },
                        child: Text(
                          '6'.tr,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      )
                    ],
                  )
              
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}

