import 'package:user_final_project/feature/drawer/drawer_domain/entity/med_pharmacy_order.dart';

class MedPharmacyOrderModel extends MedPharmacyOrder{
  MedPharmacyOrderModel({required super.id, required super.name_med, required super.ph_id, required super.image, required super.mg, required super.exp, required super.price_pharmacy, required super.price_customer, required super.quantity, required super.status});


  factory MedPharmacyOrderModel.fromJson(Map<String, dynamic> json) {
    return MedPharmacyOrderModel(
      id: json['id'],
      name_med: json['name_med'],
      ph_id: json['ph_id'],
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
      'ph_id':ph_id,
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