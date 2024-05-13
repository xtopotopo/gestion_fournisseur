import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/screens/mobile/produits_mobile_screen.dart';
import 'package:gestion_fournisseur/models/fournisseur.dart';
import 'package:get/get.dart';
import 'desktop/produits_desktop_screen.dart';

class ProductsScreen extends GetView {

  // Field
  late final TextEditingController _searchController;
  late final DocumentSnapshot<Fournisseur> _fournisseurDocumentSnapshot;
  late final PageController _pageController;

  // Constructor
  ProductsScreen({super.key}) {
    _searchController = TextEditingController();
    _fournisseurDocumentSnapshot = Get.arguments['fournisseurDocumentSnapshot'] as DocumentSnapshot<Fournisseur>;
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    

    return LayoutBuilder(
      builder:(context, constraints) {
        if(constraints.maxWidth<700){
          return ProductsMobileScreen(
            searchController: _searchController, 
            fournisseurDocumentSnapshot: _fournisseurDocumentSnapshot, 
            pageController: _pageController
          );
        }else{
          return ProductsDesktopScreen(
            searchController: _searchController, 
            fournisseurDocumentSnapshot: _fournisseurDocumentSnapshot, 
            pageController: _pageController
          );
        }
      },
    );
  }

  
}