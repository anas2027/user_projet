import 'package:equatable/equatable.dart';

class MyOrder extends Equatable {
  int id, status, status_user, total_price, phone;
  String name_ph, city, street;
  MyOrder(
      {required this.id,
      required this.name_ph,
      required this.city,
      required this.street,
      required this.phone,
      required this.status,
      required this.status_user,
      required this.total_price});
  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name_ph, city, street, phone, status, status_user, total_price];
}
