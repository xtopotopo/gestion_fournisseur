import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/controllers/dashboard_controller.dart';
import 'package:gestion_fournisseur/widgets/custom_text_field.dart';

import 'package:get/get.dart';

import '../controllers/utilisateur_controller.dart';

final  _dashboardFormKey = GlobalKey<FormState>();


class DahsboardScreen extends GetView{

  // Field 
  late final TextEditingController _cinController1;
  late final TextEditingController _userTypeController;


  DahsboardScreen({super.key}){
    _cinController1=TextEditingController();
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
          style:const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: GetBuilder<DashboardController>(
        builder: (controller) {
          return ListView(
            children: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0,bottom: 15),
                    child: Container(
                      height: 50,
                      
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Theme.of(context).colorScheme.onBackground
                      )
                      ),
                      child: ToggleButtons(
                        
                        fillColor: Colors.blueGrey.shade100.withOpacity(.5),
                        borderRadius: BorderRadius.circular(15),
                        isSelected: controller.isSelected,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:20.0,vertical:1.0),
                            child: Text(
                              '75'.tr,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onBackground,
                                fontSize: 15,
                                fontWeight: FontWeight.w800
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:20.0,vertical:1.0),
                            child: Text(
                              '76'.tr,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onBackground,
                                fontSize: 15,
                                fontWeight: FontWeight.w800
                              ),
                            ),
                          )
                        ],
                        onPressed: (selectedIndex){
                        controller.toggle(selectedIndex);
                        
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                    padding: const EdgeInsets.all(15),
                    child: Form(
                      key: _dashboardFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                      
                        children: [
                          CustomTextField.id( controller: _cinController1),
                          const SizedBox(height: 10,),
                          if(controller.isSelected[0]==true) Container(
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
                          Hero(
                            tag: 'tag-7',
                            child: ElevatedButton(
                              onPressed: (){
                                if(_dashboardFormKey.currentState!.validate()){
                                  if(controller.isSelected[0]==true){
                                    Get.find<UtilisarteurController>().addUser(
                                      cinController: _cinController1, 
                                      userTypeController: _userTypeController, 
                                      context: context
                                    );
                                  }else if(controller.isSelected[1]==true){
                                    Get.find<UtilisarteurController>().deleteUser(cinController: _cinController1, context: context);
                                  }
                                }
                              }, 
                              child: Text((controller.isSelected[0]==true)?'28'.tr:'74'.tr)
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              
            ],
          );
        }
      ),
    );
  }


}