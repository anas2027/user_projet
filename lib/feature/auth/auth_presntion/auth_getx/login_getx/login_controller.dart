import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_final_project/feature/auth/auth_domain/entity/login.dart';
import 'package:user_final_project/feature/auth/auth_domain/usecase/login_usecase.dart';

class LoginController extends GetxController {
  LoginUseCase loginUseCase;
  LoginController({required this.loginUseCase});

  login({required Login login}) async {
    await loginUseCase(login: login);
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

  var isPasswordHidden = true.obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
}
