import 'package:get/get.dart';

class FournisseurSearchController extends GetxController {

  //Foeld
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
