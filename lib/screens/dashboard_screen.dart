
import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/controllers/dashboard_controller.dart';
import 'package:gestion_fournisseur/widgets/custom_text_field.dart';

import 'package:get/get.dart';

import '../controllers/utilisateur_controller.dart';

final  _addUserFormKey = GlobalKey<FormState>();
final  _deleteUserFormKey = GlobalKey<FormState>();


class DahsboardScreen extends GetView{

  // Field 
  late final TextEditingController _cinController1;
  late final TextEditingController _cinController2;
  late final TextEditingController _userTypeController;
  late final TextEditingController _emailController;


  DahsboardScreen({super.key}){
    _cinController1=TextEditingController();
    _cinController2=TextEditingController();
    _emailController=TextEditingController();
    _userTypeController=TextEditingController();

  }
    
  

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.background,
    appBar: AppBar(
      toolbarHeight: 55,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      title: Text(
        '67'.tr,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    ),
    body: ListView(
      children: [
        ListTile(
          title: Title(
            color: Theme.of(context).colorScheme.onBackground,
            child: Text(
              '68'.tr,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 28,
              ),
            ),
          ),
        ),
        GetBuilder<DashboardController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _addUserFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    CustomTextField.id( controller: _cinController1),
                    const SizedBox(height: 10,),
                    Container(
                      width: double.maxFinite,
                      height: 55,
                      decoration: BoxDecoration(
                        
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey[600] as Color,
                          width: 2
                        )
                      ),
                      child: DropdownMenu(
                        hintText: '69'.tr,
                        width: double.maxFinite,
                        controller: _userTypeController,
                       
                        dropdownMenuEntries: <DropdownMenuEntry>[
                          DropdownMenuEntry(value: controller.userTypes[0].toLowerCase(), label: controller.userTypes[0]),
                          DropdownMenuEntry(value: controller.userTypes[1].toLowerCase(), label: controller.userTypes[1]),
                          DropdownMenuEntry(value: controller.userTypes[2].toLowerCase(), label: controller.userTypes[2]),
                        ],
                        onSelected: (value){
                          controller.selectedUserType=value;
                        },
                      ),
                      
                    ),
                    const SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: (){
                        if(_addUserFormKey.currentState!.validate()){
                          Get.find<UtilisarteurController>().addUser(
                            cinController: _cinController1, 
                            userTypeController: _userTypeController, 
                            context: context
                          );
                        }
                      }, 
                      child: Text('28'.tr)
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    ),
  );
}


}