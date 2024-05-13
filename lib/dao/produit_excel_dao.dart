import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';


import '../models/produit.dart';

class ProduitExcelDao{

  Future<String?> excportExcelAndroidVersion({required List<QueryDocumentSnapshot> docs, required String fournisseurName}) async {
    try {
      
      final List<int> bytes = getExcelBytes(docs: docs, fournisseurName: fournisseurName);
      final String path = (await getApplicationSupportDirectory()).path;
      final File file = File('$path/$fournisseurName.xlsx');

      await file.writeAsBytes(bytes, flush: true);

      return file.path;
    } catch (e) {
      printError(info: e.toString());
      return null;
    }
  }

  

  List<int> getExcelBytes({required List<QueryDocumentSnapshot> docs, required String fournisseurName}){
    int i = 1;
      final Workbook workbook = Workbook();
      final Worksheet worksheet = workbook.worksheets[0];
      worksheet.name=fournisseurName;
      worksheet.getRangeByName('A$i').setText('Nom');
      //worksheet.getRangeByName('B$i').setText('Description');
      worksheet.getRangeByName('C$i').setText('prixUnite');
      worksheet.getRangeByName('D$i').setText('Unite');
      worksheet.getRangeByName('E$i').setText('quantite');
      worksheet.getRangeByName('F$i').setText('prixTotale');

      for (var doc in docs) {
        Produit produit = doc.data() as Produit;
        i++;
        worksheet.getRangeByName('A$i').setText(produit.nom);
        //worksheet.getRangeByName('B$i').setText(produit.description);
        worksheet.getRangeByName('C$i').setNumber(produit.prixUnite);
        worksheet.getRangeByName('D$i').setText(produit.unite);
        worksheet.getRangeByName('E$i').setNumber(produit.quantite);
        worksheet.getRangeByName('F$i').setNumber(double.parse((produit.quantite * produit.prixUnite).toStringAsFixed(2)));
      }
      return workbook.saveAsStream(); 
  }

}