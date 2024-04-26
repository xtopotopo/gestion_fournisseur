import 'package:gestion_fournisseur/bindings/authentification_binding.dart';
import 'package:gestion_fournisseur/screens/sign_in_screen.dart';
import 'package:gestion_fournisseur/screens/sign_up_screen.dart';
import 'package:get/get.dart';

import '../screens/reset_password_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: "/",
      page: () => SignInScreen(),
      binding: AuthentificationBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      children: [
        GetPage(
          name: "/signUpScreen", 
          page: ()=>SignUpScreen(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 500),

        ),
        GetPage(
          name: "/resetPasswordScreen", 
          page: () => ResetPasswordScreen(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 500),
        )
      ]
    ),

    
  ];
}
