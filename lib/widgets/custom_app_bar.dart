import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dark_light_mode_controller.dart';
import '../screens/screen_widgets/language_bottom_sheet.dart';

class CustomAppBar extends GetView implements PreferredSizeWidget {

  late final String? _title;

  CustomAppBar({super.key,String? title}){
    _title=title??'';
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 50,
      title: Text("${"1".tr} $_title"),
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
              );
            }
          ),
        ),
        Hero(
          tag: "tag-4",
          child: PopupMenuButton<String>(
            shape: RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(15), // Customize the radius here
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
              )
            ],
            onSelected:  (value) {
              switch (value) {
                case "language":
                  LanguageBottomSheet.show(context);
                  break;
                case "themes":
                  
                  break;
              }
            },
          ),
        )
      ],
    );
  }
  
  @override
  
  Size get preferredSize => const Size.fromHeight(50);
}