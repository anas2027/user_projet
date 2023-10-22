import 'package:get/get.dart';
import 'package:user_final_project/feature/home_page/home_presntion/get_x/medcine_search_getx/medcine_search_controller.dart';
import 'package:user_final_project/injection_container.dart';

class MedcineSearchBinding extends Bindings{
  @override
  void dependencies() {
  Get.put(MedcineSearchController(searchMedcineUseCase: sl()));
  }
}