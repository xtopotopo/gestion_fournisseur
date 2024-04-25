// ignore_for_file: unnecessary_getters_setters

import 'Produit.dart';

class Fournisseur{

  //Fields
  late String _nom;
  late String _email;
  late String _numero;
  late List<Produit>? produits;
  
  //Constructor
  Fournisseur(
      this._nom,
      this._email,
      this._numero,
      [this.produits]
  );

  //Getters
  String get nom=> _nom;
  String get email =>_email;
  String get numero =>_numero;
  List<Produit>? get produit =>produits;

  //Setters
  set nom(String value)=>_nom=value;
  set email(String value)=>_email=value;
  set numero(String value)=>_numero=value;
  set produit(List<Produit>? value) =>produits=value;

  //To-From Json parse Methods
  Map<String,dynamic> toJson()=>{
    "nom":_nom,
    "email":_email,
    "numero":_numero
  };

  factory Fournisseur.fromJson(Map<String,dynamic> json)=>Fournisseur(
    json['nom'] as String,
    json['email'] as String,
    json['numero'] as String,
  );

  //CopyWith Method
  Fournisseur copyWith(
    {
      String? nom,
      String? email,
      String? numero
    }
  )=>Fournisseur(
      nom??_nom, 
      email??_email, 
      numero??_numero
    );   

    //toString method
    @override
    String toString() {
      return 'Fournisseur{=>nom: $_nom, email: $_email, numero: $_numero}';
    }
}