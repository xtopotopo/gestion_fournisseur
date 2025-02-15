import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/widgets/custom_text_field.dart';
import 'package:get/get.dart';

import '../../controllers/authentification_controller.dart';

final _signUpFormKey = GlobalKey<FormState>();


class SignUpMobileScreen extends GetView{

  // Fields
  late final TextEditingController _nomController;
  late final TextEditingController _prenomController;
  late final TextEditingController _emailController;
  late final TextEditingController _numeroController;
  late final TextEditingController _cinController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmationPasswordController;

  // Constructor
  SignUpMobileScreen(
    {
      super.key,
      required  TextEditingController nomController,
      required  TextEditingController prenomController,
      required  TextEditingController emailController,
      required  TextEditingController numeroController,
      required  TextEditingController cinController,
      required  TextEditingController passwordController,
      required  TextEditingController confirmationPasswordController,
      
    }
  ){
    _nomController=nomController;
    _prenomController=prenomController;
    _emailController=emailController;
    _numeroController=numeroController;
    _cinController=cinController;
    _passwordController=passwordController;
    _confirmationPasswordController=confirmationPasswordController;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:30.0),
        child: ListView(
          children: 
          [
            Hero(
              tag: 'logo',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Icon(
                        Icons.change_circle_rounded,
                        size: 200,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
           const SizedBox(height: 25,),
           Form(
            key: _signUpFormKey,
            child:  Column(
              children: 
              [
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
                  const SizedBox(height: 15,),
                  Row(
                    children: 
                    [
                      Expanded(
                        child: CustomTextField.names(
                          label: "19".tr, 
                          controller: _nomController
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: CustomTextField.names(
                          label: '20'.tr, 
                          controller: _prenomController
                        ), 
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  CustomTextField.id(
                    controller: _cinController
                  ),
                  const SizedBox(height: 10,),
                  CustomTextField.email(
                    controller: _emailController
                  ),
                  const SizedBox(height: 7,),
                  CustomTextField.phoneNumber(
                    controller: _numeroController
                  ),
                  const SizedBox(height: 10,),
                  CustomTextField.password(
                    controller: _passwordController
                  ),
                  const SizedBox(height: 10,),
                  CustomTextField.confirmationPassword(
                    controller: _confirmationPasswordController
                  ),
                  const SizedBox(height: 15,),
                  ElevatedButton(
                    onPressed: (){
                      if(_signUpFormKey.currentState!.validate()){
                        Get.find<AuthentificationController>()
                        .signUp(
                          nom: _nomController, 
                          prenom: _prenomController, 
                          cin: _cinController, 
                          email: _emailController, 
                          numero: _numeroController, 
                          password: _passwordController,
                          confirmationPassword: _confirmationPasswordController, 
                          context: context
                        );
                      }
                    }, 
                    child: Text('22'.tr)
                  )
                ],
                
              ),
              
          ),
        
          const SizedBox(height: 30,)
          ],
        ),
      )
      ,
    );
  }
  
}