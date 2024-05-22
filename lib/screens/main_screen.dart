import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/screens/dashboard_screen.dart';
import 'package:gestion_fournisseur/screens/fournisseurs_screen.dart';
import 'package:gestion_fournisseur/screens/home_screen.dart';
import 'package:gestion_fournisseur/services/session_variables_controller.dart';
import 'package:gestion_fournisseur/widgets/custom_bottom_bar.dart';
import 'package:get/get.dart';

import '../controllers/bottom_bar_controller.dart';

class MainScreen extends GetView{

  // Field
  late final PageController _pageController;

  // Constructor
  MainScreen({super.key}){
    if(Get.find<SessionVariableService>().userID=='') Get.offAllNamed('/');
    _pageController=PageController(initialPage: 0);
   }

  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      bottomNavigationBar: CustomBottomBar(_pageController),
      body: PageView(
        onPageChanged: (selectedIndex){
          Get.find<BottomBarController>().toggle(selectedIndex);
        },
        controller: _pageController,
        physics:const NeverScrollableScrollPhysics(),
        children: 
        [
          HomeScreen(),
          FournisseurSceen(),
          DahsboardScreen()
        ],
      ),
    );
  }
  
}