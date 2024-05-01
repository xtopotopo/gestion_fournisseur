import 'package:get/get.dart';
import '../controllers/fournisseur_controller.dart';
import '../controllers/fournisseur_search_controller.dart';

class MainScreenBindings extends Bindings{

  @override
  void dependencies() {
    Get.put(FournisseurSearchController(),permanent: true);
    Get.put(FournisseurController());
  }
}