import 'package:user_final_project/feature/home_page/home_domain/entity/med_pharmacy.dart';

class MedPharmacyModel extends MedPharmacy {
  MedPharmacyModel(
      {required super.id,
      required super.name_med,
      required super.image,
      required super.mg,
      required super.exp,
      required super.price_pharmacy,
      required super.price_customer,
      required super.quantity,
      required super.status});

  factory MedPharmacyModel.fromJson(Map<String, dynamic> json) {
    return MedPharmacyModel(
      id: json['id'],
      name_med: json['name_med'],
      image: json['image'],
      mg: json['mg'],
      exp: json['exp'],
      price_pharmacy: json['price_pharmacy'],
      price_customer: json['price_customer'],
      quantity: json['quantity'],
      status: json['status'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_med': name_med,
      'image': image,
      'mg': mg,
      'exp': exp,
      'price_pharmacy': price_pharmacy,
      'price_customer': price_customer,
      'quantity': quantity,
      'status': status
    };
  }
}
