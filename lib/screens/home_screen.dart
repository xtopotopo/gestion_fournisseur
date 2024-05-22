
// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gestion_fournisseur/models/utilisateur.dart';
import 'package:gestion_fournisseur/widgets/custom_app_bar.dart';
import 'package:get/get.dart';
import '../controllers/caroussel_slider_controller.dart';
import '../services/session_variables_controller.dart';


class HomeScreen extends GetView {

  // Field
  late PageController _pageController;
  late Utilisateur? _user;
  
  // Constructor
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
                      height:(MediaQuery.of(context).size.height>800)
                        ?MediaQuery.of(context).size.height / 3
                        :MediaQuery.of(context).size.height / 2,
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
          const SizedBox(height: 20,),
          SizedBox(
            child: (MediaQuery.of(context).size.width<800)
            ?Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(color:Theme.of(context).colorScheme.inversePrimary ,),
                const SizedBox(height: 7,),
                Padding(
                  padding: const EdgeInsets.only(left:11.0),
                  child: Title(
                    color:Theme.of(context).colorScheme.secondary,
                    child: Text(
                      '80'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                        color:Theme.of(context).colorScheme.secondary,
                      ),
                      
                    )
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.all(30.0),
                  child:  Row(
                    children: [Expanded(child: Image(image: AssetImage('images/image5.jpeg')))],
                  ),
                ),
               
                Padding(
                  padding: const EdgeInsets.only(left:13.0,right: 13),
                  child: Text(
                    '81'.tr,
                    style:const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      
                    )
                  ),
                ),
                const SizedBox(height: 7,),
                Divider(color:Theme.of(context).colorScheme.inversePrimary ,),
                const SizedBox(height: 7,),
                Padding(
                  padding: const EdgeInsets.only(left:11.0),
                  child: Title(
                    color:Theme.of(context).colorScheme.secondary,
                    child: Text(
                     '82'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                        color:Theme.of(context).colorScheme.secondary,
                      ),
                      
                    )
                  ),
                ),
                const Row(
                  children: [Expanded(child: Image(image: AssetImage('images/image4.png')))],
                ),
                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(left:13.0,right: 13),
                  child: Text(
                    '83'.tr,
                    style:const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      
                    )
                  ),
                ),
                const SizedBox(height: 20,),
              ],
            )
            :Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(color:Theme.of(context).colorScheme.inversePrimary ,),
                const SizedBox(height: 7,),
                Padding(
                  padding: const EdgeInsets.only(left:11.0),
                  child: Title(
                    color:Theme.of(context).colorScheme.secondary,
                    child: Text(
                      '80'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color:Theme.of(context).colorScheme.secondary,
                      ),
                      
                    )
                  ),
                ),
                const SizedBox(height: 15,),
                Row(
                  
                  children: [
                    const Expanded(
                      child: SizedBox(
                        height: 300,
                        width: 100,
                        
                        child: Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Image(image: AssetImage('images/image5.jpeg',),fit: BoxFit.cover,),
                        )
                      )
                    ),
                
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left:13.0,right: 13),
                        child: Text(
                          '81'.tr,
                          style:const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              
                const SizedBox(height: 12,), 
                Divider(color:Theme.of(context).colorScheme.inversePrimary ,),
                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(left:11.0),
                  child: Title(
                    color:Theme.of(context).colorScheme.secondary,
                    child: Text(
                     '82'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color:Theme.of(context).colorScheme.secondary,
                      ),
                      
                    )
                  ),
                ), 
                const SizedBox(height: 15,),
                Row(
                  children: [
                    
                   
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left:13.0,right: 13),
                        child: Text(
                          '83'.tr,
                          style:const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            
                          )
                        ),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                        height: 200,
             
                        child: Image(image: AssetImage('images/image4.png'),fit: BoxFit.contain,)
                      )
                    ),
                  ],
                ),
              
               
                
                const SizedBox(height: 7,),
              ],
            ),
          )
        ],
      )

    );
  }
}
