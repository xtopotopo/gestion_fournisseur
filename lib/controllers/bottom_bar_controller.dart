import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController{

  final List<IconData> _iconList=[Icons.home_filled,Icons.business_rounded,Icons.dashboard_customize_rounded];
  final List<String> _titleList=['65','64','dashboard'];
  late int _selectedIndex=0;

  List<IconData> get iconList=>_iconList;
  List<String> get titleList=>_titleList;
  int get selectedIndex=>_selectedIndex;

  void changePage({required int selectedIndex,required PageController pageController}){
    pageController.animateToPage(selectedIndex, duration:const Duration(milliseconds: 400), curve: Curves.ease);
    toggle(selectedIndex);
  }

  void toggle(int selectedIndex){
    _selectedIndex=selectedIndex;
    update();
  }

  
  
}