import 'package:get/get.dart';

class DashboardController extends GetxController{

  late String _selectedUserType;
  final List<String> _userTypes=['Admin','Spectator','Super-user'];
  set selectedUserType(String value) => _selectedUserType=value.toLowerCase();
  List<String> get userTypes => _userTypes;
  String get selectedUserType=>_selectedUserType;

  
}