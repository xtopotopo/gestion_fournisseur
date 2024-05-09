// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:gestion_fournisseur/dao/fournisseur_excel.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

import '../screens/screen_widgets/custom_snackbar.dart';

class FournisseurExcelController extends GetxController{
  
  // Field
  late List<DocumentSnapshot> fournisseurs;
  late final FournisseurExcelDao _fournisseurExcelDao;

  // Excport Method
  Future<void> excportExcel(BuildContext context) async{
    try{
      if(fournisseurs.isEmpty)throw Exception('no-supliers-to-upload');
      String? filePath= await _fournisseurExcelDao.excportProduitExcel(fournisseurs);
      if(filePath==null) throw Exception('_');
      await OpenFile.open(filePath);
    }catch(e){
      if(e.toString()=='Exception: no-supliers-to-upload'){
        CustomSnackbar.failure(message:'79'.tr, context: context);
      }else if(e.toString()=='Exception: _'){
        CustomSnackbar.failure(message:'33'.tr, context: context);
      }
    }
  }

  // Getter



  @override
  void onInit() {
    _fournisseurExcelDao=FournisseurExcelDao();
    super.onInit();
  }

}