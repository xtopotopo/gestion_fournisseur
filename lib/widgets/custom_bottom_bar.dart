import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/bottom_bar_controller.dart';
import '../services/session_variables_controller.dart';

class CustomBottomBar extends GetView {

  late final PageController _pageController;
  CustomBottomBar(PageController pageController,{
    super.key,
  }){
    _pageController=pageController;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(
      builder: (controller) {
        return Container(
         
         height: 45,
         width: double.maxFinite,
         decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.inversePrimary
            )
          ),
           color: Theme.of(context).colorScheme.background,
           
         ),
         child: Row(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Expanded(
               child: Padding(
                 padding: const EdgeInsets.only(right: 10.0),
                 child: Material(
                   color: Colors.transparent,
                   child: InkWell(
                      borderRadius:const BorderRadius.all(Radius.elliptical(15, 50)),
                      splashFactory: InkRipple.splashFactory,
                      onTap: () {
                        controller.changePage(selectedIndex: 0, pageController: _pageController);
                      },
        
                      highlightColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                      splashColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            controller.iconList[0],
                            color: (controller.selectedIndex==0)
                            ?Theme.of(context).colorScheme.secondary
                            :Theme.of(context).colorScheme.onBackground,
                            size: 20,
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '65'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: (controller.selectedIndex==0)
                              ?Theme.of(context).colorScheme.secondary
                              :Theme.of(context).colorScheme.onBackground,
                              fontSize: 10
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
               )  ,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius:const BorderRadius.all(Radius.elliptical(15, 50)),
                      splashFactory: InkRipple.splashFactory,
                      onTap: () {
                        controller.changePage(selectedIndex: 1, pageController: _pageController);

                      },
                      highlightColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                      splashColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            controller.iconList[1],
                            color: (controller.selectedIndex==1)
                            ?Theme.of(context).colorScheme.secondary
                            :Theme.of(context).colorScheme.onBackground,
                            size: 20,
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '64'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: (controller.selectedIndex==1)
                              ?Theme.of(context).colorScheme.secondary
                              :Theme.of(context).colorScheme.onBackground,
                              fontSize: 10
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if(Get.find<SessionVariableService>().isAdmin()) Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius:const BorderRadius.all(Radius.elliptical(15, 50)),
                      splashFactory: InkRipple.splashFactory,
                      onTap: () {
                        controller.changePage(selectedIndex: 2, pageController: _pageController);

                      },
                      highlightColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                      splashColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            controller.iconList[2],
                            color: (controller.selectedIndex==2)
                            ?Theme.of(context).colorScheme.secondary
                            :Theme.of(context).colorScheme.onBackground,
                            size: 20,
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '67'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: (controller.selectedIndex==2)
                              ?Theme.of(context).colorScheme.secondary
                              :Theme.of(context).colorScheme.onBackground,
                              fontSize: 10
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

