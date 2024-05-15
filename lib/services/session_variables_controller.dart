import 'package:gestion_fournisseur/models/utilisateur.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SessionVariableService extends GetxService {
  final GetStorage _storage = GetStorage();

  late String _userID;
  Utilisateur? _user;

  // Getters & Setters
  Utilisateur? get user => _user;
  String get userID => _userID;

  set userID(String value) {
    _userID = value;
    _storage.write('userID', value);  // Save userID to GetStorage
  }

  set user(Utilisateur? value) {
    _user = value;
    _storage.write('user', value?.toJson());  // Save user to GetStorage
  }

  bool isAdmin() {
    return _user!.userType == UserType.admin;
  }

  bool isSuperUser() {
    return _user!.userType == UserType.superUser;
  }

  bool isSpectator() {
    return _user!.userType == UserType.spectator;
  }

  // Clear method
  void clear() {
    _userID = '';
    _user = null;
    _storage.erase();  // Clear all data from GetStorage
  }

  // Load method
  void load() {
    _userID = _storage.read('userID') ?? '';
    var userJson = _storage.read('user');
    if (userJson != null) {
      _user = Utilisateur.fromJson(userJson);
    }
  }
}
