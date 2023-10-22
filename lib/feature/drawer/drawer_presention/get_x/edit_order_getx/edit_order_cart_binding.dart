import 'package:get/get.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/get_x/edit_order_getx/edit_order_contrller.dart';
import 'package:user_final_project/injection_container.dart';

class EditOrderCartBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(EditOrderCartCaontroller(
      addMedcineToCartUseCase: sl(),
      addProductToCartUseCase: sl()
    ));
  }
}