import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  int id, phone_user;
  String name_user, email, city_user, street_user;
  LoginResponse(
      {required this.id,
      required this.name_user,
      required this.email,
      required this.city_user,
      required this.street_user,
      required this.phone_user});

  @override
  List<Object?> get props =>
      [id, name_user, email, city_user, street_user, phone_user];
}
