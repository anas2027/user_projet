import 'package:user_final_project/feature/auth/auth_data/auth_model/login_model.dart';
import 'package:user_final_project/feature/auth/auth_data/auth_model/register_model.dart';
import 'package:user_final_project/feature/auth/auth_data/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:user_final_project/feature/auth/auth_domain/entity/register.dart';
import 'package:user_final_project/feature/auth/auth_domain/entity/login.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:user_final_project/feature/auth/auth_domain/repositry/auth_repo.dart';

import '../../../../error/exception.dart';
import '../../../../error/network/network_info.dart';

class AuthRepoImpl implements AuhtRepositry {
  final NetworkInfo networkInfo;
  final AuthRemoteDataSource authRemoteDataSorce;
  AuthRepoImpl({required this.authRemoteDataSorce, required this.networkInfo});
  @override
  Future<Either<Failure, Unit>> login({required Login login}) async {
    final LoginModel loginModel =
        LoginModel(email: login.email, password: login.password);

    if (await networkInfo.isconnected) {
      try {
        final response =
            await authRemoteDataSorce.login(loginModel: loginModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> userRegister(
      {required UserRegister userRegister}) async {
    RegisterModel registerModel = RegisterModel(
        name_user: userRegister.name_user,
        email: userRegister.email,
        password: userRegister.password,
        city_user: userRegister.city_user,
        street_user: userRegister.street_user,
        phone_user: userRegister.phone_user);
    if (await networkInfo.isconnected) {
      try {
        final response =
            await authRemoteDataSorce.register(registerModel: registerModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
