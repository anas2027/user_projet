import 'package:get/get.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/get_x/order_detail_getx/order_detail_controller.dart';

import '../../../../../injection_container.dart';

class OrderDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderDetailController(
        confirmOrderUseCase: sl(),
        deleteOrderDetailUseCase: sl(),
        getMedcineCartUseCase: sl(),
        getProductCartUsecase: sl(),
        cansleOrderConfrimationUseCase: sl(),
        getRachetaImageUsecase: sl()));
  }
}
