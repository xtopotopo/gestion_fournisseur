class Utilisateur{

  //Fields
  late String _nom;
  late String _prenom;
  late String _email;
  late String _numero;
  late String _cin;
  late String _mdp;
  late UserType? _userType;

  //Constructor
  Utilisateur(
    this._nom,
    this._prenom,
    this._email,
    this._numero,
    this._cin,
    this._mdp,
    this._userType
  );

  //From-To json parese methods
  factory Utilisateur.fromJson(Map<String,dynamic> json)=>Utilisateur(
    json['nom'] as String,
    json['prenom'] as String,
    json['email'] as String,
    json['numero'] as String,
    json['cin'] as String,
    "######",
    (json['userType']=="spectator")
      ?UserType.spectator
      :(json['userType']=="super-user")
        ?UserType.superUser
        :UserType.admin
  );

  Map<String,dynamic> toJson()=>{
    'nom':_nom.trim().toLowerCase(),
    'prenom':_prenom.trim().toLowerCase(),
    'email':_email.trim().toLowerCase(),
    'numero':_numero.trim().toLowerCase(),
    'cin':_cin.trim().toLowerCase(),
    'userType':fromUserTypeToString()
  };

  //CopyWith method
  Utilisateur copyWith(
    {
    String? nom,
    String? prenom,
    String? email,
    String? numero,
    String? cin,
    String? mdp,
    UserType? userType
    }
  )=>Utilisateur(
    nom??_nom,
    prenom??_prenom,
    email??_email,
    numero??_numero,
    cin??_cin,
    mdp??_mdp,
    userType??_userType,
  );

  //Getters & Setters
  String get nom => _nom;
  String get prenom => _prenom;
  String get email => _email;
  String get numero => _numero;
  String get cin => _cin;
  String get mdp => _mdp;
  UserType get userType => _userType!;

  set nom(String nom) => _nom = nom;
  set prenom(String prenom) => _prenom = prenom;
  set email(String email) => _email = email;
  set numero(String numero) => _numero = numero;
  set cin(String cin) => _cin = cin;
  set mdp(String mdp) => _mdp = mdp;
  set userType(UserType value) => _userType=value;


  //toString method
  @override
  String toString() {
    return 'Utilisateur{\n\t_nom: $_nom,\n\t_prenom: $_prenom,\n\t_email: $_email,\n\t_numero: $_numero,\n\t_cin: $_cin,\n\t_mdp: $_mdp\n\t_userType: $_userType\n}';
  }

  String fromUserTypeToString(){
  switch (_userType) {
    case UserType.superUser:
      return 'super-user';
    case UserType.spectator:
      return 'spectator';
    case UserType.admin:
      return 'admin';
    default:
      throw Exception("unknown-user-type: $_userType");
  }

  
}

static UserType fromStringtoUserType(String userType){

  switch (userType) {
    case "spectator":
      return UserType.spectator;
    case "super-user":
      return UserType.superUser;
    case "admin":
      return UserType.admin;
    default:
      throw Exception("unknown-user-type: $userType");
  }
  
}

}

enum UserType{
  admin,
  superUser,
  spectator
}