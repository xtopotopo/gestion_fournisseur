// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:gestion_fournisseur/models/produit.dart';
import 'package:gestion_fournisseur/screens/screen_widgets/circular_progress_indicror.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

import '../dao/produit_pdf_dao.dart';
import '../screens/screen_widgets/custom_snackbar.dart';

class ProduitPdfController extends GetxController{

  // Field 
  late DocumentSnapshot<Produit> _productDocumentSnapshot;
  late ProduitPdfDao _produitPdfDao;
  set productDocumentSnapshot(DocumentSnapshot<Produit> value)=>_productDocumentSnapshot=value;

  Future<void> exportPdf(
    {
      required String fournisseurName,
      required BuildContext context,
    }
  ) async{
    try {
      CircularProgreesIndicator.show(context);

      final String? filePath= await _produitPdfDao.exportPdf(
        productDocumentSnapshot: _productDocumentSnapshot, 
        fournisseurName: fournisseurName
      );

      if(filePath==null) throw Exception('_');
      printError(info: filePath);
      Navigator.pop(context);
      OpenFile.open(filePath);
    } catch (e) {
      Navigator.pop(context);
      if(e.toString()=='Exception: _'){
        CustomSnackbar.failure(message:'33'.tr, context: context);
      }
    }
  } 

  @override
  void onInit() {
    _produitPdfDao=ProduitPdfDao();
    super.onInit();
  }
}