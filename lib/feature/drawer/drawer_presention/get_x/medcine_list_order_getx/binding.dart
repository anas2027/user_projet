import 'package:get/get.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/get_x/medcine_list_order_getx/controller.dart';
import 'package:user_final_project/injection_container.dart';

class MedcineListOrderBinding extends Bindings{
  
  @override
  void dependencies() {
    Get.put(MedcineListOrderController(
      deleteOrderUsecase: sl(),
      getMedPharmacyUseCase: sl(),
      getPharmacyProductUseCase: sl(),
      cansleOrderConfrimationUseCase: sl()
    ));
  }
}