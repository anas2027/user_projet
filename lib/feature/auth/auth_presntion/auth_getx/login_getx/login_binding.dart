import 'package:get/get.dart';
import 'package:user_final_project/feature/auth/auth_presntion/auth_getx/login_getx/login_controller.dart';

import '../../../../../injection_container.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(loginUseCase: sl()));
  }
}
