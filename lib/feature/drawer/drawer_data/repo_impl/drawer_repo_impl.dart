import 'package:user_final_project/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:user_final_project/feature/drawer/drawer_data/remote_data_souce/drawer_remote_data_source.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/entity/myorder.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/entity/rachita.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/entity/wallet.dart';
import 'package:user_final_project/feature/drawer/drawer_domain/repositry/drawer_repositry.dart';
import '../../../../error/exception.dart';
import '../../../../error/network/network_info.dart';

class DrawerRepoImpl implements DrawerRepositry {
  final NetworkInfo networkInfo;
  final DrawerRemoteDataSorce drawerRemoteDataSorce;
  DrawerRepoImpl(
      {required this.drawerRemoteDataSorce, required this.networkInfo});

  @override
  Future<Either<Failure, List<Wallet>>> getWallet({required String userId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine =
            await drawerRemoteDataSorce.getWallet(userId: userId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine =
            await drawerRemoteDataSorce.getWallet(userId: userId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<MyOrder>>> getMyOrder(
      {required String userId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine =
            await drawerRemoteDataSorce.getMyOrder(userId: userId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine =
            await drawerRemoteDataSorce.getMyOrder(userId: userId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> cansleOrderConfirmation(
      {required String orderId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await drawerRemoteDataSorce
            .cansleOrderConfrimtion(orderId: orderId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await drawerRemoteDataSorce
            .cansleOrderConfrimtion(orderId: orderId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Rachita>>> getRachitaImage({required String id}) async{
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine = await drawerRemoteDataSorce
            .getRachitaImage(id: id);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine = await drawerRemoteDataSorce
            .getRachitaImage(id: id);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
}
