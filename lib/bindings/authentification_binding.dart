import 'package:gestion_fournisseur/controllers/authentification_Controller.dart';
import 'package:get/get.dart';

import '../controllers/password_text_field_controller.dart';

class AuthentificationBinding extends Bindings{

  @override
  void dependencies() {
    Get.put(AuthentificationController());
    Get.put(PasswordTextFieldController());
  }
}