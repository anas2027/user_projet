import 'package:dartz/dartz.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/pharmacy.dart';
import 'package:user_final_project/feature/home_page/home_domain/repositry/home_repositry.dart';

class GetPharmacyUseCase {
  HomeRepositry homeRepositry;
  GetPharmacyUseCase({required this.homeRepositry});

  Future<Either<Failure, List<Pharmacy>>> call() async {
    return await homeRepositry.getPharmacy();
  }
}
