import 'package:get/get.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/get_x/account_getx/account_controller.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountConrtoller());
  }
}
