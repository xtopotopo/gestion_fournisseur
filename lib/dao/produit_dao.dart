import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestion_fournisseur/dao/collections_names.dart';
import 'package:gestion_fournisseur/models/produit.dart';


class ProduitDao {
  
  late CollectionReference _produits;

  ProduitDao(String fournisseurId){
    _produits=FirebaseFirestore.instance
    .collection(NomsDesCollections.collectionFournisseur)
    .doc(fournisseurId)
    .collection(NomsDesCollections.collectionProduit)
    .withConverter<Produit>(
      fromFirestore: (snapshot,_)=>Produit.fromJson(snapshot.data() as Map<String,dynamic>), 
      toFirestore: (produit,_)=>produit.toJson()
    );
  }

  //add method
  Future<void> addProduit(Produit produit)async{
    await _produits.add(produit);
  }

  //delete method
  Future<void> deleteProduit(String documentId)async{
    await _produits.doc(documentId).delete();
  }

  //update method
  Future<void> updateProduit({required String documentId,required Produit produit})async{
    await _produits.doc(documentId).update(produit.toJson());
  }

  //get Stream of <Produit> method
  Stream<QuerySnapshot> getProduits(){
    return _produits.snapshots();
  }

  Stream<DocumentSnapshot<Produit>> getProduit(String documentId){
    return _produits.doc(documentId).snapshots() as Stream<DocumentSnapshot<Produit>>;
  }
}