import 'package:dartz/dartz.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/home_page/home_domain/repositry/home_repositry.dart';

class ConfirmOrderUseCase {
  HomeRepositry homeRepositry;
  ConfirmOrderUseCase({required this.homeRepositry});
  Future<Either<Failure, Unit>> call({required String orderId}) async {
    return await homeRepositry.confirmOrder(orderId: orderId);
  }
}
