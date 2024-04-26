import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/dao/fournisseur_dao.dart';
import 'package:gestion_fournisseur/models/fournisseur.dart';
import 'package:get/get.dart';


class TestScreen extends GetView {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FournisseurDao fda=FournisseurDao();
    return StreamBuilder(
      stream: fda.getFournisseur(), 
      builder: (context,snapshot){
        QuerySnapshot querySnapshot=snapshot.data as QuerySnapshot;
        List fournisseurs=querySnapshot.docs as List;
        return ListView.builder(
          itemCount: fournisseurs.length,
          itemBuilder: (context,index){
             if (snapshot.connectionState == ConnectionState.waiting) {
              return  Center(child:CircularProgressIndicator(color: Theme.of(context).colorScheme.secondary,)); 
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Container(
                  child: Column(
                   
                    children: [
                      Text(
                        (querySnapshot.docs[index].id ),
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        (fournisseurs[index].data() as Fournisseur).nom ,
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        "${(fournisseurs[index].data() as Fournisseur).email}" ,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey
                        ),
                      ),
                      Text(
                        (fournisseurs[index].data() as Fournisseur).numero ,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                );
          }},
        );
      }
    );
  }
}
