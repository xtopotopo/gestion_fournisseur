

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_text_field.dart';

final _addProduitFormKey = GlobalKey<FormState>();

class AddProduitAlertDialog {

  static void show(BuildContext context){
    final TextEditingController emailController=TextEditingController();
    final TextEditingController nomController=TextEditingController();
    final TextEditingController numeroController=TextEditingController();

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: _addProduitFormKey,
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
                  height: MediaQuery.of(context).size.height*0.38,
                  width: MediaQuery.of(context).size.width*0.9,
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
                                if(_addProduitFormKey.currentState!.validate()){
                                   
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
