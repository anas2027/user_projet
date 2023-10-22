import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/med_pharmacy.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/create_order_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/get_med_pharmacy_usecase.dart';

class PharmacyHomePageController extends GetxController {
  GetMedPharmacyUseCase getMedPharmacyUseCase;
  CreateOrderUseCase createOrderUseCase;
  PharmacyHomePageController(
      {required this.createOrderUseCase, required this.getMedPharmacyUseCase});

  var data = Get.parameters;
  @override
  onInit() {
    super.onInit();
    getPharmacyMedcine();
  }

  createOrder() async {
    String phid = '${data['phId']}';

    print(phid);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userId = sharedPreferences.getString('userId');
    createOrderUseCase(phId: phid, userId: '$userId');
  }

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
}
