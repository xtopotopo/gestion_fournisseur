import 'package:gestion_fournisseur/controllers/authentification_controller.dart';
import 'package:get/get.dart';
import '../controllers/bottom_bar_controller.dart';
import '../controllers/dashboard_controller.dart';
import '../controllers/fournisseur_controller.dart';
import '../controllers/fournisseur_search_controller.dart';
import '../controllers/utilisateur_controller.dart';

class MainScreenBindings extends Bindings{

  @override
  void dependencies() {
    Get.put(FournisseurSearchController(),permanent: true);
    Get.put(FournisseurController());
    Get.put(BottomBarController());
    Get.lazyPut(() => AuthentificationController());
    Get.put(DashboardController());
    Get.lazyPut(() => UtilisarteurController());

  }
}