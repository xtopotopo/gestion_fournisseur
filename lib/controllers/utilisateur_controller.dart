// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
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
      DocumentSnapshot<Utilisateur>? userDocumentSnapshot = (await _utilisateurDao.isAllowed(cinController.text.trim()));
      Utilisateur? utilisateurFromDb = userDocumentSnapshot?.data(); 
      if(utilisateurFromDb!=null) throw Exception('user-already-exists');
      _utilisateurDao.addUtilisateur(utilisateur);
      Navigator.pop(context);
      CustomSnackbar.success(message: '70'.tr, context: context);
    }on Exception catch (e) {
      Navigator.pop(context);
      if(e.toString()=='Exception: user-type-empty') {
        CustomSnackbar.failure(message: '71'.tr, context: context);
      }else if(e.toString()=="Exception: user-already-exists"){
        CustomSnackbar.failure(message:'73'.tr, context: context);
      }
      
    }
     
  }

  Future<void> deleteUser({required TextEditingController cinController, required BuildContext context}) async{
    try {
      CircularProgreesIndicator.show(context);
      DocumentSnapshot<Utilisateur>? userDocumentSnapshot = (await _utilisateurDao.isAllowed(cinController.text.trim()));
      Utilisateur? utilisateurFromDb = userDocumentSnapshot?.data(); 

      if(utilisateurFromDb==null) throw Exception('user-do-not-exists');
      
      await _utilisateurDao.deleteUtilisateur(userDocumentSnapshot!.id);

      CustomSnackbar.success(message: '78'.tr, context: context);
      Navigator.pop(context);
    }on Exception catch (e) {
      Navigator.pop(context);
      if(e.toString()=='Exception: user-do-not-exists') {
        CustomSnackbar.failure(message: '77'.tr, context: context);
      }else if(e.toString()=="Exception: user-already-exists"){
        CustomSnackbar.failure(message:'73'.tr, context: context);
      }
    }
  }



  @override
  void onInit() {
    _utilisateurDao=UtilisateurDao();
    super.onInit();
  }
}