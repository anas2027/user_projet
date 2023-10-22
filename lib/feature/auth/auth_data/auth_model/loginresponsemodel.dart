import 'package:user_final_project/feature/auth/auth_domain/entity/login_response.dart';

class LoginResponseModel extends LoginResponse {
  LoginResponseModel(
      {required super.id,
      required super.name_user,
      required super.email,
      required super.city_user,
      required super.street_user,
      required super.phone_user});
}
