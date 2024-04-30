import 'package:get/get.dart';

import '../controllers/product_search_controller.dart';

class ProductsScreenBindings extends Bindings{

  @override
  void dependencies() {
    Get.put(ProductSearchController());
  }
}