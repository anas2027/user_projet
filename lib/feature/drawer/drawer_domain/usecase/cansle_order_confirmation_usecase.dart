import 'package:dartz/dartz.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/repositry/drawer_repositry.dart';

class CansleOrderConfrimationUseCase {
  DrawerRepositry drawerRepositry;
  CansleOrderConfrimationUseCase({required this.drawerRepositry});
  Future<Either<Failure, Unit>> call({required String orderId}) async {
    return await drawerRepositry.cansleOrderConfirmation(orderId: orderId);
  }
}
