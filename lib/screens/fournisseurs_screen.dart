import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/controllers/fournisseur_controller.dart';
import 'package:gestion_fournisseur/screens/screen_widgets/add_fournisseur_alert_dialog.dart';
import '../controllers/fournisseur_excel_controller.dart';
import '../controllers/fournisseur_search_controller.dart';
import 'package:gestion_fournisseur/models/fournisseur.dart';
import 'package:gestion_fournisseur/widgets/fournisseur_container.dart';
import 'package:get/get.dart';

import '../controllers/session_variables_controller.dart';


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
      floatingActionButton:(Get.find<SessionVariableController>().isAdmin() || Get.find<SessionVariableController>().isSuperUser())  
      ?FloatingActionButton(
        onPressed: (){
          AddFournisseurAlertDialog.show(context);
        },
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.background,
        splashColor: Colors.grey[100],
        child: const Icon(Icons.add),
      )
      :null,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        toolbarHeight: 55,
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
        actions: 
              [
                PopupMenuButton<String>(
                  iconColor: Theme.of(context).colorScheme.onBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(15),
                  ), 
                  itemBuilder: (BuildContext context)=> [
                    PopupMenuItem(
                      value: "excport-excel",
                      child: Row(
                        children: [
                          Icon(
                            Icons.file_download_rounded,
                            color: Colors.green,
                          ),
                          const Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 4.0),
                            child:  Text("  "),
                          ),
                          Text('Export Excel'.tr)
                        ],
                      )
                    )
                  ],
                  onSelected: (value) async{
                    switch (value) {
                      case 'excport-excel':
                       Get.find<FournisseurExcelController>().excportExcel(context);
                        break;
                      default:
                    }
                  },
                )
              ],
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
                List<DocumentSnapshot> fournisseurs = (controller.onSearch)
                  ?querySnapshot.docs.where((documentSnapshot) =>
                    (documentSnapshot.data() as Fournisseur).nom.toLowerCase().contains(_searchController.text) ||
                    (documentSnapshot.data() as Fournisseur).numero.toLowerCase().contains(_searchController.text)
                  ).toList()
                  :querySnapshot.docs;
                  Get.find<FournisseurExcelController>().fournisseurs=fournisseurs;
                return ListView.builder(
                  itemCount: fournisseurs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: (index == fournisseurs.length - 1) ? 100.0 : 0.0,
                      ),
                      child: FournisseurContainer(
                        fournisseurs[index],
                      ),
                    );
                  },
                );
              }
            },
          );
        },
      ),
      ),
    );
  } 
}