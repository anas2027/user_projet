import 'package:equatable/equatable.dart';

class UserRegister extends Equatable {
  String name_user, email, password, city_user, street_user;
  int phone_user;
  UserRegister(
      {required this.name_user,
      required this.email,
      required this.password,
      required this.city_user,
      required this.street_user,
      required this.phone_user});
  @override
  List<Object?> get props =>
      [name_user, email, password, city_user, street_user, phone_user];
}
