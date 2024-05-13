import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/widgets/custom_text_field.dart';
import 'package:get/get.dart';

import '../../controllers/authentification_controller.dart';

final _signUpFormKey = GlobalKey<FormState>();


class SignUpDesktopScreen extends GetView {

  // Fields
  late final TextEditingController _nomController;
  late final TextEditingController _prenomController;
  late final TextEditingController _emailController;
  late final TextEditingController _numeroController;
  late final TextEditingController _cinController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmationPasswordController;

  // Constructor
  SignUpDesktopScreen({
    super.key,
    required TextEditingController nomController,
    required TextEditingController prenomController,
    required TextEditingController emailController,
    required TextEditingController numeroController,
    required TextEditingController cinController,
    required TextEditingController passwordController,
    required TextEditingController confirmationPasswordController,
  }) {
    _nomController = nomController;
    _prenomController = prenomController;
    _emailController = emailController;
    _numeroController = numeroController;
    _cinController = cinController;
    _passwordController = passwordController;
    _confirmationPasswordController = confirmationPasswordController;
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
        padding: EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width*.05,),
        child: ListView(
          children: [
            SizedBox(height: (MediaQuery.of(context).size.width<600)
              ?MediaQuery.of(context).size.height*.2
              :MediaQuery.of(context).size.height*.07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: 
              [
                
                
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width*.05,),
                    child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Expanded(child: Divider()),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                                child: Text(
                                  '2'.tr,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const Expanded(child: Divider()),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField.names(
                                  label: "19".tr,
                                  controller: _nomController,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: CustomTextField.names(
                                  label: '20'.tr,
                                  controller: _prenomController,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          CustomTextField.id(controller: _cinController),
                          const SizedBox(height: 15),
                          CustomTextField.email(controller: _emailController),
                          const SizedBox(height: 15),
                          CustomTextField.phoneNumber(controller: _numeroController),
                          const SizedBox(height: 15),
                          CustomTextField.password(controller: _passwordController),
                          const SizedBox(height: 15),
                          CustomTextField.confirmationPassword(
                            controller: _confirmationPasswordController,
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              if (_signUpFormKey.currentState!.validate()) {
                                Get.find<AuthentificationController>().signUp(
                                  nom: _nomController,
                                  prenom: _prenomController,
                                  cin: _cinController,
                                  email: _emailController,
                                  numero: _numeroController,
                                  password: _passwordController,
                                  confirmationPassword:
                                      _confirmationPasswordController,
                                  context: context,
                                );
                              }
                            },
                            child: Text('22'.tr),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*.05), 
                Hero(
                  tag: "logo",
                  child: Icon(
                    Icons.change_circle_rounded,
                    size: MediaQuery.of(context).size.width*.4,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*.01), 
              ],
            ),
            
            
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
