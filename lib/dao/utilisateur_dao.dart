import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestion_fournisseur/dao/collections_names.dart';
import 'package:gestion_fournisseur/models/utilisateur.dart';

class UtilisateurDao{

  // Field
  late CollectionReference _utilisateurs;

  //Constructor
  UtilisateurDao(){
    _utilisateurs=FirebaseFirestore.instance
    .collection(NomsDesCollections.collectionUtilisateure)
    .withConverter<Utilisateur>(
      fromFirestore: (snapshot,_)=>Utilisateur.fromJson(snapshot.data() as Map<String,dynamic>), 
      toFirestore: (utilisateur,_)=>utilisateur.toJson()
    );
  }

  // Add method
  Future<void> addUtilisateur(Utilisateur utilisateur)async{
    await _utilisateurs.add(utilisateur);
  }

  // Update method
  Future<void> updateUtilisateur({required Utilisateur utilisateur,required String documentId})async{
    await _utilisateurs.doc(documentId).update(utilisateur.toJson());
  }

  // Delete method
  Future<void> deleteUtilisateur(String documentId)async{
    await _utilisateurs.doc(documentId).delete();
  }

  //Get User by email
  Future<DocumentSnapshot> getUtilisateur(String email) async{
    QuerySnapshot querySnapshot = await _utilisateurs
    .where("email", isEqualTo: email)
    .get();
  
    return querySnapshot.docs.first;  
  }

  // Email verification method
  Future<bool> emailExists(String email) async{
    QuerySnapshot querySnapshot = await _utilisateurs
    .where("email", isEqualTo: email)
    .get();
    

    if(querySnapshot.docs.isNotEmpty){
      return true;
    }

    return false;
  }

  // Get a Sream of <Utilisateur> method
  Stream<QuerySnapshot> getUtilisateurs(){
    return _utilisateurs.snapshots();
  }
}