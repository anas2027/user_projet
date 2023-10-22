import 'package:get/get.dart';

import '../../../../../injection_container.dart';
import 'cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController(
        confirmOrderUseCase: sl(),
        deleteOrderDetailUseCase: sl(),
        getMedcineCartUseCase: sl(),
        getProductCartUsecase: sl(),
        sendRachetaImageUseCase: sl(),
        image: sl()));
  }
}
