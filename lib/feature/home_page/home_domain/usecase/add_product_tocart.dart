import 'package:dartz/dartz.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/home_page/home_domain/repositry/home_repositry.dart';

class AddProductToCartUseCase {
  HomeRepositry homeRepositry;
  AddProductToCartUseCase({required this.homeRepositry});
  Future<Either<Failure, Unit>> call({
    required String productId,
    required String qantityrequest,
    required String orderId,
  }) async {
    return await homeRepositry.addproductToOrder(
        productId: productId, qantityrequest: qantityrequest, orderId: orderId);
  }
}
