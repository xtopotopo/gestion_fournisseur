import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/controllers/product_search_controller.dart';
import 'package:gestion_fournisseur/models/produit.dart';
import 'package:get/get.dart';

import '../dao/produit_dao.dart';
import '../widgets/product_container.dart';


class ProductsScreen extends GetView{

  late final TextEditingController _searchController;

  ProductsScreen({super.key}){
    _searchController =TextEditingController();
  }

  

  @override
  Widget build(BuildContext context) {
    final ProduitDao produitDao=ProduitDao((Get.parameters['fournisseurId'] as String));

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body:CustomScrollView(
        slivers: 
        [
          SliverAppBar(
            
            title:  CupertinoSearchTextField(
              itemColor: Theme.of(context).colorScheme.background,
              controller: _searchController,
              onChanged: (value) {
                Get.find<ProductSearchController>().onChanged(value);
              },
              placeholder: '26'.tr,
              style: TextStyle(
                color: Theme.of(context).colorScheme.background
              ),
              backgroundColor: Colors.black12,
              placeholderStyle:const TextStyle(
                color: Colors.white38,
              ),
            ),
            floating: true,
            iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onBackground),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            expandedHeight: MediaQuery.of(context).size.height*0.12,
            foregroundColor: Theme.of(context).colorScheme.onBackground,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Get.parameters['nom']as String,
                      style: const TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                    const SizedBox(height: 7,)
                  ],
                ),
              ),
              centerTitle: false,
             
            ),
            
          ),
          SliverPadding(
            padding:const EdgeInsets.only(top: 10),
            sliver: GetBuilder<ProductSearchController>(
              builder: (controller) {
                return StreamBuilder(
                  stream: produitDao.getProduits(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                     
                      return SliverFillRemaining(
                        child: Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.secondary,)),
                      );
                    } else if (snapshot.hasError) {
                      printError(info:"If there's an error with the snapshot");
                      return SliverFillRemaining(
                        child: Center(
                          child: Text('33'.tr)
                        ),
                      );
                    } else if (snapshot.data == null || (snapshot.data as QuerySnapshot).docs.isEmpty) {
                   
                      return SliverFillRemaining(
                        child: Center(
                          child: Text(
                            '32'.tr,
                            style:const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15
                            ),
                          )
                        ),
                      );
                    }
                    QuerySnapshot querySnapshot=snapshot.data as QuerySnapshot;
                    List products= querySnapshot.docs;
                    final searchQuery = _searchController.text.trim().toLowerCase();
                    return SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, 
                        mainAxisSpacing: 10.0,
                      ),
                      delegate: SliverChildBuilderDelegate( 
                        childCount: controller.onSearch 
                          ? products.where((produit) => produit.data().nom.trim().toLowerCase().contains(searchQuery)).length 
                          : products.length,
                        (BuildContext context, int index) {
                          Produit produit = controller.onSearch 
                            ? products.where((produit) => produit.data().nom.trim().toLowerCase().contains(searchQuery)).elementAt(index).data()
                            : products[index].data();
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: ProductContainer(produit: produit),
                          );
                        },
                      ),

                    );
                  }
                );
              }
            ),
          ),
        ],
      ),
    );
  }

}

