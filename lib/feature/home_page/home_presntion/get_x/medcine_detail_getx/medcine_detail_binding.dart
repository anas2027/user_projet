import 'package:get/get.dart';
import 'package:user_final_project/feature/home_page/home_presntion/get_x/medcine_detail_getx/medcine_detail_controller.dart';

import '../../../../../injection_container.dart';

class MedcineDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MedcineDetailController(
        addMedcineToCartUseCase: sl(),
        addProductToCartUseCase: sl(),
        image: sl()));
  }
}
