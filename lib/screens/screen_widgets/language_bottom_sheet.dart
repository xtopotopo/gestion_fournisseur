import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/controllers/translations_controller.dart';
import 'package:get/get.dart';


class LanguageBottomSheet {
  
  static void show(BuildContext context){
    showModalBottomSheet(
      context: context, 
      builder: (context){
        return SizedBox(
          height: 200,
          child: GetBuilder<TranslationsController>(
            
            builder: (controller) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Center(
                      child: Container(
                        height: 6,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.languages.length,
                      itemBuilder: (context,index){
                        return ListTile(
                          title: Text(controller.languages[index]['name']),
                          onTap: (){
                            controller.changeLanguage(controller.languages[index]['locale']);
                            Navigator.pop(context);
                          },
                        );
                      },
                      
                    ),
                  ),
                ],
              );
            }
          ),
        );
      }
    );
  }
  
}