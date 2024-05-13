import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'desktop/fournisseurs_desktop_screen.dart';
import 'mobile/fournisseurs_mobile_screen.dart';


class FournisseurSceen extends GetView {

  // Field
  late final TextEditingController _searchController;

  // Constructor
  FournisseurSceen({super.key}){
    _searchController =TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder:(context, constraints) {
        if(constraints.maxWidth<700){
          return FournisseurMobileSceen(searchController: _searchController,);
        }else{
          return FournisseurDesktopSceen(searchController: _searchController,);
        }
      },
    );
  } 
}