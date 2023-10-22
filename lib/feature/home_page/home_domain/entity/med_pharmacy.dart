import 'package:equatable/equatable.dart';

class MedPharmacy extends Equatable {
  int id, mg, price_pharmacy, quantity, price_customer, status;
  String name_med, image, exp;

  MedPharmacy({
    required this.id,
    required this.name_med,
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
        image,
        mg,
        exp,
        price_pharmacy,
        price_customer,
        quantity,
        status
      ];
}
