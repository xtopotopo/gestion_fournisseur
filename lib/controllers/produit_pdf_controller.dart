// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:gestion_fournisseur/models/produit.dart';
import 'package:gestion_fournisseur/screens/screen_widgets/circular_progress_indicror.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'dart:convert';
import '../dao/produit_pdf_dao.dart';
import '../screens/screen_widgets/custom_snackbar.dart';

class ProduitPdfController extends GetxController{

  // Field 
  late DocumentSnapshot<Produit> _productDocumentSnapshot;
  late ProduitPdfDao _produitPdfDao;
  set productDocumentSnapshot(DocumentSnapshot<Produit> value)=>_productDocumentSnapshot=value;
  DocumentSnapshot<Produit> get productDocumentSnapshot=>_productDocumentSnapshot;

  Future<void> exportPdf(
    {
      required String fournisseurName,
      required BuildContext context,
    }
  ) async{
    try {
      CircularProgreesIndicator.show(context);
      if(kIsWeb){
        List<int> bytes=await _produitPdfDao.getPdfBytes(
          productDocumentSnapshot: _productDocumentSnapshot, 
          fournisseurName: fournisseurName
        );
        Navigator.pop(context);
        AnchorElement(
          href:
              'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
        ..setAttribute('download', 'produit.pdf')
        ..click();
      }else{
        final String? filePath= await _produitPdfDao.exportPdf(
          productDocumentSnapshot: _productDocumentSnapshot, 
          fournisseurName: fournisseurName
        );

        if(filePath==null) throw Exception('_');
        printError(info: filePath);
        Navigator.pop(context);
        OpenFile.open(filePath);
      }
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