import 'package:dartz/dartz.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/home_page/home_domain/repositry/home_repositry.dart';

class AddMedcineToCartUseCase {
  HomeRepositry homeRepositry;
  AddMedcineToCartUseCase({required this.homeRepositry});
  Future<Either<Failure, Unit>> call({
    required String medId,
    required String qantityrequest,
    required String orderId,
  }) async {
    return await homeRepositry.addmedcineToOrder(
        medId: medId, qantityrequest: qantityrequest, orderId: orderId);
  }
}
