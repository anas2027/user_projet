import 'package:dartz/dartz.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/phamacy_product.dart';
import 'package:user_final_project/feature/home_page/home_domain/repositry/home_repositry.dart';

class GetPharmacyProductUseCase {
  HomeRepositry homeRepositry;
  GetPharmacyProductUseCase({required this.homeRepositry});
  Future<Either<Failure, List<PharmacyProduct>>> call(
      {required String phId}) async {
    return await homeRepositry.getPharmacyProduct(phId: phId);
  }
}
