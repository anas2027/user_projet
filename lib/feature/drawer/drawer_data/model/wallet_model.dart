import 'package:user_final_project/feature/drawer/drawer_domain/entity/wallet.dart';

class WalletModel extends Wallet{
  WalletModel({required super.funds, required super.id, required super.user_id});
  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      id: json['id'],
     funds: json['funds'],
     user_id: json['user_id']
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'funds': funds,
      'user_id': user_id,
      };
}
}