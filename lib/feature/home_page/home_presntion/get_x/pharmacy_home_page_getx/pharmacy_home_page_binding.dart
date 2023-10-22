import 'package:get/get.dart';
import 'package:user_final_project/feature/home_page/home_presntion/get_x/pharmacy_home_page_getx/pharmacy_home_page_controller.dart';

import '../../../../../injection_container.dart';

class PharmacyHomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PharmacyHomePageController(
        createOrderUseCase: sl(), getMedPharmacyUseCase: sl()));
  }
}
