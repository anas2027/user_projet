import 'package:dartz/dartz.dart';
import 'package:user_final_project/error/failure.dart';
import 'package:user_final_project/feature/auth/auth_domain/entity/login.dart';
import 'package:user_final_project/feature/auth/auth_domain/entity/register.dart';

abstract class AuhtRepositry {
  Future<Either<Failure, Unit>> userRegister(
      {required UserRegister userRegister});
  Future<Either<Failure, Unit>> login({required Login login});
}
