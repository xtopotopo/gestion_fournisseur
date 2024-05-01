
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/models/fournisseur.dart';
import 'package:get/get.dart';

class FournisseurContainer extends GetView{

  // Field
  late final DocumentSnapshot _documentSnapshot;
  
  // Constructor
  FournisseurContainer(DocumentSnapshot documentSnapshot,{super.key}){
    _documentSnapshot=documentSnapshot;
  }

  @override
  Widget build(BuildContext context) {
    String nom=(_documentSnapshot.data() as Fournisseur).nom;
    String email=(_documentSnapshot.data() as Fournisseur).email;
    String numero=(_documentSnapshot.data() as Fournisseur).numero;

    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          
          color: Theme.of(context).colorScheme.primary,
          borderRadius:  BorderRadius.circular(18)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: 
            [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nom.toUpperCase(), 
                    style:const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800
                    )
                  
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5,left: 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: 
                      [
                        Row(
                          children: [
                            Icon(
                              Icons.circle_rounded,
                              color: Theme.of(context).colorScheme.onPrimary,
                              size: 5,
                            ),
                            const SizedBox(width: 2,),
                            Text(
                              email,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 12,
                                      
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 3,),
                        Row(
                          children: [
                            Icon(
                              Icons.circle_rounded,
                              color: Theme.of(context).colorScheme.onPrimary,
                              size: 5,
                            ),
                            const SizedBox(width: 2,),
                            Text(
                              numero,
                               style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: (){
                  Get.toNamed(
                    "/productsScreen",arguments:
                    {'fournisseurDocumentSnapshot':_documentSnapshot}
                  );

                }, 
                icon: const Icon(Icons.arrow_forward_ios_rounded)
              )
            ],
            
          ),
        ) ,
      ),
    );
  }
  
}