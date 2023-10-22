import 'package:user_final_project/feature/home_page/home_domain/entity/pharmacy.dart';

class PharmacyModel extends Pharmacy {
  PharmacyModel(
      {required super.id,
      required super.name,
      required super.name_ph,
      required super.email,
      required super.city,
      required super.street,
      required super.phone});
  factory PharmacyModel.fromJson(Map<String, dynamic> json) {
    return PharmacyModel(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        city: json['city'],
        name_ph: json['name_ph'],
        phone: json['phone'],
        street: json['street']);
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'city': city,
      'id': id,
      'name_ph': name_ph,
      'phone': phone,
      'street': street
    };
  }
}
