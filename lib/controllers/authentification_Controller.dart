// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gestion_fournisseur/dao/authentification_dao.dart';
import 'package:gestion_fournisseur/dao/utilisateur_dao.dart';
import 'package:gestion_fournisseur/models/utilisateur.dart';
import 'package:get/get.dart';

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
  Future<void> signUp(Utilisateur utilisateur) async{
    try{ 
      bool exists=await _utilisateurDao.emailExists(utilisateur.email);
      
      if(exists) throw Exception('email-already-in-use');

      await _utilisateurDao.addUtilisateur(utilisateur);
      await _authentificationDao.signUp(
        email: utilisateur.email, 
        password: utilisateur.mdp
      );
    }catch(e){
      print(e.toString());
    }
  }

  // SignIn method
  Future<void> signIn({required BuildContext context,required TextEditingController email,required TextEditingController password}) async{
    try{
      showDialog(
        context: context, 
        barrierDismissible: false,
        builder: (constext){
          return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              );
        }
      );
      await _authentificationDao.signIn(
        email: email.text.trim(), 
        password: password.text.trim()
      );

      Navigator.pop(context);

      print(email.text.trim());
      print(password.text.trim());
      
      //get.to.....
    }on FirebaseAuthException catch(e){
      Navigator.pop(context);
      printError(info: e.code);
    }on Exception catch(e){
      Navigator.pop(context);
      printError(info: e.toString());
    }
  }

  // Reset Password method
  Future<void> resetPassword(String email) async{
    try{
      bool exists=await _utilisateurDao.emailExists(email);
      
      if(exists) throw Exception('email-already-in-use');
      
      await _authentificationDao.resetPassword(email);
      //Get.back()
    }on FirebaseAuthException catch(e){
      print(e.code);
    }
  }
}