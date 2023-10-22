import 'package:equatable/equatable.dart';

class ProductPharmacyOrder extends Equatable{
   int id, price, quantity,ph_id;
  String name, description, images;

  ProductPharmacyOrder({
    required this.id,
    required this.ph_id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.description,
    required this.images,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [id,ph_id,name,price,quantity,description,images];
}