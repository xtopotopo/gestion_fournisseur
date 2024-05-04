// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/models/fournisseur.dart';
import 'package:get/get.dart';
import '../dao/fournisseur_dao.dart';
import '../screens/screen_widgets/custom_snackbar.dart';

class FournisseurController extends GetxController{

  // Field
  late final FournisseurDao _fournisseurDao;

  // methods
  Stream<QuerySnapshot> getFournisseur(){
    return _fournisseurDao.getFournisseur();
  }

  Future<void> addFournisseur(
    {
      required TextEditingController nomController,
      required TextEditingController emailController,
      required TextEditingController numeroController,
      required BuildContext context,
    }) async {
      try{
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ),
            );
          },
        );
        String nom=nomController.text.trim();
        String email=emailController.text.trim();
        String numero=numeroController.text.trim();
        DocumentSnapshot? documentSnapshot= await _fournisseurDao.getFournisseurByField('nom', isEqualTo: nom);
        if(documentSnapshot==null){
          await _fournisseurDao.addFournisseur(Fournisseur(nom, email, numero));
          Navigator.pop(context);
          CustomSnackbar.success(message:'52'.tr, context: context);
        }
        else{
          throw Exception("fournisseur-already-exists");
        }
      }on FirebaseException catch(e){
        Navigator.pop(context);
        CustomSnackbar.failure(message:'33'.tr, context: context);
        printError(info: e.code);
      }on Exception catch(e){
        Navigator.pop(context);
        if(e.toString()=="Exception: fournisseur-already-exists"){
          CustomSnackbar.failure(message:'44'.tr, context: context);
        }
        printError(info: e.toString());
      }   
  }

  @override
  void onInit() {
    _fournisseurDao=FournisseurDao();
    super.onInit();
  }
} 