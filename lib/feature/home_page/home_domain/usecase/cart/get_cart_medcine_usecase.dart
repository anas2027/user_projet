import 'package:dartz/dartz.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/home_page/home_data/model/med_pharmacy_model.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/med_pharmacy.dart';
import 'package:user_final_project/feature/home_page/home_domain/repositry/home_repositry.dart';

class GetMedcineCartUseCase {
  HomeRepositry homeRepositry;
  GetMedcineCartUseCase({required this.homeRepositry});
  Future<Either<Failure, List<MedPharmacy>>> call(
      {required String orderId}) async {
    return await homeRepositry.getMedcineCart(orderId: orderId);
  }
}
