import 'package:equatable/equatable.dart';

class MedPharmacyOrder extends Equatable {
  int id, mg, price_pharmacy, quantity, price_customer, status,ph_id;
  String name_med, image, exp;

  MedPharmacyOrder({
    required this.id,
    required this.name_med,
    required this.ph_id,
    required this.image,
    required this.mg,
    required this.exp,
    required this.price_pharmacy,
    required this.price_customer,
    required this.quantity,
    required this.status,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name_med,
        ph_id,
        image,
        mg,
        exp,
        price_pharmacy,
        price_customer,
        quantity,
        status
      ];
}
