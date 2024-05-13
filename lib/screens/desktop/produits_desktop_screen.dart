import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/controllers/session_variables_controller.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:gestion_fournisseur/controllers/product_search_controller.dart';
import 'package:gestion_fournisseur/controllers/produit_toggle_button_controller.dart';
import 'package:gestion_fournisseur/models/fournisseur.dart';
import 'package:gestion_fournisseur/models/produit.dart';
import 'package:gestion_fournisseur/screens/screen_widgets/products_alert_dialog.dart';
import 'package:get/get.dart';

import '../../controllers/produit_controller.dart';
import '../../controllers/produit_excel_controller.dart';
import '../../dao/produit_dao.dart';
import '../../widgets/product_container.dart';
import '../../widgets/product_toggle_button.dart';

class ProductsDesktopScreen extends GetView {

  // Field
  late final TextEditingController _searchController;
  late final DocumentSnapshot<Fournisseur> _fournisseurDocumentSnapshot;
  late final PageController _pageController;

  // Constructor
  ProductsDesktopScreen(
    {
      super.key,
      required TextEditingController searchController,
      required DocumentSnapshot<Fournisseur> fournisseurDocumentSnapshot,
      required PageController pageController,
    }
  ) {
    _searchController = searchController;
    _fournisseurDocumentSnapshot = fournisseurDocumentSnapshot;
    _pageController = pageController;
  }

