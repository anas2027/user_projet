import 'package:user_final_project/feature/drawer/drawer_domain/entity/rachita.dart';

class RachitaModel extends Rachita{
  RachitaModel({required super.description, required super.id, required super.ordetal_id});
factory RachitaModel.fromJson(Map<String, dynamic> json) {
    return RachitaModel(
     
     
      id: json['id'],
      ordetal_id:json['ordetal_id'],
      description:json['description'],  
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ordetal_id': ordetal_id,
      'description': description,
    
    };
  }
}