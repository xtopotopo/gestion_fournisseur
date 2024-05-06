import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/controllers/session_variables_controller.dart';
import 'package:gestion_fournisseur/widgets/custom_app_bar.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: CustomAppBar(title: Get.find<SessionVariableController>().user!.prenom,),
      body:  Center(child: SizedBox(child: Text('Home Page'),))
    );
  }

}