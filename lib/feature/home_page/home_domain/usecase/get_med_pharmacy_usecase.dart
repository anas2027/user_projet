import 'package:dartz/dartz.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/med_pharmacy.dart';
import 'package:user_final_project/feature/home_page/home_domain/repositry/home_repositry.dart';

class GetMedPharmacyUseCase {
  HomeRepositry homeRepositry;
  GetMedPharmacyUseCase({required this.homeRepositry});
  Future<Either<Failure, List<MedPharmacy>>> call(
      {required String phId}) async {
    return homeRepositry.getPharmacyMedcine(phId: phId);
  }
}
