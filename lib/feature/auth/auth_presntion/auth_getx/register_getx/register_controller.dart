import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_final_project/feature/auth/auth_domain/entity/register.dart';
import 'package:user_final_project/feature/auth/auth_domain/usecase/register_usecase.dart';

class RegisterConrtoller extends GetxController {
  RegisterUseCase registerUseCase;
  RegisterConrtoller({required this.registerUseCase});

  signUp({required UserRegister userRegister}) async {
    registerUseCase(userRegister: userRegister);
  }

  var isPasswordHidden = true.obs;
  var selectedItem = "".obs;
  final nameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final phoneNumberController = TextEditingController().obs;
  final streetController = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  void updateSelectedItem(String value) {
    selectedItem.value = value;
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "provide valid email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "password must be of 6 characters at least ";
    }
    return null;
  }
}
