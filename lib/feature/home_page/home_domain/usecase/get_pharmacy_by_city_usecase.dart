import 'package:dartz/dartz.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/pharmacy.dart';
import 'package:user_final_project/feature/home_page/home_domain/repositry/home_repositry.dart';

class GetPharmacyByCityUseCase{
  HomeRepositry homeRepositry;
  GetPharmacyByCityUseCase({required this.homeRepositry});
  Future<Either<Failure,List<Pharmacy>>>call({required String city})async{
    return homeRepositry.getPharmacyByCity(city: city);
  }
}