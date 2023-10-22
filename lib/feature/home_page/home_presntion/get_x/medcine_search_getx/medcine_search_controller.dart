import 'package:get/get.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/medcine_search.dart';
import 'package:user_final_project/feature/home_page/home_domain/usecase/search_medcine_usecase.dart';

class MedcineSearchController extends GetxController{
  SearchMedcineUseCase searchMedcineUseCase;
  MedcineSearchController({required this.searchMedcineUseCase});
  List<MedcineSearchEntity> medcsearch =[];
Future getMedcineBySearch({required String city, required String name_med})async{
 medcsearch.clear();
 var response =  await searchMedcineUseCase(name_med: name_med,city: city);
 response.fold((l) => Failure, (r) => medcsearch.addAll(r));
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
}