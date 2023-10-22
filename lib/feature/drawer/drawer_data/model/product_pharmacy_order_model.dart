import 'package:user_final_project/feature/drawer/drawer_domain/entity/product_pharmacy_order.dart';

class ProductPharmacyOrderModel extends ProductPharmacyOrder{
  ProductPharmacyOrderModel({required super.id, required super.ph_id, required super.name, required super.price, required super.quantity, required super.description, required super.images});

  factory ProductPharmacyOrderModel.fromJson(Map<String, dynamic> json) {
    return ProductPharmacyOrderModel(
      id: json['id'],
      ph_id: json['ph_id'],
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
      'ph_id':ph_id,
      'price': price,
      'quantity': quantity,
      'description': description,
      'images': images,
    };
  }

}