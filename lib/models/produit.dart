class Produit{

  //Fields
  late String _nom;
  late String _description;
  late double _prixUnite;
  late String _unite;
  late double _quantite;
  late String _date;

  //Constructor
  Produit(
    this._nom,
    this._description,
    this._prixUnite,
    this._unite,
    this._quantite,
    this._date
  );

  //Getters & Setters
  String get nom =>_nom;
  String get description =>_description;
  double get prixUnite =>_prixUnite;
  String get unite =>_unite;
  double get qunatite =>_quantite;
  String get date =>_date;

  set nom(String value) =>_nom=value;
  set description(String value) =>_description=value;
  set prixUnite(double value) =>_prixUnite=value;
  set unite(String value) =>_unite=value;
  set qunatite(double value) =>_quantite=value;
  set date(String value) =>_date=value;

  //From-to Json parse methods
  factory Produit.fromJson(Map<String,dynamic> json)=>Produit
    (
      json['nom'] as String, 
      json['description'] as String, 
      json['prixUnite'] as double, 
      json['unite'] as String, 
      json['quantite'] as double, 
      json['date'] as String 
    );

    Map<String,dynamic> toJson()=>{
      "nom":_nom,
      'description':_description,
      'prixUnite':_prixUnite,
      'unite':_unite,
      'quantite':_quantite,
      'date':_date,
    };

    //CopyWith method
    Produit copyWith(
      {
        String? nom,
        String? description,
        double? prixUnite,
        String? unite,
        double? quantite,
        String? date,
      }
      )=>Produit(
        nom??_nom,
        description??_description,
        prixUnite??_prixUnite,
        unite??_unite,
        quantite??_quantite,
        date??_date,
      );

  //toString method
  @override
  String toString() {
    return 'Produit{_nom: $_nom, _description: $_description, _prixUnite: $_prixUnite, _unite: $_unite, _quantite: $_quantite, _date: $_date}';
  }

}