import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/screens/fournisseurs_screen.dart';
import 'package:gestion_fournisseur/screens/home_screen.dart';
import 'package:gestion_fournisseur/widgets/custom_bottom_bar.dart';
import 'package:get/get.dart';

import '../controllers/bottom_bar_controller.dart';

class MainScreen extends GetView{
  late final PageController _pageController;

   MainScreen({super.key}){
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
          const HomeScreen(),
          FournisseurSceen()
        ],
      ),
    );
  }
  
}