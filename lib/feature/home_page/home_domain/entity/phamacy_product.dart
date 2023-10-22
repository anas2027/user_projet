import 'package:equatable/equatable.dart';

class PharmacyProduct extends Equatable {
  int id, price, quantity;
  String name, description, images;

  PharmacyProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.description,
    required this.images,
  });
  @override
  List<Object?> get props => [id, name, price, quantity, description, images];
}
//get_pharmacy_product