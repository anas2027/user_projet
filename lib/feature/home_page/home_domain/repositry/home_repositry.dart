import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/med_pharmacy.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/medcine_search.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/phamacy_product.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/pharmacy.dart';

abstract class HomeRepositry {
  Future<Either<Failure, List<Pharmacy>>> getPharmacy();

  // pharmacy Home Page

  Future<Either<Failure, Unit>> createOrder(
      {required String phId, required String userId});

  Future<Either<Failure, List<MedPharmacy>>> getPharmacyMedcine(
      {required String phId});

  Future<Either<Failure, List<PharmacyProduct>>> getPharmacyProduct(
      {required String phId});
  Future<Either<Failure, Unit>> deleteOrder({required String orderId});
  /////////////////////////// ADD medcine or product to cart
  Future<Either<Failure, Unit>> addmedcineToOrder({
    required String medId,
    required String qantityrequest,
    required String orderId,
  });
  Future<Either<Failure, Unit>> addproductToOrder({
    required String productId,
    required String qantityrequest,
    required String orderId,
  });

  /////////////////////////////////Cart Repo/////////////////////////////////////////////////
  Future<Either<Failure, List<MedPharmacy>>> getMedcineCart(
      {required String orderId});

  Future<Either<Failure, List<PharmacyProduct>>> getProductCart(
      {required String orderId});
  Future<Either<Failure, Unit>> confirmOrder({required String orderId});
  Future<Either<Failure, Unit>> deleteOrderDetail(
      {required String orderDetailId, required String orderId});

      Future<Either<Failure,Unit>>sendRachetaImage({required String orderDetailId, required File image});
      Future<Either<Failure,List<Pharmacy>>>getPharmacyByCity({required String city});
      Future<Either<Failure,List<MedcineSearchEntity>>> getmedcinebysearch({required String name_med, required String city});
}
