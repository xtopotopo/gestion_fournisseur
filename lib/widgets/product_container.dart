
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/produit.dart';

class ProductContainer extends StatelessWidget {
  

  late final DocumentSnapshot<Produit> _documentSnapshot;
  late final String _fournisseurName;
  late final String _fournisseurId;

  ProductContainer({required DocumentSnapshot<Produit> documentSnapshot,super.key,required String fournisseurName,required String fournisseurId}){
    _fournisseurName=fournisseurName;
    _fournisseurId=fournisseurId;
    _documentSnapshot=documentSnapshot;
  }

  @override
  Widget build(BuildContext context) {
    final String nom=_documentSnapshot.data()!.nom;
    final String description=_documentSnapshot.data()!.description;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius:  BorderRadius.circular(18)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (nom.length>20)
            ?"${nom.substring(0,17)}..."
            :nom,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 17.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              (MediaQuery.of(context).size.width<700)
                ?(description.length>50)
                  ?"${description.substring(0,47)}..."
                  :description
                :(MediaQuery.of(context).size.height<700)
                  ?(description.length>8)
                    ?"${description.substring(0,10)}..."
                    :description
                  :description,
              style:  TextStyle(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 15.0,
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                  final String productId=_documentSnapshot.id;
                 
                  
                  Get.toNamed(
                    "/productDetailsScreen?productId=$productId&fournisseurId=$_fournisseurId&fournisseurName=$_fournisseurName",
                  );
                  
                },
                child: Row(
                  children: [
                    Text(
                      '34'.tr,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}