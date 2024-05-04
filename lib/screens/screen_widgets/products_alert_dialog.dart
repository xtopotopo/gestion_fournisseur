

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/controllers/produit_controller.dart';
import 'package:gestion_fournisseur/models/produit.dart';
import 'package:get/get.dart';
import '../../widgets/custom_text_field.dart';

final _produitFormKey = GlobalKey<FormState>();

class ProduitAlertDialog {

  static void show({required Type type,required BuildContext context,required String fournisseurId, DocumentSnapshot<Produit>? productDocument}){

    final TextEditingController quantiteController=TextEditingController();
    final TextEditingController prixUniteController=TextEditingController();
    final TextEditingController uniteController=TextEditingController();
    final TextEditingController dateController=TextEditingController();
    final TextEditingController nomController=TextEditingController();
    final TextEditingController descriptionController=TextEditingController();



    if(productDocument!=null){
      quantiteController.text=productDocument.data()!.qunatite.toString();
      descriptionController.text=productDocument.data()!.description;
      prixUniteController.text=productDocument.data()!.prixUnite.toString();
      nomController.text=productDocument.data()!.nom;
      uniteController.text=productDocument.data()!.unite;
      DateTime dateTime=productDocument.data()!.date.toDate();
      String month = '';
      String day = '';
      if(dateTime.month<10){
        month = '0${dateTime.month}';
      }else{ 
        month = '${dateTime.month}';
      }
      if(dateTime.day<10){
        day = '0${dateTime.day}';
      }else{
        day = '${dateTime.day}';
      }
      dateController.text="${dateTime.year}-$month-$day";
    }
    

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: _produitFormKey,
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
                  height: 450,
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
                              (type==Type.add)
                              ?'42'.tr
                              :'43',
                              style:const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18,),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15
                          ),
                          child: ListView(
                            children: 
                            [
                              Expanded(child: CustomTextField.names(label: '30'.tr, controller: nomController,)),
                              const SizedBox(height: 12,),
                              Expanded(child: CustomTextField.text(controller: descriptionController, label: '35'.tr,)),
                              const SizedBox(height: 12,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: CustomTextField.number( controller: quantiteController, label: '36'.tr,)),
                                  const SizedBox(width: 10,),
                                  Expanded(child: CustomTextField.names( controller: uniteController, label: '41'.tr,)),
                                ],
                              ),
                              const SizedBox(height: 12,),
                              Expanded(child: CustomTextField.number( controller: prixUniteController, label: '37'.tr,)),
                              const SizedBox(height: 12,),
                              Expanded(child: CustomTextField.date( controller: dateController,)),
                              
                            ],
                          ),
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
                                if(_produitFormKey.currentState!.validate()){
                                  if(type==Type.add){
                                    Get.find<ProduitController>().addProduit(
                                      nomController: nomController, 
                                      descriptionController: descriptionController, 
                                      quantiteController: quantiteController, 
                                      uniteController: uniteController, 
                                      prixUniteController: prixUniteController, 
                                      dateController: dateController, 
                                      fournisseurId: fournisseurId, 
                                      context: context
                                    );
                                  }else if(type==Type.modify){
                                    Get.find<ProduitController>().updateProduit(
                                      nomController: nomController, 
                                      descriptionController: descriptionController, 
                                      quantiteController: quantiteController, 
                                      uniteController: uniteController, 
                                      prixUniteController: prixUniteController, 
                                      dateController: dateController, 
                                      fournisseurId: fournisseurId,
                                      productId: productDocument!.id,
                                      context: context,
                                    );
                                    
                                  }
                                  Navigator.pop(context);
                                }
                                
                              }, 
                              child: Text(
                                (type==Type.add)
                                ?'28'.tr
                                :'45'.tr,
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

enum Type {
  add,
  modify
}
