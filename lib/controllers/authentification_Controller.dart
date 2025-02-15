// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/dao/authentification_dao.dart';
import 'package:gestion_fournisseur/dao/utilisateur_dao.dart';
import 'package:gestion_fournisseur/models/utilisateur.dart';
import 'package:get/get.dart';

import '../screens/screen_widgets/circular_progress_indicror.dart';
import '../screens/screen_widgets/custom_snackbar.dart';
import '../services/session_variables_controller.dart';

class AuthentificationController extends GetxController{

  // Fields
  late UtilisateurDao _utilisateurDao;
  late AuthentificationDao _authentificationDao;

  // Constructor 
  AuthentificationController(){
    _utilisateurDao=UtilisateurDao();
    _authentificationDao=AuthentificationDao();
  }

  // SignUp method
  Future<void> signUp(
    {
      required BuildContext context,
      required TextEditingController nom,
      required TextEditingController prenom,
      required TextEditingController cin,
      required TextEditingController email,
      required TextEditingController numero,
      required TextEditingController password,
      required TextEditingController confirmationPassword,
    }) async{
    try{ 

      CircularProgreesIndicator.show(context);
      
      if(password.text.trim()!=confirmationPassword.text.trim()) throw Exception("confirmation-password-invalid");

      Utilisateur utilisateur=Utilisateur(
        nom.text.trim(), 
        prenom.text.trim(), 
        email.text.trim(), 
        numero.text.trim(), 
        cin.text.trim(), 
        password.text.trim(),
        null
      );

      DocumentSnapshot<Utilisateur>? userDocumentSnapshot = (await _utilisateurDao.isAllowed(cin.text.trim()));
      Utilisateur? utilisateurFromDb = userDocumentSnapshot?.data(); 
      
      if(utilisateurFromDb!= null){
       if(utilisateurFromDb.nom!='') throw Exception('user-already-exists');
        await _authentificationDao.signUp(
          email: utilisateur.email, 
          password: utilisateur.mdp
        );

        await _utilisateurDao.updateUtilisateur(
          utilisateur: utilisateurFromDb.copyWith(nom:utilisateur.nom, prenom:utilisateur.prenom, email:utilisateur.email, numero:utilisateur.numero, cin:utilisateur.cin), 
          documentId: userDocumentSnapshot!.id
        );
        
      }else if(utilisateurFromDb== null){
        throw Exception('not-allowed-to-signup');
      }
      
      Navigator.pop(context);
      CustomSnackbar.success(message:'55'.tr, context: context);
    }on FirebaseAuthException catch(e){      
      Navigator.pop(context);
      if(e.code=="email-already-in-use"){
        CustomSnackbar.failure(message:'53'.tr, context: context);
      }else{
        CustomSnackbar.failure(message:'33'.tr, context: context);
      }

      printError(info:e.toString());
    }on Exception catch(e){
      Navigator.pop(context);
      if(e.toString()=="Exception: confirmation-password-invalid"){
        CustomSnackbar.failure(message:'56'.tr, context: context);
      }else if(e.toString()=="Exception: not-allowed-to-signup"){
        CustomSnackbar.failure(message:'72'.tr, context: context);
      }else if(e.toString()=="Exception: user-already-exists"){
        CustomSnackbar.failure(message:'73'.tr, context: context);
      }else {
        CustomSnackbar.failure(message:'33'.tr, context: context);
      }
    }
  }

  // SignIn method
  Future<void> signIn({required BuildContext context,required TextEditingController email,required TextEditingController password}) async{
    try{

      CircularProgreesIndicator.show(context);

      String emailText = email.text.trim();
      String passwordText= password.text.trim();

      await _authentificationDao.signIn(
        email: emailText, 
        password: passwordText
      );

      Get.find<SessionVariableService>().userID=(await _utilisateurDao.getUtilisateur(emailText)).id;
      Get.find<SessionVariableService>().user=((await _utilisateurDao.getUtilisateur(emailText)).data()) as Utilisateur;


      Navigator.pop(context);
      
      Get.offAllNamed("/mainScreen");
    }on FirebaseAuthException catch(e){
      Navigator.pop(context);
      if(e.code=='invalid-credential'){
        CustomSnackbar.failure(message:'47'.tr, context: context);
      }else {
        CustomSnackbar.failure(message:'33'.tr, context: context);
      }
      printError(info: e.code);
    }on Exception catch(e){
      Navigator.pop(context);
      CustomSnackbar.failure(message:'33'.tr, context: context);
      printError(info: e.toString());
    }
  }

  // Reset Password method
  Future<void> resetPassword({required TextEditingController emailController,required BuildContext context}) async{
    try{
      CircularProgreesIndicator.show(context);

      String email=emailController.text.trim();
      
      bool exists=await _utilisateurDao.emailExists(email);

      if(!exists) throw Exception('account-not-found');
      
      await _authentificationDao.resetPassword(email);

      Navigator.pop(context);
      CustomSnackbar.success(message:'57'.tr, context: context);
      
    }on FirebaseAuthException catch(e){
      Navigator.pop(context);
      CustomSnackbar.failure(message:'33'.tr, context: context);
      printError(info:e.code);
    }on Exception catch(e){
      Navigator.pop(context);
      if(e.toString()=='Exception: account-not-found'){
        CustomSnackbar.failure(message:'54'.tr, context: context);
      }else {
        CustomSnackbar.failure(message:'33'.tr, context: context);
      }
      printError(info: e.toString());
    }
  }

  Future<void> signOut() async{
    await _authentificationDao.signOut();
    Get.find<SessionVariableService>().clear();
    Get.offAllNamed("/");
  }
}