import 'package:user_final_project/feature/auth/auth_domain/entity/register.dart';

class RegisterModel extends UserRegister {
  RegisterModel(
      {required super.name_user,
      required super.email,
      required super.password,
      required super.city_user,
      required super.street_user,
      required super.phone_user});
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      email: json['email'],
      password: json['password'],
      name_user: json['name_user'],
      city_user: json['city_user'],
      street_user: json['street_user'],
      phone_user: json['phone_user'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'name_user': name_user,
      'city_user': city_user,
      'street_user': street_user,
      'phone_user': phone_user,
    };
  }
}
