import 'dart:io';

import 'package:user_final_project/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:user_final_project/feature/home_page/home_data/remote_data_souce/home_remote_datasorce.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/med_pharmacy.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/medcine_search.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/phamacy_product.dart';
import 'package:user_final_project/feature/home_page/home_domain/entity/pharmacy.dart';
import 'package:user_final_project/feature/home_page/home_domain/repositry/home_repositry.dart';

import '../../../../error/exception.dart';
import '../../../../error/network/network_info.dart';

class HomeRepositryImpl implements HomeRepositry {
  final NetworkInfo networkInfo;
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositryImpl(
      {required this.homeRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Pharmacy>>> getPharmacy() async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await homeRemoteDataSource.getpharmacy();
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await homeRemoteDataSource.getpharmacy();
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<MedPharmacy>>> getPharmacyMedcine(
      {required String phId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine =
            await homeRemoteDataSource.getMedPharmacy(phId: phId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine =
            await homeRemoteDataSource.getMedPharmacy(phId: phId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> createOrder(
      {required String phId, required String userId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine =
            await homeRemoteDataSource.createOrder(phId: phId, userId: userId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine =
            await homeRemoteDataSource.createOrder(phId: phId, userId: userId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<PharmacyProduct>>> getPharmacyProduct(
      {required String phId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine =
            await homeRemoteDataSource.getPharmacyProduct(phId: phId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine =
            await homeRemoteDataSource.getPharmacyProduct(phId: phId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteOrder({required String orderId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine =
            await homeRemoteDataSource.deleteOrder(orderId: orderId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine =
            await homeRemoteDataSource.deleteOrder(orderId: orderId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addmedcineToOrder(
      {required String medId,
      required String qantityrequest,
      required String orderId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await homeRemoteDataSource.addmedcineToOrder(
            medId: medId, orderId: orderId, qantityrequest: qantityrequest);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await homeRemoteDataSource.addmedcineToOrder(
            medId: medId, orderId: orderId, qantityrequest: qantityrequest);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addproductToOrder(
      {required String productId,
      required String qantityrequest,
      required String orderId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await homeRemoteDataSource.addproductToOrder(
            productId: productId,
            orderId: orderId,
            qantityrequest: qantityrequest);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await homeRemoteDataSource.addproductToOrder(
            productId: productId,
            orderId: orderId,
            qantityrequest: qantityrequest);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> confirmOrder({required String orderId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await homeRemoteDataSource.confirmOrder(
          orderId: orderId,
        );
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await homeRemoteDataSource.confirmOrder(
          orderId: orderId,
        );
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteOrderDetail(
      {required String orderDetailId, required String orderId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await homeRemoteDataSource.deleteOrderDetail(
          orderDetailId: orderDetailId,
          orderId: orderId,
        );
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await homeRemoteDataSource.deleteOrderDetail(
          orderDetailId: orderDetailId,
          orderId: orderId,
        );
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<MedPharmacy>>> getMedcineCart(
      {required String orderId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await homeRemoteDataSource.getMedCart(
          orderId: orderId,
        );
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await homeRemoteDataSource.getMedCart(
          orderId: orderId,
        );
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<PharmacyProduct>>> getProductCart(
      {required String orderId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await homeRemoteDataSource.getProductCart(
          orderId: orderId,
        );
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await homeRemoteDataSource.getProductCart(
          orderId: orderId,
        );
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> sendRachetaImage({required String orderDetailId, required File image}) async{
   if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await homeRemoteDataSource.sendRachetaImage(
           orderDetailId: orderDetailId,image: image
        );
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await homeRemoteDataSource.sendRachetaImage(
          orderDetailId: orderDetailId,image: image
        );
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
  
  @override
  Future<Either<Failure, List<Pharmacy>>> getPharmacyByCity({required String city}) async{
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await homeRemoteDataSource.getPharmacyByCity(
           city: city
        );
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await homeRemoteDataSource.getPharmacyByCity(
          city: city
        );
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<MedcineSearchEntity>>> getmedcinebysearch({required String name_med, required String city}) async{
   if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await homeRemoteDataSource.getmedcinebysearch(
           city: city,name_med: name_med
        );
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await homeRemoteDataSource.getmedcinebysearch(
          city: city,name_med: name_med
        );
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
}
