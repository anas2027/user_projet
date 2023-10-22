import 'package:user_final_project/feature/auth/auth_domain/entity/login.dart';

class LoginModel extends Login {
  LoginModel({required super.email, required super.password});
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(email: json['email'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
