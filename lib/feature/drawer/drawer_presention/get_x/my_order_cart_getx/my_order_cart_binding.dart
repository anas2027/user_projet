import 'package:get/get.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/get_x/my_order_cart_getx/my_order_cart_controller.dart';
import 'package:user_final_project/injection_container.dart';

class MyOrderCartBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MyOrderCartController(confirmOrderUseCase: sl(),deleteOrderDetailUseCase: sl(),
    getMedcineCartUseCase: sl(),getProductCartUsecase: sl(),image: sl(),sendRachetaImageUseCase: sl()));
  }
}