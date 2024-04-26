class Utilisateur{

  //Fields
  late String _nom;
  late String _prenom;
  late String _email;
  late String _numero;
  late String _cin;
  late String _mdp;

  //Constructor
  Utilisateur(
    this._nom,
    this._prenom,
    this._email,
    this._numero,
    this._cin,
    this._mdp
  );

  //From-To json parese methods
  factory Utilisateur.fromJson(Map<String,dynamic> json)=>Utilisateur(
    json['nom'] as String,
    json['prenom'] as String,
    json['email'] as String,
    json['numero'] as String,
    json['cin'] as String,
    json['mdp'] as String
  );

  Map<String,dynamic> toJson()=>{
    'nom':_nom,
    'prenom':_prenom,
    'email':_email,
    'numero':_numero,
    'cin':_cin,
  };

  //CopyWith method
  Utilisateur copyWith(
    String? nom,
    String? prenom,
    String? email,
    String? numero,
    String? cin,
    String? mdp,
  )=>Utilisateur(
    nom??_nom,
    prenom??_prenom,
    email??_email,
    numero??_numero,
    cin??_cin,
    mdp??_mdp,
  );

  //Getters & Setters
  String get nom => _nom;
  String get prenom => _prenom;
  String get email => _email;
  String get numero => _numero;
  String get cin => _cin;
  String get mdp => _mdp;

  set nom(String nom) => _nom = nom;
  set prenom(String prenom) => _prenom = prenom;
  set email(String email) => _email = email;
  set numero(String numero) => _numero = numero;
  set cin(String cin) => _cin = cin;
  set mdp(String mdp) => _mdp = mdp;

  //toString method
  @override
  String toString() {
    return 'Utilisateur{\n\t_nom: $_nom,\n\t_prenom: $_prenom,\n\t_email: $_email,\n\t_numero: $_numero,\n\t_cin: $_cin,\n\t_mdp: $_mdp\n}';
  }
}