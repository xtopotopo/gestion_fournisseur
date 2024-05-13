import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/controllers/fournisseur_controller.dart';
import 'package:gestion_fournisseur/widgets/custom_text_field.dart';
import 'package:get/get.dart';


class AddFournisseurDesktopAlertDialog {

  static void show(
    {
      required BuildContext context,
      required TextEditingController emailController,
      required TextEditingController nomController,
      required TextEditingController numeroController,
      required GlobalKey<FormState> addFournisseurFormKey,
    }
  ){

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: addFournisseurFormKey,
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    bottom: 10,
                    top: 15
                  ),
                  height: MediaQuery.of(context).size.height*0.4,
                  width: MediaQuery.of(context).size.width*0.30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).colorScheme.primaryContainer
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '31'.tr,
                              style:const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Flexible(
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15
                            ),
                            child: ListView(
                              children: 
                              [
                               
                                Expanded(child: CustomTextField.names(label: '30'.tr, controller: nomController)),
                                const SizedBox(height: 12,),
                                Expanded(child: CustomTextField.email(controller: emailController)),
                                const SizedBox(height: 12,),
                                Expanded(child: CustomTextField.phoneNumber( controller: numeroController)),
                                
                              ],
                            ),
                          )
                        ),
                      ),
                       const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: (){
                              Navigator.pop(context);
                            }, 
                            child: Text(
                              '29'.tr,
                               style:TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).colorScheme.secondary
                                ),
                            )
                          ),
                          const SizedBox(width: 7,),
                          SizedBox(
                            width: 120,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: ()async {
                                if(addFournisseurFormKey.currentState!.validate()){
                                    await Get.find<FournisseurController>().addFournisseur(
                                    nomController: nomController, 
                                    emailController: emailController, 
                                    numeroController: numeroController, 
                                    context: context
                                  );
                                  Navigator.pop(context);
                                }
                                
                              }, 
                              child: Text(
                                '28'.tr,
                                style:const TextStyle(
                                  fontSize: 15
                                ),
                              )
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}