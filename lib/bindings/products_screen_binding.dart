import 'package:get/get.dart';

import '../controllers/product_search_controller.dart';
import '../controllers/produit_controller.dart';
import '../controllers/produit_toggle_button_controllse.dart';

class ProductsScreenBindings extends Bindings{

  @override
  void dependencies() {
    Get.put(ProductSearchController());
    Get.put(ProduitController());
    Get.put(ProduitToggleButtonController());
  }
}