import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/controllers/fournisseur_controller.dart';
import 'package:gestion_fournisseur/screens/screen_widgets/add_fournisseur_alert_dialog.dart';
import '../controllers/fournisseur_search_controller.dart';
import 'package:gestion_fournisseur/models/fournisseur.dart';
import 'package:gestion_fournisseur/widgets/fournisseur_container.dart';
import 'package:get/get.dart';

import '../widgets/custom_bottom_bar.dart';

class FournisseurSceen extends GetView {

  // Field
  late final TextEditingController _searchController;

  // Constructor
  FournisseurSceen({super.key}){
    _searchController =TextEditingController();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     bottomNavigationBar: CustomBottomBar(),


      floatingActionButton: FloatingActionButton(
        onPressed: (){
          AddFournisseurAlertDialog.show(context);
        },
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.background,
        splashColor: Colors.grey[100],
        child: const Icon(Icons.add),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: CupertinoSearchTextField(
          itemColor: Theme.of(context).colorScheme.background,
          controller: _searchController,
          onChanged: (value) {
            Get.find<FournisseurSearchController>().onChanged(value);
          },
          placeholder: '26'.tr,
          backgroundColor: Colors.black12,
          placeholderStyle:const TextStyle(
            color: Colors.white38
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 10,
          top: 7
        ),
        child: GetBuilder<FournisseurSearchController>(
          builder: (controller) {
            return StreamBuilder(
              stream: Get.find<FournisseurController>().getFournisseur(), 
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (snapshot.data == null) {
                  return  Center(
                    child: Text('27'.tr),
                  );
                } else {
                  QuerySnapshot querySnapshot = snapshot.data as QuerySnapshot;
                  List<DocumentSnapshot> fournisseurs = querySnapshot.docs;
                  return ListView.builder(
                    itemCount: fournisseurs.length,
                    itemBuilder: (context, index) {
                      final currentFournisseur = fournisseurs[index].data() as Fournisseur;
                      final nom = currentFournisseur.nom.trim().toLowerCase();
                      final email = currentFournisseur.email.trim().toLowerCase();
                      final numero = currentFournisseur.numero.trim().toLowerCase();
                      final searchQuery = _searchController.text.trim().toLowerCase();
                      if (!controller.onSearch || nom.contains(searchQuery) || numero.contains(searchQuery) || email.contains(searchQuery)) {
                        return FournisseurContainer(
                          fournisseurs[index]
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  );
    
                }
              },
            );
          }
        ),
      ),
    );
    
  }

  
}

