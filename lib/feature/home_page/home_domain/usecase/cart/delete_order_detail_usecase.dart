import 'package:dartz/dartz.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/home_page/home_domain/repositry/home_repositry.dart';

class DeleteOrderDetailUseCase {
  HomeRepositry homeRepositry;
  DeleteOrderDetailUseCase({required this.homeRepositry});
  Future<Either<Failure, Unit>> call(
      {required String orderId, required String orderDetailId}) async {
    return await homeRepositry.deleteOrderDetail(
        orderDetailId: orderDetailId, orderId: orderId);
  }
}
