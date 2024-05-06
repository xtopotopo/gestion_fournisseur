// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gestion_fournisseur/dao/produit_dao.dart';
import 'package:gestion_fournisseur/screens/screen_widgets/circular_progress_indicror.dart';
import 'package:get/get.dart';

import '../models/produit.dart';
import '../screens/screen_widgets/custom_snackbar.dart';

class ProduitController extends GetxController {
  
  late ProduitDao _produitDao;

  Future<void> addProduit({
      required TextEditingController nomController,
      required TextEditingController descriptionController,
      required TextEditingController quantiteController,
      required TextEditingController uniteController,
      required TextEditingController prixUniteController,
      required TextEditingController dateController,
      required String fournisseurId,
      required BuildContext context
    }) async{
      _produitDao=ProduitDao(fournisseurId);
      final String nom=nomController.text.trim().toLowerCase();
      final String description=descriptionController.text.toLowerCase();
      final double quantite=double.parse(quantiteController.text);
      final double prixUnite=double.parse(prixUniteController.text);
      final String unite=uniteController.text;
      final Timestamp date=Timestamp.fromMillisecondsSinceEpoch(DateTime.parse(dateController.text).millisecondsSinceEpoch);

    try{
      CircularProgreesIndicator.show(context);
      await _produitDao.addProduit(
        Produit(nom, description, prixUnite, unite, quantite,date)
      );
      Navigator.pop(context);
      CustomSnackbar.success(message: '51'.tr, context: context);
    }on FirebaseException catch(e){
      CustomSnackbar.failure(message: '33'.tr, context: context);
      printError(info: e.code);
    }on Exception catch(e){
      CustomSnackbar.failure(message: '33'.tr, context: context);
      printError(info: e.toString());
    }
  }

  Future<void> updateProduit(
    {
      required TextEditingController nomController,
      required TextEditingController descriptionController,
      required TextEditingController quantiteController,
      required TextEditingController uniteController,
      required TextEditingController prixUniteController,
      required TextEditingController dateController,
      required String fournisseurId,
      required String productId,
      required BuildContext context
  }) async{
    try {
      _produitDao=ProduitDao(fournisseurId);
      final String nom=nomController.text.trim().toLowerCase();
      final String description=descriptionController.text.toLowerCase();
      final double quantite=double.parse(quantiteController.text);
      final double prixUnite=double.parse(prixUniteController.text);
      final String unite=uniteController.text;
      final Timestamp date=Timestamp.fromMillisecondsSinceEpoch(DateTime.parse(dateController.text).millisecondsSinceEpoch);

      await _produitDao.updateProduit(documentId: productId, produit: Produit(nom, description, prixUnite, unite, quantite, date));
      Get.back();
      CustomSnackbar.success(message: '50'.tr, context: context);
      
     
    }on FirebaseException catch (e) {
      CustomSnackbar.failure(message: '33'.tr, context: context);
      printError(info: e.code);
    }on Exception catch(e){
      CustomSnackbar.failure(message: '33'.tr, context: context);
      printError(info: e.toString());
    }
  }

  double avgDepenses(List<DocumentSnapshot<Produit>> produits){
    if(produits.isNotEmpty){
      double temp=0;
      double avg=0;
      for(var produit in produits){
        temp+=(produit.data()!.prixUnite*produit.data()!.quantite);
      }
      avg=temp/produits.length;
      return double.parse(avg.toStringAsFixed(2));
    }
    return 0;
  }

  List<DocumentSnapshot<Produit>>? productAboveAVG(List<DocumentSnapshot<Produit>> produits){
    if(produits.isNotEmpty){
      double avg=avgDepenses(produits);
      var products=produits.where(
        (produitDocumentsnapshot) => (produitDocumentsnapshot.data()!.prixUnite*produitDocumentsnapshot.data()!.quantite)>=avg
      ).toList();

      return products;
    }
    return null;
  }

  List<DocumentSnapshot<Produit>>? productUnderAVG(List<DocumentSnapshot<Produit>> produits){
    if(produits.isNotEmpty){
      double avg=avgDepenses(produits);
      var products=produits.where(
        (produitDocumentsnapshot) => (produitDocumentsnapshot.data()!.prixUnite*produitDocumentsnapshot.data()!.quantite)<avg
      ).toList();

      return products;
    }
    return null;
  }

}