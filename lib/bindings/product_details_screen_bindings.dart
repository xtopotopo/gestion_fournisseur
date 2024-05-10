import 'package:get/get.dart';

import '../controllers/produit_pdf_controller.dart';

class ProductDetailsScreenBindings extends Bindings{

  @override
  void dependencies() {
    Get.put(ProduitPdfController());
  }
  
}