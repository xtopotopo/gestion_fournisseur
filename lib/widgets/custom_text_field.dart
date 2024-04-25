


// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/password_text_field_controller.dart';
import '../util/input_validators.dart';

class CustomTextField extends GetView {

  // Fields
  late final TextFieldType _type;
  late final  String _label;
  late  TextEditingController? _controller;

  //Constructors
  CustomTextField.email({super.key,required TextEditingController controller}){
    _type=TextFieldType.email;
    _controller=controller;
  }

  CustomTextField.password({super.key,required TextEditingController controller}){
    _type=TextFieldType.password;
    _controller=controller;
  }

  CustomTextField.confirmationPassword({super.key,required TextEditingController controller}){
    _type=TextFieldType.confirmationPassword;
    _controller=controller;
  }

  CustomTextField.phoneNumber({super.key,required TextEditingController controller}){
    _type=TextFieldType.phoneNumber;
    _controller=controller;
  }

  CustomTextField.id({super.key,required TextEditingController controller}){
    _type=TextFieldType.id;
    _controller=controller;
  }

  CustomTextField.number({super.key,required String label,required TextEditingController controller}){
    _type=TextFieldType.number;
    _label=label;
    _controller=controller;
  }

  CustomTextField.text({super.key,required String label,required TextEditingController controller}){
    _type=TextFieldType.text;
    _label=label;
    _controller=controller;
  }

  CustomTextField.names({super.key,required String label,required TextEditingController controller}){
    _type=TextFieldType.names;
    _label=label;
    _controller=controller;
  }

  
  @override
  Widget build(BuildContext context) {

    switch (_type) {
      case TextFieldType.email:

        return TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Ce champ est vide";
            }
            return InputValidation.isEmailValid(value);
          },
          controller: _controller,         
          obscureText: false,
          decoration:const InputDecoration(
            prefixIcon: Icon(Icons.email_rounded),
            labelText: "Email"
          ),
          keyboardType: TextInputType.emailAddress,
        );
        
      case TextFieldType.text:

        return  TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Ce champ est vide";
            }
            return null;
          },
          controller: _controller,
          obscureText: false,
          decoration: InputDecoration(
            prefixIcon:const Icon(Icons.text_format_rounded),
            labelText: _label
          ),
          keyboardType: TextInputType.text,
        );

      case TextFieldType.number:

        return TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Ce champ est vide";
            }
            return InputValidation.isNumberValid(value);
          },
          controller: _controller,
          obscureText: false,
          decoration: InputDecoration(
            prefixIcon:const Icon(Icons.numbers),
            labelText: _label
          ),
          keyboardType: TextInputType.number,
        );
      
      
      case TextFieldType.names:

        return TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Ce champ est vide";
            }
            return InputValidation.isNameValid(value);
          },
          controller: _controller,
          obscureText: false,
          decoration: InputDecoration(
            prefixIcon:const Icon(Icons.account_box_rounded),
            labelText: _label
          ),
          keyboardType: TextInputType.name,
        );

      case TextFieldType.confirmationPassword:

        return TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Ce champ est vide";
            }
            return InputValidation.isPasswordValid(value);
          },
          controller: _controller,
          obscureText: true,
          decoration:const InputDecoration(
            prefixIcon: Icon(Icons.password_rounded),
            labelText: "Confirmation password"
          ),
          keyboardType: TextInputType.multiline,
        );
      
      case TextFieldType.phoneNumber:

        return TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Ce champ est vide";
            }
            return InputValidation.isPhoneNumberValid(value);
          },
          controller: _controller,
          obscureText: false,
          decoration:const InputDecoration(
            prefixIcon: Icon(Icons.phone),
            labelText: "Numero"
          ),
          keyboardType: TextInputType.number,
        );

      case TextFieldType.id:

        return TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Ce champ est vide";
            }
            return InputValidation.isCinValid(value);
          },
          controller: _controller,
          obscureText: false,
          decoration:const InputDecoration(
            prefixIcon: Icon(Icons.perm_identity_rounded),
            labelText: "Cin"
          ),
          keyboardType: TextInputType.multiline,
        );
      case TextFieldType.password:
        return GetBuilder<PasswordTextFieldController>(
          
          builder: (controller) {
            return TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Ce champ est vide";
                }
                return InputValidation.isPasswordValid(value);
              },
              controller: _controller,
              obscureText: controller.obscurity,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.password_rounded),
                suffixIcon: IconButton(
                  onPressed: (){
                    controller.toogle();
                  }, 
                  icon:controller.icon
                ),
                labelText: "Password"
              ),
              keyboardType: TextInputType.multiline,
            );
          }
        );
    }
  }

  
}

enum TextFieldType {
  text,
  email,
  number,
  phoneNumber,
  password,
  confirmationPassword,
  names,
  id
}