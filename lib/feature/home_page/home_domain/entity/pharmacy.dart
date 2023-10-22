import 'package:equatable/equatable.dart';

class Pharmacy extends Equatable {
  String name, name_ph, email, city, street;
  int id, phone;
  Pharmacy(
      {required this.id,
      required this.name,
      required this.name_ph,
      required this.email,
      required this.city,
      required this.street,
      required this.phone});
  @override
  List<Object?> get props => [id, name, name_ph, email, city, street, phone];
}
