import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProduitToggleButtonController extends GetxController{

  List<bool> _isSelected=[true,false];

  void changePage({required int selectedIndex, required PageController pageController}) {
  switch (selectedIndex) {
    case 0:
      pageController.animateToPage(0, duration:const Duration(milliseconds: 300), curve: Curves.ease);
      break;
    case 1:
      pageController.animateToPage(1, duration:const Duration(milliseconds: 300), curve: Curves.ease);
      break;
  }
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