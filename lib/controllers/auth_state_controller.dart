import 'package:get/get.dart';

import '../dao/authentification_dao.dart';


class AuthStateController extends GetxController {

  late AuthentificationDao _authentificationDao;


  Future<bool> checkAuthentication() async {
    return await _authentificationDao.checkUser();
  }

  @override
  void onInit() {
    _authentificationDao=AuthentificationDao();
    super.onInit();
  }
}