  @override
  Widget build(BuildContext context) {
    final ProduitDao produitDao = ProduitDao(_fournisseurDocumentSnapshot.id);
    final Fournisseur fournisseur = _fournisseurDocumentSnapshot.data() as Fournisseur;

    return Scaffold(
      floatingActionButton:(Get.find<SessionVariableController>().isAdmin() || Get.find<SessionVariableController>().isSuperUser()) 
      ?FloatingActionButton(
        onPressed: () {
          ProduitAlertDialog.show(fournisseurId: _fournisseurDocumentSnapshot.id, context: context, type: ProductAlertDialogType.add);
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.background,
        ),
      )
      :null,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
                            color: Theme.of(context).colorScheme.onBackground,
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
                        Get.find<ProduitExcelController>().excportExcel(context: context, fournisseurName: _fournisseurDocumentSnapshot.data()!.nom);
                        break;
                      default:
                    }
                  },
                )
              ],
            title: SizedBox(
              width:  MediaQuery.of(context).size.width*.50,
              child: CupertinoSearchTextField(
                itemColor: Theme.of(context).colorScheme.background,
                controller: _searchController,
                onChanged: (value) {
                  Get.find<ProductSearchController>().onChanged(value);
                },
                placeholder: '26'.tr,
                style: TextStyle(color: Theme.of(context).colorScheme.background),
                backgroundColor: Colors.black12,
                placeholderStyle: const TextStyle(
                  color: Colors.white38,
                ),
              ),
            ),
            centerTitle: true,
            floating: true,
            iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onBackground),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            expandedHeight: MediaQuery.of(context).size.height * 0.16,
            foregroundColor: Theme.of(context).colorScheme.onBackground,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            fournisseur.nom,
                            style: const TextStyle(fontSize: 26.0, fontWeight: FontWeight.w900),
                          ),
                          ProductToggleButton(pageController: _pageController,),
                        ],
                      ),
                    ),
                    const SizedBox(height: 7,)
                  ],
                ),
              ),
              centerTitle: false,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8, 
              child: PageView(
                controller: _pageController,
                onPageChanged:(value) {
                  Get.find<ProduitToggleButtonController>().toggle(value);
                },
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  productsPage(produitDao),
                  statisticsPage(produitDao)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  GetBuilder<ProductSearchController> productsPage(ProduitDao produitDao) {
    return GetBuilder<ProductSearchController>(
      builder: (controller) {
        return StreamBuilder(
          stream: produitDao.getProduits(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.secondary));
            } else if (snapshot.hasError) {
              
              return Center(child: Text('33'.tr) );
            } else if (snapshot.data == null || (snapshot.data as QuerySnapshot).docs.isEmpty) {
              return Center(
                child: Text(
                  '32'.tr,
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                )
              );
            }
            final searchQuery = _searchController.text.trim().toLowerCase();
            QuerySnapshot querySnapshot = snapshot.data as QuerySnapshot;
            Get.find<ProduitExcelController>().produits = (controller.onSearch)
            ? querySnapshot.docs.where((documenSnapshot) => (documenSnapshot.data() as Produit).nom.trim().toLowerCase().contains(searchQuery)).toList()
            : querySnapshot.docs;
            return GridView.builder(
              padding:  EdgeInsets.only(
                 left: MediaQuery.of(context).size.width*.04,
                 right: MediaQuery.of(context).size.width*.04,
                 top: 30,
                 bottom: 0
              ),
              itemCount: Get.find<ProduitExcelController>().produits.length + 1,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: MediaQuery.of(context).size.width*.009,
                crossAxisSpacing:  MediaQuery.of(context).size.width*.01
              ), 
              itemBuilder: (BuildContext context, int index) {
                
                return (index >= Get.find<ProduitExcelController>().produits.length)
                  ? const SizedBox.shrink()
                  : Padding(
                    padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.002),
                    child: SizedBox(
                      height: 10,
                      child: ProductContainer(Get.find<ProduitExcelController>().produits[index] as DocumentSnapshot<Produit>)
                    ),
                  );
              },
            );
          },
        );
      }
    );
  }

  Padding statisticsPage(ProduitDao produitDao) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        child: StreamBuilder(
          stream: produitDao.getProduits(), 
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.secondary));
            } else if (snapshot.hasError) {
              printError(info: " therei s an error with the snapshot");
              return Center(child: Text('33'.tr) );
            } 
              QuerySnapshot<Produit> querySnapshot = snapshot.data as QuerySnapshot<Produit>;
              List<DocumentSnapshot<Produit>> produits = querySnapshot.docs;
              try{
                return ListView(
                  children: [
                    Row(
                      children: 
                      [
                        Flexible(
                          child: Container(
                            height: 118,
                            padding:const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:  Theme.of(context).colorScheme.inversePrimary,
                            ),
                            child:  Column(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: 
                              [
                                Text(
                                  textAlign: TextAlign.center,
                                  '58'.tr,
                                  style:const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                Container(
                                  padding: EdgeInsets.zero,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.background,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    produits.length.toString(),
                                    style:const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 25,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 15,),
                        Flexible(
                          child: Container(
                            height: 118,
                            padding:const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).colorScheme.inversePrimary,
                            ),
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: 
                              [
                                Text(
                                  textAlign: TextAlign.center,
                                  '59'.tr,
                                  style:const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                Container(
                                  padding: EdgeInsets.zero,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.background,
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Text(
                                    (Get.find<ProduitController>().avgDepenses(produits)>1000)
                                    ?'${(Get.find<ProduitController>().avgDepenses(produits)/1000).toStringAsFixed(2)}K'
                                    :Get.find<ProduitController>().avgDepenses(produits).toStringAsFixed(2),
                                    textAlign: TextAlign.center,
                                    style:const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 25,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: Container(
                            height: 100,
                            padding:const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius:const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft:Radius.circular(20),
                              ),
                              color: Theme.of(context).colorScheme.inversePrimary,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: 
                              [
                                Text(
                                  '60'.tr,
                                  style:const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                SizedBox(
                                  child: Text(
                                    (produits.isNotEmpty)
                                    ?'${((Get.find<ProduitController>().productAboveAVG(produits)!.length*100)/produits.length).toStringAsFixed(2)}%'
                                    :'0%',
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.secondary,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                LinearPercentIndicator(
                                  padding: EdgeInsets.zero,
                                  percent: (produits.isNotEmpty)?(Get.find<ProduitController>().productAboveAVG(produits)!.length/produits.length):0,
                                  progressColor: Theme.of(context).colorScheme.secondary,
                                  backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(.3),
                                  barRadius:const Radius.circular(20),
                                  lineHeight: 15,
                                  animation: true,
                                  animationDuration: 300,
                                  restartAnimation: false,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 3,),
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: 100,
                            padding:const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius:const BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight:Radius.circular(20),
                              ),
                              color: Theme.of(context).colorScheme.inversePrimary,
                            ),
                            child: Center(
                              child: Text(
                                (produits.isNotEmpty)
                                ?(Get.find<ProduitController>().productAboveAVG(produits)!.length).toString()
                                :'0',
                                style:const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w900
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: Container(
                            height: 100,
                            padding:const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius:const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft:Radius.circular(20),
                              ),
                              color: Theme.of(context).colorScheme.inversePrimary,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: 
                              [
                                Text(
                                  '61'.tr,
                                  style:const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                SizedBox(
                                  child: Text(
                                    (produits.isNotEmpty)
                                    ?'${((Get.find<ProduitController>().productUnderAVG(produits)!.length*100)/produits.length).toStringAsFixed(2)}%'
                                    :'0%',
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.secondary,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                LinearPercentIndicator(
                                  padding: EdgeInsets.zero,
                                  percent:(produits.isNotEmpty)?(Get.find<ProduitController>().productUnderAVG(produits)!.length/produits.length):0,
                                  progressColor: Theme.of(context).colorScheme.secondary,
                                  backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(.3),
                                  barRadius:const Radius.circular(20),
                                  lineHeight: 15,
                                  animation: true,
                                  animationDuration: 300,
                                  restartAnimation: false,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 3,),
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: 100,
                            padding:const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius:const BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight:Radius.circular(20),
                              ),
                              color: Theme.of(context).colorScheme.inversePrimary,
                            ),
                            child: Center(
                              child: Text(
                                (produits.isNotEmpty)
                                ?(Get.find<ProduitController>().productUnderAVG(produits)!.length).toString()
                                :'0',
                                style:const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w900
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }catch(e){
                printError(info: e.toString());
                return const SizedBox.shrink();
              }
          } 
        ),
      ),
    );
  }
}