import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/dao/produit_dao.dart';
import 'package:gestion_fournisseur/screens/screen_widgets/circular_progress_indicror.dart';
import 'package:get/get.dart';

import '../models/produit.dart';

class ProduitController extends GetxController {
  
  late final ProduitDao _produitDao;

  Future<void> addProduit({required Produit produit,required String fournisseurId,required BuildContext context}) async{
    _produitDao=ProduitDao(fournisseurId);
    try{
      CircularProgreesIndicator.show(context);
      await _produitDao.addProduit(produit);
      Navigator.pop(context);
    }on FirebaseException catch(e){
      printError(info: e.code);
    }on Exception catch(e){
      printError(info: e.toString());
    }
  }

}