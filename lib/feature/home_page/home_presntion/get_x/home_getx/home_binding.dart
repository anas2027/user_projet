import 'package:get/get.dart';
import 'package:user_final_project/feature/home_page/home_presntion/get_x/home_getx/home_controller.dart';

import '../../../../../injection_container.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(searchMedcineUseCase: sl(),getPharmacyUseCase: sl(), getWalletUseCase: sl(),getPharmacyByCityUseCase: sl()));
  }
}
