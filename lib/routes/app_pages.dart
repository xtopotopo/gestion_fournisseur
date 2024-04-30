import 'package:gestion_fournisseur/bindings/authentification_binding.dart';
import 'package:gestion_fournisseur/bindings/main_screen_bindings.dart';
import 'package:gestion_fournisseur/screens/produits_screen.dart';
import 'package:gestion_fournisseur/screens/sign_in_screen.dart';
import 'package:gestion_fournisseur/screens/sign_up_screen.dart';
import 'package:get/get.dart';

import '../bindings/products_screen_binding.dart';
import '../screens/fournisseurs_screen.dart';
import '../screens/reset_password_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: "/",
      page: () => SignInScreen(),
      binding: AuthentificationBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
      children: [
        GetPage(
          name: "/signUpScreen", 
          page: ()=>SignUpScreen(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),

        ),
        GetPage(
          name: "/resetPasswordScreen", 
          page: () => ResetPasswordScreen(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
        )
      ]
    ),
    GetPage(
      name: "/fournisseurScreen", 
      page: () => FournisseurSceen(),
      binding: MainScreenBindings(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 400),
      
    ),
    GetPage(
      name: "/productsScreen", 
      page: () => ProductsScreen(),
      binding: ProductsScreenBindings(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 400),
    )

    
  ];
}
