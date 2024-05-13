import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gestion_fournisseur/controllers/authentification_controller.dart';
import 'package:gestion_fournisseur/widgets/custom_text_field.dart';
import 'package:get/get.dart';

final _resetPasswordFormKey = GlobalKey<FormState>();


class ResetPasswordMobileScreen extends GetView {

  // Field
  late final TextEditingController _emailController;

  // Constructor
  ResetPasswordMobileScreen({super.key,required TextEditingController emailController}){
    _emailController=emailController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.only(
          left:30.0,
          right: 30.0,
          bottom: 30
        ),
        child: ListView(
          children: 
          [
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
              [
                Icon(
                  Icons.mark_email_unread_rounded,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 300,
                )
              ],
            ),
             Form(
              key: _resetPasswordFormKey,
              child: Column(
                children: 
                [
                   Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding:const EdgeInsets.symmetric(horizontal: 7.0),
                        child: Text(
                          '23'.tr,
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
                  CustomTextField.email(controller: _emailController),
                  const SizedBox(height: 15,),
                  ElevatedButton(
                    onPressed: (){
                      if(_resetPasswordFormKey.currentState!.validate()){
                        Get.find<AuthentificationController>().resetPassword(
                          context: context, 
                          emailController: _emailController
                        );
                      }
                    }, 
                    child: Text('22'.tr)
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