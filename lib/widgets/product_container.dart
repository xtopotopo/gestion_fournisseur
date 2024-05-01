import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/produit.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer(this._ducumentSnapshot,{super.key,});

  final DocumentSnapshot<Produit> _ducumentSnapshot;
  

  @override
  Widget build(BuildContext context) {
    final String nom=_ducumentSnapshot.data()!.nom;
    final String description=_ducumentSnapshot.data()!.description;
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
              (description.length>50)
              ?"${description.substring(0,47)}..."
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
                  Get.toNamed(
                    "/productDetailsScreen",
                    arguments: {
                      'documentSnapshot':_ducumentSnapshot
                    }
                  );
                  
                },
                child: Row(
                  children: [
                    Text(
                      "Details",
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