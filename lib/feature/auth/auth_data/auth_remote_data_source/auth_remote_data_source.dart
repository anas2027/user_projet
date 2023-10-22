import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_final_project/feature/auth/auth_data/auth_model/login_model.dart';
import 'package:user_final_project/feature/auth/auth_data/auth_model/loginresponsemodel.dart';
import 'package:user_final_project/feature/auth/auth_data/auth_model/register_model.dart';

import 'package:http/http.dart' as http;

import '../../../../error/exception.dart';

abstract class AuthRemoteDataSource {
  Future<Unit> login({required LoginModel loginModel});
  Future<Unit> register({required RegisterModel registerModel});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});
  @override
  Future<Unit> login({required LoginModel loginModel}) async {
    const baseusrl = 'http://10.0.2.2:8000/api/userlogin';

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    LoginResponseModel loginResponseModel;
    final body = {'email': loginModel.email, 'password': loginModel.password};
    final response = await client.post(Uri.parse(baseusrl), body: body);
    if (response.statusCode == 200) {
      Get.offAllNamed('/homePage');

      Get.snackbar('Login successful', 'welcome back');
      final json = jsonDecode(response.body);
      loginResponseModel = LoginResponseModel(
        id: json['usre']['id'],
        email: json['usre']['email'],
        name_user: json['usre']['name_user'],
        city_user: json['usre']['city_user'],
        street_user: json['usre']['street_user'],
        phone_user: json['usre']['phone_user'],
      );
      sharedPreferences.setString('userId', "${loginResponseModel.id}");
      sharedPreferences.setString('userName', loginResponseModel.name_user);
      sharedPreferences.setString('email', loginResponseModel.email);
      sharedPreferences.setString('city', loginResponseModel.city_user);
      sharedPreferences.setString('street', loginResponseModel.street_user);
      sharedPreferences.setString('phone', '${loginResponseModel.phone_user}');
    }
    return Future.value(unit);
  }

  @override
  Future<Unit> register({required RegisterModel registerModel}) async {
    const baseusrl = 'http://10.0.2.2:8000/api/userregister';

    final body = {
      'name_user': registerModel.email,
      'email': registerModel.email,
      'password': registerModel.password,
      'city_user': registerModel.city_user,
      'street_user': registerModel.street_user,
      'phone_user': '${registerModel.phone_user}',
    };
    final response = await client.post(Uri.parse(baseusrl), body: body);
    if (response.statusCode == 200) {
      Get.snackbar('Register successful', 'you can login ');
      Get.offAllNamed('/');
      return Future.value(unit);
    } else {
      Get.snackbar('Register unsuccessful', 'try again later ');
      throw ServerException();
    }
  }
}
