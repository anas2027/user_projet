import 'package:get/get.dart';
import 'package:user_final_project/feature/drawer/drawer_presention/get_x/wallet_getx/wallet_controller.dart';

import '../../../../../injection_container.dart';

class WalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WalletController(getWalletUseCase: sl()));
  }
}
