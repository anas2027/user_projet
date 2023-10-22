import 'package:dartz/dartz.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/phamacy_product.dart';
import 'package:user_final_project/feature/home_page/home_domain/repositry/home_repositry.dart';

class GetProductCartUsecase {
  HomeRepositry homeRepositry;
  GetProductCartUsecase({required this.homeRepositry});
  Future<Either<Failure, List<PharmacyProduct>>> call(
      {required String orderId}) async {
    return await homeRepositry.getProductCart(orderId: orderId);
  }
}
