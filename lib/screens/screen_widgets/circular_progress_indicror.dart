import 'package:flutter/material.dart';

class CircularProgreesIndicator {
  static void show(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.secondary,
          ),
        );
      },
    );
  }
}