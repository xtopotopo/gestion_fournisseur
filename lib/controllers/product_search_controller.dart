import 'package:get/get.dart';

class ProductSearchController extends GetxController {

  //Field
  bool onSearch = false;

  // Methods
  void onChanged(String value) {
    if (value.trim().isNotEmpty) {
      onSearch = true;
    } else {
      onSearch = false;
    }
    update(); 
  }

 
}
