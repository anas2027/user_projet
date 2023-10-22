import 'package:dartz/dartz.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/entity/myorder.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/repositry/drawer_repositry.dart';

class GetMyOrderUseCase {
  DrawerRepositry drawerRepositry;
  GetMyOrderUseCase({required this.drawerRepositry});
  Future<Either<Failure, List<MyOrder>>> call({required String userId}) async {
    return await drawerRepositry.getMyOrder(userId: userId);
  }
}
