import 'package:get/get.dart';

import '../controllers/product_search_controller.dart';
import '../controllers/produit_controller.dart';
import '../controllers/produit_excel_controller.dart';
import '../controllers/produit_toggle_button_controller.dart';

class ProductsScreenBindings extends Bindings{

  @override
  void dependencies() {
    Get.put(ProductSearchController());
    Get.put(ProduitController());
    Get.put(ProduitToggleButtonController());
    Get.put(ProduitExcelController());
  }
}