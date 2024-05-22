import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/controllers/authentification_controller.dart';
import 'package:get/get.dart';

import '../controllers/dark_light_mode_controller.dart';
import '../screens/screen_widgets/language_bottom_sheet.dart';

class CustomAppBar extends GetView implements PreferredSizeWidget {

  late final String? _title;

  CustomAppBar({super.key,String? title}){
    _title=(title!=null)?'${title.substring(0,1).toUpperCase()}${title.substring(1).toLowerCase()}':'';
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: (Get.currentRoute=='/')
      ?Theme.of(context).colorScheme.background
      :Theme.of(context).colorScheme.secondary,
      title:(Get.currentRoute!="/") ?Text("${"1".tr} $_title",style: TextStyle(color: (Get.currentRoute!="/")?Colors.white:null,),):null,
      actions: [
        Hero(
          tag: "tag-3",
          child: GetBuilder<DarkLightModeController>(
            builder: (controller) {
              return IconButton(
                onPressed: (){
                  controller.toogle();
                }, 
                icon: controller.icon,
                color: (Get.currentRoute!="/")?Colors.white:null,
              );
            }
          ),
        ),
        Hero(
          tag: "tag-4",
          child: PopupMenuButton<String>(
            iconColor: (Get.currentRoute!="/")?Colors.white:null,
            shape: RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(15),
            ),
            itemBuilder: (context)=>[
               PopupMenuItem(
                value: "language",
                child: Row(
                  children: [
                     Icon(
                      Icons.language_rounded,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    const Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 4.0),
                      child:  Text("  "),
                    ),
                    Text('24'.tr)
                  ],
                )
              ),
              if(Get.currentRoute!="/")
               PopupMenuItem(
                value: "themes",
                child: Row(
                  children: [
                     Icon(
                      Icons.color_lens_rounded,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    const Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 4.0),
                      child:  Text("  "),
                    ),
                    Text('25'.tr)
                  ],
                )
              ),
              if(Get.currentRoute!="/")
               PopupMenuItem(
                value: "logout",
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout_rounded,
                      color: Colors.redAccent,
                    ),
                    const Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 4.0),
                      child:  Text("  "),
                    ),
                    Text('66'.tr,style:const TextStyle(color: Colors.redAccent))
                  ],
                )
              )
            ],
            onSelected:  (value) {
              switch (value) {
                case "language":
                  LanguageBottomSheet.show(context);
                  break;
                case "themes":
                  
                  break;
                case "logout":
                  Get.find<AuthentificationController>().signOut();
                  break;
              }
            },
          ),
        )
      ],
    );
  }
  
  @override
  
  Size get preferredSize => const Size.fromHeight(55);
}