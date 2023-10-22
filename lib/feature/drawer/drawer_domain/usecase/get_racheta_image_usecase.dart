import 'package:dartz/dartz.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/entity/rachita.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/repositry/drawer_repositry.dart';

class GetRachetaImageUsecase{
  DrawerRepositry drawerRepositry;
  GetRachetaImageUsecase({required this.drawerRepositry});
  Future<Either<Failure,List<Rachita>>>call({required String id })async{
    return await drawerRepositry.getRachitaImage(id: id);
  }
}