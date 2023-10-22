import 'package:get/get.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/usecase/cansle_order_confirmation_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/med_pharmacy.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/phamacy_product.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/delete_order_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/get_pharmacy_product_usecase.dart';

import '../../../../home_page/home_domain/usecase/get_med_pharmacy_usecase.dart';

class MedcineListOrderController extends GetxController{
   GetMedPharmacyUseCase getMedPharmacyUseCase;
  GetPharmacyProductUseCase getPharmacyProductUseCase;
  CansleOrderConfrimationUseCase cansleOrderConfrimationUseCase;
  DeleteOrderUsecase deleteOrderUsecase;
  MedcineListOrderController(

      {
        required this.cansleOrderConfrimationUseCase,
        required this.getMedPharmacyUseCase,
      required this.getPharmacyProductUseCase,
      required this.deleteOrderUsecase});
   var tabIndex = 0.obs;
  var medicineRecipeStatus = 1.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  var data = Get.parameters;
  @override
  onInit() {
    super.onInit();
    getPharmacyMedcine();
    getproductPharmacy();
  }

  ////////////////////////////////// get pharmacy product /////////////////////////////////////////////////////
  List<PharmacyProduct> Product = [];
  bool isloadingproduct = false;
  getproductPharmacy() async {
    Product.clear();
    String phid = '${data['phId']}';
    print('phidgetproducrt $phid');
    var response = await getPharmacyProductUseCase(phId: phid);
    response.fold((l) => Failure, (r) => Product.addAll(r));
    isloadingproduct = true;
    update();
  }

////////////////////////////////// get phamracy medcone ///////////////////////////////////////////////////////
  List<MedPharmacy> pharmacyMedcine = [];
  bool isloading = false;
  getPharmacyMedcine() async {
    String phid = '${data['phId']}';
    print(phid);

    pharmacyMedcine.clear();
    var response = await getMedPharmacyUseCase(phId: phid);
    response.fold((l) => Failure, (r) => pharmacyMedcine.addAll(r));
    isloading = true;
    update();
  }

  deleteOrder({required String orderId}) async {
    await deleteOrderUsecase(orderId: orderId);
  }
  Future confirmOrder({required String orderId}) async {
     String orderStatus = '${data['orderStatus']}';
    String orderid = '${data['orderid']}';
    String userStatus = '${data['userStatus']}';
    String  phId = '${data['phId']}';
  var response =  await cansleOrderConfrimationUseCase(orderId: orderId);
  response.fold((l) => Failure, (r) =>  Get.offAllNamed('/Myorder',parameters: {

       
          'orderid':
              orderid,
                                            'orderStatus':
                                                orderStatus,
                                            'userStatus':
                                                userStatus,
                                                'phId':phId
                                                
      })
   );
                                  update();
  }
}