

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/models/fournisseur.dart';
import 'package:gestion_fournisseur/models/produit.dart';
import 'package:get/get.dart';

import '../controllers/produit_pdf_controller.dart';
import '../controllers/session_variables_controller.dart';
import 'screen_widgets/products_alert_dialog.dart';

class ProductDetailsScreen extends GetView{

  // Field
  late final DocumentSnapshot<Produit> _produitDocumentSnapshot;
  late final DocumentSnapshot<Fournisseur> _fournisseurDocumentSnapshot;

  // Constructor
  ProductDetailsScreen({super.key}){
    _produitDocumentSnapshot=Get.arguments['productDocumentSnapshot'] as DocumentSnapshot<Produit>;
    _fournisseurDocumentSnapshot=Get.arguments['fournisseurDocumentSnapshot'] as DocumentSnapshot<Fournisseur>;
    Get.find<ProduitPdfController>().productDocumentSnapshot=_produitDocumentSnapshot;
  }

  @override
  Widget build(BuildContext context) {
    final Produit produit=(_produitDocumentSnapshot.data() as Produit);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onBackground,
          size: 29
        ),
        actions: 
        [ 
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: IconButton(
              onPressed: () async{
                Get.find<ProduitPdfController>().exportPdf(fournisseurName: _fournisseurDocumentSnapshot.data()!.nom, context: context);
              }, 
              icon: const Icon(
                Icons.file_download,
              )
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton:(Get.find<SessionVariableController>().isAdmin() || Get.find<SessionVariableController>().isSuperUser())   
      ?FloatingActionButton(
        onPressed: (){
          ProduitAlertDialog.show(fournisseurId: _fournisseurDocumentSnapshot.id, context: context,type: ProductAlertDialogType.modify,productDocument: _produitDocumentSnapshot);
        },
        child: Icon(
          Icons.edit,
          color: Theme.of(context).colorScheme.background,
        ),
      )
      :null,
      body: ListView(
        children: 
        [
          Padding(
            padding: const EdgeInsets.only(
              left:10.0,
              right:10.0,
              top: 20
            ),
            child: Text(
              produit.nom,
              style:const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
              ),
            ),
          ),
          const SizedBox(height: 7,),
          Padding(
            padding: const EdgeInsets.only(
              left:10.0,
              right:10.0,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top:10.0,
                    left:15.0,
                    right:8.0,
                    bottom: 8
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '35'.tr,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              produit.description,
                              style:const  TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const SizedBox(height: 7,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '36'.tr,
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.onBackground,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${produit.quantite} ${produit.unite}',
                                      style:const  TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 50,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '37'.tr,
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.onBackground,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${produit.prixUnite.toString()} ${'38'.tr}',
                                      style:const  TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ), 
                            ],
                          ),
                          const SizedBox(height: 7,),
                          Text(
                            '39'.tr,
                            style:TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${(produit.date).toDate().year}-${(produit.date).toDate().month}-${(produit.date.toDate()).day}',
                              style:const  TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:const EdgeInsets.only(
              top: 15,
              left: 20
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${'40'.tr} :',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.w900,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(width: 5,),
                Text(
                  '${(produit.prixUnite*produit.quantite).toString()} ${'38'.tr}',
                  style:const  TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}