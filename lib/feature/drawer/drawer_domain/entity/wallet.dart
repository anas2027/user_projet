import 'package:equatable/equatable.dart';

class Wallet extends Equatable{
int id,funds,user_id;
Wallet({required this.funds,required this.id,required this.user_id});

  @override
  // TODO: implement props
  List<Object?> get props => [id,funds,user_id];
}