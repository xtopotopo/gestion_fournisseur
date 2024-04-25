// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/controllers/authentification_Controller.dart';
import 'package:gestion_fournisseur/controllers/dark_light_mode_controller.dart';
import 'package:gestion_fournisseur/widgets/custom_text_field.dart';
import 'package:get/get.dart';

import 'screen_widgets/language_bottom_sheet.dart';

final _loginFormKey = GlobalKey<FormState>();

class SignInScreen extends GetView{

  late TextEditingController _emailController;
  late TextEditingController _passwordController;


  SignInScreen({super.key}){
    _emailController=TextEditingController();
    _passwordController=TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("1".tr),
        actions: [
          GetBuilder<DarkLightModeController>(
            builder: (controller) {
              return IconButton(
                onPressed: (){
                  controller.toogle();
                }, 
                icon: controller.icon,
              );
            }
          ),
          PopupMenuButton<String>(
            shape: RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(15), // Customize the radius here
            ),
            itemBuilder: (context)=>[
               PopupMenuItem(
                value: "language",
                child: Row(
                  children: [
                     Icon(
                      Icons.language_rounded,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    const Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 4.0),
                      child:  Text("  "),
                    ),
                    const Text("Language")
                  ],
                )
              ),
              if(Get.currentRoute!="/")
              const PopupMenuItem(
                value: "themes",
                child: Row(
                  children: [
                     Icon(
                      Icons.color_lens_rounded,
                      color: Colors.white,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 4.0),
                      child:  Text("  "),
                    ),
                    Text("Themes")
                  ],
                )
              )
            ],
            onSelected:  (value) {
              switch (value) {
                case "language":
                  LanguageBottomSheet.show(context);
                  break;
                case "themes":
                  
                  break;
              }
            },
          )
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
             Row(
             children: [
               Icon(
                 Icons.change_circle_rounded,
                 size: 310,
                 color: Theme.of(context).colorScheme.secondary,
               ),
             ],
                         ),
            const SizedBox(height: 25,),
            Form(
              key: _loginFormKey,
              child: Column(
                children: [
                  const Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7.0),
                        child: Text(
                          "Veulliez Saisir vos information",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      Expanded(child: Divider()),
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
                      
                      Text(
                        "Mot de passe oublie ?",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w600
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
                    child:const Text('Se conecter')
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: 
                    [
                      const Text(
                        "Vous n'avez pas de compte? ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                  
                        },
                        child: Text(
                          "Creer un",
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