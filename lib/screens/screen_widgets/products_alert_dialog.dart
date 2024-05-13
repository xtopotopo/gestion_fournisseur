import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/models/produit.dart';
import 'package:gestion_fournisseur/screens/mobile/products_mobile_alert_dialog.dart';

import '../desktop/products_desktop_alert_dialog.dart';


final _produitFormKey = GlobalKey<FormState>();

class ProduitAlertDialog {

  static void show({required ProductAlertDialogType type,required BuildContext context,required String fournisseurId, DocumentSnapshot<Produit>? productDocument}){

    final TextEditingController quantiteController=TextEditingController();
    final TextEditingController prixUniteController=TextEditingController();
    final TextEditingController uniteController=TextEditingController();
    final TextEditingController dateController=TextEditingController();
    final TextEditingController nomController=TextEditingController();
    final TextEditingController descriptionController=TextEditingController();

    if(MediaQuery.of(context).size.width<700){
      ProduitMobileAlertDialog.show(
        type: type, 
        context: context, 
        fournisseurId: fournisseurId, 
        produitFormKey: _produitFormKey, 
        productDocument: productDocument, 
        quantiteController: quantiteController, 
        prixUniteController: prixUniteController, 
        uniteController: uniteController, 
        dateController: dateController, 
        nomController: nomController, 
        descriptionController: descriptionController
      );
    }else{
      ProduitDesktopAlertDialog.show(
        type: type, 
        context: context, 
        fournisseurId: fournisseurId, 
        produitFormKey: _produitFormKey, 
        productDocument: productDocument, 
        quantiteController: quantiteController, 
        prixUniteController: prixUniteController, 
        uniteController: uniteController, 
        dateController: dateController, 
        nomController: nomController, 
        descriptionController: descriptionController
      );
    }
  }
}

enum ProductAlertDialogType {
  add,
  modify
}
