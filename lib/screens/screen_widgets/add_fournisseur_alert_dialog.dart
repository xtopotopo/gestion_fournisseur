import 'package:flutter/material.dart';


import '../desktop/add_fournisseur_alert_dialog_desktop.dart';
import '../mobile/add_fournisseur_alert_dialog_mobile.dart';

final _addFournisseurFormKey = GlobalKey<FormState>();

class AddFournisseurAlertDialog {

  static void show(BuildContext context){

    final TextEditingController emailController=TextEditingController();
    final TextEditingController nomController=TextEditingController();
    final TextEditingController numeroController=TextEditingController();

   if(MediaQuery.of(context).size.width<700){
      AddFournisseurMobileAlertDialog.show(
        context: context, 
        emailController: emailController, 
        nomController: nomController, 
        numeroController: numeroController, 
        addFournisseurFormKey: _addFournisseurFormKey
      );
   }else{
      AddFournisseurDesktopAlertDialog.show(
        context: context, 
        emailController: emailController, 
        nomController: nomController, 
        numeroController: numeroController,
        addFournisseurFormKey: _addFournisseurFormKey

      );
   }
  }
}