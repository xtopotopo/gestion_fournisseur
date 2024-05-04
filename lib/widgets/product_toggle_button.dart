import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/produit_toggle_button_controllse.dart';

class CustomProductToggleButton extends GetView {
  const CustomProductToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProduitToggleButtonController>(
    builder: (controller) {
      return Container(
        height: 45,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.onBackground
          ),
          borderRadius: BorderRadius.circular(50)
        ), 
          child: ToggleButtons(
            onPressed: (index){
              controller.toggle(index);
            }, 
            fillColor: Color.fromARGB(90, 104, 104, 104),
            
            borderRadius: BorderRadius.circular(50),
            borderColor: Colors.transparent,
            isSelected: controller.isSelected,
            children: 
            [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Produits",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 12,
                    fontWeight: FontWeight.w800
                  ),
                ),
              ),
              Padding(
                padding:const EdgeInsets.all(8.0),
                child: Text(
                  "Statistics",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 12,
                    fontWeight: FontWeight.w800
                  ),
                ),
              )
            ],
          ),
      );
    }
          );
  }
}
