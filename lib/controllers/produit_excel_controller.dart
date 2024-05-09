// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/dao/produit_excel_dao.dart';

import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

import '../screens/screen_widgets/custom_snackbar.dart';

class ProduitExcelController extends GetxController{

  // Field 
  late List<QueryDocumentSnapshot> produits;
  late ProduitExcelDao _produitExcelDao;

  Future<void> excportExcel({required BuildContext context,required String fournisseurName}) async {
    try {
      
      if(produits.length==2) throw Exception('no-product-to-upload');
      
      String? filePath=await _produitExcelDao.excportExcel(docs: produits, fournisseurName: fournisseurName);
      if(filePath==null) throw Exception('_');
     
      
      await OpenFile.open(filePath);
      
    } catch (e) {
       
      if(e.toString()=='Exception: no-product-to-upload'){
        CustomSnackbar.failure(message:'79'.tr, context: context);
      }else if(e.toString()=='Exception: _'){
        CustomSnackbar.failure(message:'33'.tr, context: context);
      }


    }
  }

  @override
  void onInit() {
    _produitExcelDao=ProduitExcelDao();
    super.onInit();
  }

}