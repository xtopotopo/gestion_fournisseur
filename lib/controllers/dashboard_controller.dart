import 'package:get/get.dart';

class DashboardController extends GetxController{

  late String _selectedUserType;
  final List<String> _userTypes=['Admin','Spectator','Super-user'];
  set selectedUserType(String value) => _selectedUserType=value.toLowerCase();
  List<String> get userTypes => _userTypes;
  String get selectedUserType=>_selectedUserType;

  //////////////////////////////////////////////////

  List<bool> _isSelected=[true,false];


  void toggle(int selectedIndex){
    switch(selectedIndex){
      case 0:
        _isSelected=[true,false];
        break;
      case 1:
        _isSelected=[false,true];
        break;
    }
    update();
  }

  
  List<bool> get isSelected => _isSelected;
}