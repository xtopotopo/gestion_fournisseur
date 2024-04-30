import 'package:flutter/material.dart';

import '../models/produit.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.produit,
  });

  final Produit produit;

  @override
  Widget build(BuildContext context) {
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
            (produit.nom.length>20)
            ?"${produit.nom.substring(0,17)}..."
            :produit.nom,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 17.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              (produit.description.length>50)
              ?"${produit.description.substring(0,47)}..."
              :produit.description,
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