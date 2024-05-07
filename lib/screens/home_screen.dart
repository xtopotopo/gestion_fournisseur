import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gestion_fournisseur/controllers/session_variables_controller.dart';
import 'package:gestion_fournisseur/widgets/custom_app_bar.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class HomeScreen extends GetView {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final user = Get.find<SessionVariableController>().user;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: CustomAppBar(title: user?.prenom ?? 'there'), 
      body: const SizedBox.shrink()
    );
  }
}
