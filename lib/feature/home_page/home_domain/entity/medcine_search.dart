import 'package:equatable/equatable.dart';

class MedcineSearchEntity extends Equatable {
  String name_ph,city,name_med;
  int id,quantity,phone,price_customer;
  MedcineSearchEntity({required this.id,required this.name_med,required this.name_ph,required this.city,required this.phone,required this.price_customer,required this.quantity});
  
  @override
  List<Object?> get props => [id,name_med,name_ph,city,quantity,phone,price_customer];

}