import 'package:get/get.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/get_x/add_medcine_tocart_getx/add_medcine_tocart_controller.dart';
import 'package:user_final_project/injection_container.dart';

class addmedcineToOrderBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> AddMedcineToCartController(
      addMedcineToCartController: sl(),
      addProductToCartUseCase: sl(),
      image: sl()
    ));
  }
}