import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/controllers/dark_light_mode_controller.dart';
import 'package:gestion_fournisseur/controllers/session_variables_controller.dart';
import 'package:gestion_fournisseur/controllers/translations_controller.dart';
import 'package:gestion_fournisseur/locale/translations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'controllers/produit_toggle_button_controllse.dart';
import 'firebase_options.dart';
import 'locale/themes.dart';
import 'routes/app_pages.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    Get.put(SessionVariableController());
    Get.put(DarkLightModeController());
    Get.put(TranslationsController());
    Get.put(ProduitToggleButtonController());


    return GetMaterialApp(
      locale: Locale(Get.find<TranslationsController>().chosenLanguage),
      getPages: AppPages.routes,
      translations: AppTranslations(),
      theme: Themes.lightMode,
      darkTheme: Themes.darkMode,
      themeMode: Get.find<DarkLightModeController>().themMode,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
    );
  }
}

