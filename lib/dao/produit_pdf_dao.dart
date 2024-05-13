import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdf;

import '../models/produit.dart';

class ProduitPdfDao {
  Future<String?> exportPdf({required DocumentSnapshot<Produit> productDocumentSnapshot,required String fournisseurName}) async {
    try{
      
      final List<int> bytes =await getPdfBytes(productDocumentSnapshot: productDocumentSnapshot, fournisseurName: fournisseurName);
      final String path = (await getApplicationSupportDirectory()).path;
      final file = File('$path/$fournisseurName.pdf');
      await file.writeAsBytes(bytes ,flush: true);
      
      return file.path;


    }catch(e){
      return null;
    }
  }

  Future<List<int>> getPdfBytes({required DocumentSnapshot<Produit> productDocumentSnapshot,required String fournisseurName}) async{
    final Produit produit =productDocumentSnapshot.data()!;
    final double prixTotale=double.parse(((produit.prixUnite)*(produit.quantite)).toStringAsFixed(2));
    final facturePdf = pdf.Document();
    facturePdf.addPage(
      pdf.Page(
        build: (pdf.Context context) {
          return pdf.Column(
            children: 
            [
              pdf.Column(
                mainAxisAlignment: pdf.MainAxisAlignment.center,
                children: 
                [
                  pdf.Text(
                    'Facture Produit',
                    style: pdf.TextStyle(
                      fontSize: 20, 
                      fontWeight: pdf.FontWeight.bold, 
                      color: PdfColors.black
                    )
                  ),
                  pdf.SizedBox(height: 200),
                  pdf.Row(
                    mainAxisAlignment :pdf.MainAxisAlignment.start,
                    children: [
                       pdf.Text(
                        'Fournisseur : ',
                        style: pdf.TextStyle(
                          fontSize: 15, 
                          fontWeight: pdf.FontWeight.bold, 
                          color: PdfColors.black
                        )
                      ),
                      pdf.Text(
                        fournisseurName,
                        style: pdf.TextStyle(
                          fontSize: 15, 
                          fontWeight: pdf.FontWeight.bold, 
                          color: PdfColors.black
                        )
                      ),
                      
                    ]
                  ),
                  pdf.SizedBox(height: 30),
                  pdf.Table(
                    border: pdf.TableBorder.all(
                      color: PdfColors.black,
                      width: 1
                    ),
                    //defaultVerticalAlignment: pdf.TableCellVerticalAlignment.middle,
                    children: 
                    [
                       pdf.TableRow(
                        decoration:const pdf.BoxDecoration(
                          color: PdfColors.redAccent
                        ),
                        children: 
                        [
                          pdf.Container(child: pdf.Text('Produit')),
                          pdf.Container(child: pdf.Text('Prix unite')),
                          pdf.Container(child: pdf.Text('Unite')),
                          pdf.Container(child: pdf.Text('Quantite')),
                          pdf.Container(child: pdf.Text('Prix Totale')),
                        ]
                      ),
                       pdf.TableRow(
                        decoration:const pdf.BoxDecoration(
                          color: PdfColors.white
                        ),
                        children: 
                        [
                          pdf.Container(child: pdf.Text(produit.nom)),
                          pdf.Container(child: pdf.Text('${produit.prixUnite}')),
                          pdf.Container(child: pdf.Text(produit.unite)),
                          pdf.Container(child: pdf.Text('${produit.quantite}')),
                          pdf.Container(child: pdf.Text('$prixTotale')),
                        ]
                      )
                    ]
                  )
                ]
              )
            ]
          );
        }
      )
    );
    return await facturePdf.save();
  }
}