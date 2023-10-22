import 'package:get/get.dart';
import 'package:user_final_project/feature/home_page/home_presntion/get_x/pharmacy_detail/pharmacy_detail_controller.dart';

import '../../../../../injection_container.dart';

class PharmacyDetailBindinds extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PharmacyDetailController(
        getMedPharmacyUseCase: sl(),
        getPharmacyProductUseCase: sl(),
        deleteOrderUsecase: sl()));
  }
}
