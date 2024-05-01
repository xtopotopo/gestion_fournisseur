

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/models/produit.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends GetView{
  late final DocumentSnapshot<Produit> _documentSnapshot=Get.arguments['documentSnapshot'] as DocumentSnapshot<Produit>;
  ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Produit produit=((Get.arguments['documentSnapshot'] as DocumentSnapshot).data() as Produit);
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(
          Icons.edit,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
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
                      
                      Padding(
                        padding: const EdgeInsets.only(
                          
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description :'.tr,
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
                                      'Quantite :'.tr,
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.onBackground,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${produit.qunatite} ${produit.unite}',
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
                                      'Prix Unite :'.tr,
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.onBackground,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${produit.prixUnite.toString()} dh',
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
                              "Date d'achat :".tr,
                              style:TextStyle(
                                color: Theme.of(context).colorScheme.onBackground,
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${produit.date.year}-${produit.date.month}-${produit.date.day}',
                                style:const  TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
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
                  'Prix Totale :'.tr,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.w900,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(width: 5,),
                Text(
                  '${(produit.prixUnite*produit.qunatite).toString()} dh',
                  style:const  TextStyle(
                    fontWeight: FontWeight.w400,
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