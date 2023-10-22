import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/home_page/home_domain/repositry/home_repositry.dart';

class SendRachetaImageUseCase{
  HomeRepositry homeRepositry;
  SendRachetaImageUseCase({required this.homeRepositry});
  Future<Either<Failure,Unit>>call({required String orderDetailId,required File image})async{
    return await homeRepositry.sendRachetaImage(orderDetailId: orderDetailId, image: image);
  }
}