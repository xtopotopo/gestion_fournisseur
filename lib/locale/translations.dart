import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppTranslations implements Translations{

  @override
  Map<String,Map<String,String>> get keys =>{
    'ar':{
      '1':"مرحباً",
    },

    "en":{
      '1':"Hello",
    },

    'fr':{
      '1':"Bonjour",
    }
  };
}