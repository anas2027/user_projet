import 'package:dartz/dartz.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/home_page/home_domain/repositry/home_repositry.dart';
import 'package:user_final_project/feature/home_page/home_presntion/get_x/home_getx/home_binding.dart';

class DeleteOrderUsecase {
  HomeRepositry homeRepositry;
  DeleteOrderUsecase({required this.homeRepositry});
  Future<Either<Failure, Unit>> call({required String orderId}) async {
    return await homeRepositry.deleteOrder(orderId: orderId);
  }
}
