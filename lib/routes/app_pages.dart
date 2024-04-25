import 'package:gestion_fournisseur/bindings/authentification_binding.dart';
import 'package:gestion_fournisseur/screens/sign_in_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: "/",
      page: () => SignInScreen(),
      binding: AuthentificationBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    
  ];
}
