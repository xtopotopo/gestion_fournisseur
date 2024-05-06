import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/produit_toggle_button_controller.dart';

class ProductToggleButton extends GetView {
  final PageController pageController;

  const ProductToggleButton({required this.pageController, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProduitToggleButtonController>(
      builder: (controller) {
        return Container(
          height: 35,
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(50),
            border: null
          ),
          child: ToggleButtons(
            onPressed: (index) {
              controller.changePage(selectedIndex: index, pageController: pageController);
            },
            fillColor: Colors.blueGrey.shade100.withOpacity(.5),
            borderRadius: BorderRadius.circular(50),
            
            isSelected: controller.isSelected,
            children: [
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
                padding: const EdgeInsets.all(8.0),
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
      },
    );
  }
}
