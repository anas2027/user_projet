import 'package:dartz/dartz.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/entity/wallet.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/repositry/drawer_repositry.dart';

class GetWalletUseCase {
  DrawerRepositry drawerRepositry;
  GetWalletUseCase({required this.drawerRepositry});
  Future<Either<Failure, List<Wallet>>> call({required String userId}) async {
    return await drawerRepositry.getWallet(userId: userId);
  }
}
