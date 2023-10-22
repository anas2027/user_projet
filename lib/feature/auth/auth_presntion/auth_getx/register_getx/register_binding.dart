import 'package:get/get.dart';
import 'package:user_final_project/feature/auth/auth_presntion/auth_getx/register_getx/register_controller.dart';

import '../../../../../injection_container.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterConrtoller(registerUseCase: sl()));
  }
}
