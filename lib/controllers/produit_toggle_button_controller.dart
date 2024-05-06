import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProduitToggleButtonController extends GetxController{

  List<bool> _isSelected=[true,false];

  void changePage({required int selectedIndex, required PageController pageController}) {
    pageController.animateToPage(selectedIndex, duration:const Duration(milliseconds: 300), curve: Curves.ease);
    toggle(selectedIndex);
    update();
  }


  void toggle(int selectedIndex){
    switch(selectedIndex){
      case 0:
        _isSelected=[true,false];
        break;
      case 1:
        _isSelected=[false,true];
        break;
    }
    update();
  }

  List<bool> get isSelected => _isSelected;

}