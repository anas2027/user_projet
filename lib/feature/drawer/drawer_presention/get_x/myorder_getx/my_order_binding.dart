import 'package:get/get.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/get_x/myorder_getx/myorder_controller.dart';

import '../../../../../injection_container.dart';

class MyOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyorderController(getMyOrderUseCase: sl(),deleteOrderUsecase: sl(),cansleOrderConfrimationUseCase: sl()));
  }
}
