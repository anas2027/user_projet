import 'package:user_final_project/feature/drawer/drawer_domain/entity/myorder.dart';

class MyorderModel extends MyOrder {
  MyorderModel(
      {required super.id,
      required super.name_ph,
      required super.city,
      required super.street,
      required super.phone,
      required super.status,
      required super.status_user,
      required super.total_price});

  factory MyorderModel.fromJson(Map<String, dynamic> json) {
    return MyorderModel(
      id: json['id'],
      name_ph: json['name_ph'],
      city: json['city'],
      street: json['street'],
      phone: json['phone'],
      status: json['status'],
      status_user: json['status_user'],
      total_price: json['total_price'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_ph': name_ph,
      'city': city,
      'street': street,
      'phone': phone,
      'status': status,
      'status_user': status_user,
      'total_price': total_price,
    };
  }
}
