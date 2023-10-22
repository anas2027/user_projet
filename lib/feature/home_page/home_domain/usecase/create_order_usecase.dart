import 'package:dartz/dartz.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/home_page/home_domain/repositry/home_repositry.dart';

class CreateOrderUseCase {
  HomeRepositry homeRepositry;
  CreateOrderUseCase({required this.homeRepositry});
  Future<Either<Failure, Unit>> call(
      {required String phId, required String userId}) async {
    return await homeRepositry.createOrder(phId: phId, userId: userId);
  }
}
