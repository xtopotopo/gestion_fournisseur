import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestion_fournisseur/dao/collections_names.dart';
import 'package:gestion_fournisseur/models/fournisseur.dart';

class FournisseurDao{

  late CollectionReference _fournisseurs=FirebaseFirestore.instance
    .collection(NomsDesCollections.collectionFournisseur)
    .withConverter<Fournisseur>(
      fromFirestore: (snapshot,_)=>Fournisseur.fromJson(snapshot.data() as Map<String,dynamic>), 
      toFirestore: (fournisseur,_)=>fournisseur.toJson()
    );

  FournisseurDao(){
    _fournisseurs=FirebaseFirestore.instance
    .collection(NomsDesCollections.collectionFournisseur)
    .withConverter<Fournisseur>(
      fromFirestore: (snapshot,_)=>Fournisseur.fromJson(snapshot.data() as Map<String,dynamic>), 
      toFirestore: (fournisseur,_)=>fournisseur.toJson()
    );
  }

  //add method
  Future<void> addFournisseur(Fournisseur fournisseur) async{
    await _fournisseurs.add(fournisseur);
  }

  //delete method
  Future<void> deleteFournisseur(String documentId) async{
    await _fournisseurs.doc(documentId).delete();
  }

  //update method
  Future<void> updateFournisseur({required String documentId,required Fournisseur fournisseur}) async{
    await _fournisseurs.doc(documentId).update(fournisseur.toJson());
  }

  // get Stream of <Fournisseur> methode
  Stream<QuerySnapshot> getFournisseur(){
    return _fournisseurs.orderBy("nom",descending: false).snapshots();
  }

  // Get specefic Fournisseur by a field
  Future<DocumentSnapshot?> getFournisseurByField(String field,{required String isEqualTo}) async{
  var querySnapshot = await _fournisseurs.where(field, isEqualTo: isEqualTo).get();
  if(querySnapshot.docs.isNotEmpty) {
    return querySnapshot.docs.first;
  } else {
    return null;
  }
}


  
}