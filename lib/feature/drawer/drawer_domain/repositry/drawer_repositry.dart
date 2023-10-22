import 'package:dartz/dartz.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/entity/myorder.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/entity/rachita.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/entity/wallet.dart';

abstract class DrawerRepositry {
  Future<Either<Failure, List<Wallet>>> getWallet({required String userId});
  Future<Either<Failure, List<MyOrder>>> getMyOrder({required String userId});
  Future<Either<Failure, Unit>> cansleOrderConfirmation(
      {required String orderId});
      Future<Either<Failure,List<Rachita>>>getRachitaImage({required String id });
}
