
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestion_fournisseur/models/fournisseur.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

class FournisseurExcelDao {

  Future<String?> excportProduitExcelAndroidVersion(List<DocumentSnapshot> docs) async{
    try {
     

      final List<int> bytes=getEXcelBytes(docs);


      final String path=(await getApplicationSupportDirectory()).path;
      final File file=File('$path/fournisseurs.xlsx');
      await file.writeAsBytes(bytes, flush: true);

       return file.path;
       
    } catch (e) {
      printError(info: e.toString());
      return null;
    }
  }

  List<int> getEXcelBytes(List<DocumentSnapshot> docs){
    int i=1;
      final Workbook workboob=Workbook();
      final Worksheet sheet=workboob.worksheets[0];
      sheet.name='Fournisseur';
      sheet.getRangeByName('A$i').setText('Nom');
      sheet.getRangeByName('B$i').setText('Email');
      sheet.getRangeByName('C$i').setText('Numero');

      for (var doc in docs) {
        Fournisseur fournisseur=doc.data() as Fournisseur;
        i++;
        sheet.getRangeByName('A$i').setText(fournisseur.nom);
        sheet.getRangeByName('B$i').setText(fournisseur.email);
        sheet.getRangeByName('C$i').setText(fournisseur.numero);
      }

      return workboob.saveAsStream();
  }
}