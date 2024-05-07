import 'package:gestion_fournisseur/models/utilisateur.dart';
import 'package:get/get.dart';

class SessionVariableController extends GetxController {
  late String _userID;
  Utilisateur? _user;

  // Getters & Setters
  Utilisateur? get user => _user;
  String get userID => _userID;
 
  set userID(String value) => _userID = value;
  set user(Utilisateur? value) =>_user = value;

  bool isAdmin(){
    return _user!.userType==UserType.admin;
  }

  bool isSuperUser(){
    return _user!.userType==UserType.superUser;
  }

  bool isSpectator(){
    return _user!.userType==UserType.spectator;
  }
 
  // Clear method
  void clear() {
    _userID = '';
    _user = null;
  }
}
