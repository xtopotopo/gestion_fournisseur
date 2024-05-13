// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/controllers/authentification_controller.dart';
import 'package:gestion_fournisseur/widgets/custom_app_bar.dart';
import 'package:gestion_fournisseur/widgets/custom_text_field.dart';
import 'package:get/get.dart';

final _loginFormKey = GlobalKey<FormState>();

class SignInDesktopScreen extends GetView {

  // Fields
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  // Constructor
  SignInDesktopScreen({super.key,required TextEditingController emailController,required TextEditingController passwordController}){
    _emailController=emailController;
    _passwordController=passwordController;
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ListView(
          children: [
            SizedBox(height: (MediaQuery.of(context).size.width<600)
              ?MediaQuery.of(context).size.height*.2
              :MediaQuery.of(context).size.height*.07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, 
              children: [
                Hero(
                  tag: "logo",
                  child: Icon(
                    Icons.change_circle_rounded,
                    size: MediaQuery.of(context).size.width*.4,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*.05), 
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width*.05,),
                    child: Form(
                      key: _loginFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                          children: [
                            const Expanded(child: Divider()),
                            Padding(
                              padding:const EdgeInsets.symmetric(horizontal: 7.0),
                              child: Text(
                                '2'.tr,
                                style:const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            const Expanded(child: Divider()),
                          ],
                        ),
                          const SizedBox(height: 30),
                          CustomTextField.email(controller: _emailController),
                          const SizedBox(height: 25),
                          CustomTextField.password(controller: _passwordController),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed("resetPasswordScreen");
                                },
                                child: Text(
                                  '3'.tr,
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {
                              if (_loginFormKey.currentState!.validate()) {
                                Get.find<AuthentificationController>().signIn(
                                  email: _emailController,
                                  password: _passwordController,
                                  context: context,
                                );
                              }
                            },
                            child: Text('4'.tr),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '5'.tr,
                                style:const  TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed("/signUpScreen");
                                },
                                child: Text(
                                  '6'.tr,
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
