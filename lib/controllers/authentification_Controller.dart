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
      
      if(password.text.trim()!=confirmationPassword.text.trim()) throw Exception("confirmation-password-invalid");

      Utilisateur utilisateur=Utilisateur(
        nom.text.trim(), 
        prenom.text.trim(), 
        email.text.trim(), 
        numero.text.trim(), 
        cin.text.trim(), 
        password.text.trim()
      );
      
      
      //bool exists=await _utilisateurDao.emailExists(utilisateur.email);
      
      //if(exists) throw Exception('email-already-in-use');
      await _authentificationDao.signUp(
        email: utilisateur.email, 
        password: utilisateur.mdp
      );

      await _utilisateurDao.addUtilisateur(utilisateur);
      
      
      Navigator.pop(context);

    }catch(e){
      Navigator.pop(context);

      printError(info:e.toString());
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
  Future<void> resetPassword({required TextEditingController emailController,required BuildContext context}) async{
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

      String email=emailController.text.trim();

      print(email);
      
      bool exists=await _utilisateurDao.emailExists(email);
      
      if(exists) throw Exception('email-already-in-use');
      
      await _authentificationDao.resetPassword(email);

      Navigator.pop(context);
      //Get.back()
      
    }on FirebaseAuthException catch(e){
      Navigator.pop(context);
      print(e.code);
    }
  }
}