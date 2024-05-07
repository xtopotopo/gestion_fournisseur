import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gestion_fournisseur/dao/utilisateur_dao.dart';
import 'package:gestion_fournisseur/models/utilisateur.dart';
import 'package:gestion_fournisseur/screens/screen_widgets/custom_snackbar.dart';
import 'package:get/get.dart';

import '../screens/screen_widgets/circular_progress_indicror.dart';

class UtilisarteurController extends GetxController{

  late final UtilisateurDao _utilisateurDao;


  Future<void> addUser({required BuildContext context,required TextEditingController cinController,required TextEditingController userTypeController}) async{
    try {
       CircularProgreesIndicator.show(context);
      if(userTypeController.text=='') throw Exception('user-type-empty');
     
      Utilisateur utilisateur=Utilisateur('', '', '', '', cinController.text, '', Utilisateur.fromStringtoUserType(userTypeController.text.toLowerCase()));

      _utilisateurDao.addUtilisateur(utilisateur);
      Navigator.pop(context);
      CustomSnackbar.success(message: '70'.tr, context: context);
    }on Exception catch (e) {
      if(e.toString()=='Exception: user-type-empty');
      CustomSnackbar.failure(message: '71'.tr, context: context);
      
    }
     
  }





  @override
  void onInit() {
    _utilisateurDao=UtilisateurDao();
    super.onInit();
  }
}