import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends GetView{

  const CustomButton({super.key, required Null Function() onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {  }, 
      child: null,
    );
  }
  
}