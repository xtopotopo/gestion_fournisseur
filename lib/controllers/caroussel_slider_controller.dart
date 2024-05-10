import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CarousselSliderController extends GetxController{
  late List<String> _imagesPath;
  late List<Image> _imageList;
  late int _selectedIndex=0;
  late Timer _timer;

  int get selectedIndex =>_selectedIndex;
  List<Image> get imageList=>_imageList;

  set selectedIndex(int value)=>_selectedIndex;

  void changePage({required PageController pageController,required int selectedIndex }){
    _selectedIndex=selectedIndex;
    pageController.animateToPage(selectedIndex, duration:const Duration(milliseconds: 700), curve: Curves.ease);
    update();
  }

  void startTimer(PageController pageController){
    _timer=Timer.periodic(const Duration(seconds: 5), (timer) {
      if(pageController.page==Get.find<CarousselSliderController>().imageList.length-1) {
        pageController.animateToPage(0, duration:const Duration(milliseconds: 500), curve: Curves.ease);
      }else{
        pageController.nextPage(duration: const Duration(milliseconds: 500), curve:  Curves.ease);
      }
    });
  }

  void changeIndex(int value){
    _selectedIndex=value;
    update();
  }

  @override
  void onInit() {
    _imagesPath=['images/image1.png','images/image2.png','images/image3.png'];
    _imageList=List.generate(_imagesPath.length, (index) => Image.asset(_imagesPath[index],fit: BoxFit.cover,));
    super.onInit();
  }
}