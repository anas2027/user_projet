import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/usecase/get_wallet_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/medcine_search.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/pharmacy.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/get_pharmacy_by_city_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/get_pharmacy_usecase.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/search_medcine_usecase.dart';

class HomeController extends GetxController {
  GetPharmacyUseCase getPharmacyUseCase;
  GetWalletUseCase getWalletUseCase;
  GetPharmacyByCityUseCase getPharmacyByCityUseCase;
  SearchMedcineUseCase searchMedcineUseCase;
  HomeController({
    required this.searchMedcineUseCase,
    required this.getPharmacyByCityUseCase,
    required this.getPharmacyUseCase,
    required this.getWalletUseCase,
  });
  bool isloading = false;
  @override
  onInit() {
    super.onInit();
    getPharmacy();
  }

  String walletUser = '';
  getWallet() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String userId = '${sharedPreferences.getString('userId')}';
    await getWalletUseCase(userId: userId);
    walletUser = '${sharedPreferences.getString('wallet')}';
    update();
  }

  List<Pharmacy> pharamacy = [];

  getPharmacy() async {
    pharamacy.clear();
    var response = await getPharmacyUseCase();
    response.fold((l) => Failure, (r) => pharamacy.addAll(r));
    isloading = true;
    update();
  }
  
  int currentindex = 0;
  void changecurrentindex({required int index}) {
    currentindex = index;
    update();
  }

  List cities = [
    'Damascus',
    'Latakia',
    'Ṭartus',
    'Homs',
    'Ḥamāh',
    'Idlib',
    'Maʿlula',
    'Palmyra',
    'Al-Ḥasakah',
    'Darʿā',
    'Aleppo',
    'Al-Ḥasakah',
    'Al-Qāmishlī',
    'Al-Qunayṭirah',
    'Al-Raqqah',
    'Al-Suwayda'
  ];
    Future getWarehouseByCity({required String city}) async {
   pharamacy.clear();
   var response = await getPharmacyByCityUseCase(city: city);
   response.fold((l) => Failure, (r) => pharamacy.addAll(r));
   update();
    // warehouses = nre;
    // var respone = await getPharmacyUseCase(city: city);
    // respone.fold((l) => Failure, (r) => warehouses.addAll(r));
    // update();
  }



}
