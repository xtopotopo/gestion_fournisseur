
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/models/utilisateur.dart';
import 'package:gestion_fournisseur/widgets/custom_app_bar.dart';
import 'package:get/get.dart';

import '../controllers/caroussel_slider_controller.dart';
import '../services/session_variables_controller.dart';


class HomeScreen extends GetView {

  late PageController _pageController;
  late Utilisateur? _user;
  
  HomeScreen({super.key,}){
    _user = Get.find<SessionVariableService>().user;
    _pageController=PageController(initialPage: 0);
    Get.find<CarousselSliderController>().startTimer(_pageController);
  }

  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: CustomAppBar(title: _user?.prenom ?? 'there'), 
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              //horizontal: 18.0,
              //vertical: 15
            ),
            child: GetBuilder<CarousselSliderController>(
              builder: (controller) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      height: MediaQuery.of(context).size.height / 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: PageView.builder(
                          onPageChanged: (value){
                            controller.changeIndex(value);
                            printError(info: '$value');
                          },
                          controller: _pageController,
                          itemCount: controller.imageList.length,
                          itemBuilder: (context, index) {
                            return controller.imageList[index];
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: 10,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List<Widget>.generate(
                            controller.imageList.length, (index) => GestureDetector(
                              onTap: () {
                                controller.changePage(pageController: _pageController, selectedIndex: index);
                              },
                              child: Container(
                                margin:const EdgeInsets.symmetric(horizontal: 10),
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: (index==controller.selectedIndex)?Theme.of(context).colorScheme.onBackground:Theme.of(context).colorScheme.inversePrimary,
                                  borderRadius: BorderRadius.circular(50)
                                ),
                              )
                            )
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }
            ),
          ),
        ],
      )

    );
  }
}
