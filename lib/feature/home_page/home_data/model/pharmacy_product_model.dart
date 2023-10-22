import 'package:user_final_project/feature/home_page/home_domain/entity/phamacy_product.dart';

class PharmacyProductModel extends PharmacyProduct {
  PharmacyProductModel(
      {required super.id,
      required super.name,
      required super.price,
      required super.quantity,
      required super.description,
      required super.images});
  factory PharmacyProductModel.fromJson(Map<String, dynamic> json) {
    return PharmacyProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
      description: json['description'],
      images: json['images'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'description': description,
      'images': images,
    };
  }
}
