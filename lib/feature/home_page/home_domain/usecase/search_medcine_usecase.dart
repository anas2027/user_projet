import 'package:dartz/dartz.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/medcine_search.dart';
import 'package:user_final_project/feature/home_page/home_domain/repositry/home_repositry.dart';

class SearchMedcineUseCase {
  HomeRepositry homeRepositry;
  SearchMedcineUseCase({required this.homeRepositry});
  Future<Either<Failure,List<MedcineSearchEntity>>> call({required String city,required String name_med})async{
    return await homeRepositry.getmedcinebysearch(name_med: name_med, city: city);
  }
}