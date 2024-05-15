import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/screens/mobile/produits_mobile_screen.dart';
import 'package:gestion_fournisseur/models/fournisseur.dart';
import 'package:get/get.dart';
import 'desktop/produits_desktop_screen.dart';

class ProductsScreen extends GetView {

  // Field
  late final TextEditingController _searchController;
  late final PageController _pageController;
  late final Fournisseur? _fournisseur;
  late final String? _fournniseurId;

  // Constructor
  ProductsScreen({super.key}) {
    _searchController = TextEditingController(); 
    _fournniseurId= Get.parameters['fournisseurId'];
    final dataString = Get.parameters['fournisseurJson'];
    _fournisseur = Fournisseur.fromJson(jsonDecode(Uri.decodeComponent(dataString!))) ;
    printError(info: _fournisseur.toString());
    printError(info: _fournniseurId!);
    
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    

    return LayoutBuilder(
      builder:(context, constraints) {
        if(constraints.maxWidth<700){
          return ProductsMobileScreen(
            searchController: _searchController, 
            fournisseur: _fournisseur!,
            fournisseurId:_fournniseurId!,
            pageController: _pageController
          );
        }else{
          return ProductsDesktopScreen(
            searchController: _searchController, 
            fournisseur: _fournisseur!,
            fournisseurId:_fournniseurId!,
            pageController: _pageController
          );
        }
      },
    );
  }

  
}