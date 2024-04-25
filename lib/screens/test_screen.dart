import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_text_field.dart';

class TestScreen extends GetView {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final TextEditingController nomController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController quantiteController = TextEditingController();
    final TextEditingController textController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    final TextEditingController idController = TextEditingController();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("1".tr),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            CustomTextField.names(
              label: "Nom",
              controller: nomController,
            ),
            const SizedBox(height: 10),
            CustomTextField.email(
              controller: emailController,
            ),
            const SizedBox(height: 10),
            CustomTextField.number(
              label: "Quantite",
              controller: quantiteController,
            ),
            const SizedBox(height: 10),
            CustomTextField.text(
              label: "text",
              controller: textController,
            ),
            const SizedBox(height: 10),
            CustomTextField.password(
              controller: passwordController,
            ),
            const SizedBox(height: 10),
            CustomTextField.phoneNumber(
              controller: phoneNumberController,
            ),
            const SizedBox(height: 10),
            CustomTextField.id(
              controller: idController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  print('Nom: ${nomController.text}');
  print('Email: ${emailController.text}');
  print('Quantite: ${quantiteController.text}');
  print('Text: ${textController.text}');
  print('Password: ${passwordController.text}');
  print('Phone Number: ${phoneNumberController.text}');
  print('ID: ${idController.text}');
                }
              },
              
              child: const Text('Validate'),
            ),
          ],
        ),
      ),
    );
  }
}
