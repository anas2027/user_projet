import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/entity/myorder.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/usecase/cansle_order_confirmation_usecase.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/usecase/get_my_oder_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/delete_order_usecase.dart';

class MyorderController extends GetxController {
  GetMyOrderUseCase getMyOrderUseCase;
  DeleteOrderUsecase deleteOrderUsecase;
  CansleOrderConfrimationUseCase cansleOrderConfrimationUseCase;
  MyorderController({required this.getMyOrderUseCase,required this.deleteOrderUsecase,required this.cansleOrderConfrimationUseCase});
  @override
  onInit() {
    super.onInit();
    getOrder();
  }

  List<MyOrder> myorder = [];
  getOrder() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String userId = '${sharedPreferences.getString('userId')}';
    var response = await getMyOrderUseCase(userId: userId);
    response.fold((l) => Failure, (r) => myorder.addAll(r));
    update();
  }


  deleteOrder({required String orderId})async{
    await cansleOrderConfrimationUseCase(orderId: orderId);
    await deleteOrderUsecase(orderId: orderId);
  }

  canselOderConftirmaion({required String orderId})async{
   await cansleOrderConfrimationUseCase(orderId: orderId);
  }
}
