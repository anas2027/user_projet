import 'package:user_final_project/feature/home_page/home_domain/entity/medcine_search.dart';
import 'package:user_final_project/feature/home_page/home_presntion/widget/pharmacy_detail_page_widget.dart';

class MedcineSearchModel extends MedcineSearchEntity{
  MedcineSearchModel({required super.id, required super.name_med, required super.name_ph, required super.city, required super.phone, required super.price_customer, required super.quantity});


  factory MedcineSearchModel.fromJson(Map<String, dynamic> json) {
    return MedcineSearchModel(
      id: json['id'],
      name_med: json['name_med'],
      city: json['city'],
      name_ph: json['name_ph'],
      phone: json['phone'],
      price_customer: json['price_customer'],
      quantity: json['quantity'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_med': name_med,
      'city': city,
      'name_ph': name_ph,
      'phone': phone,
      'price_customer': price_customer,
      'quantity': quantity,
    };
  }
}