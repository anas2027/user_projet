import 'package:dartz/dartz.dart';
import 'package:user_final_project/feature/auth/auth_domain/repositry/auth_repo.dart';

import '../../../../error/failure.dart';
import '../entity/register.dart';

class RegisterUseCase {
  AuhtRepositry auhtRepositry;
  RegisterUseCase({required this.auhtRepositry});
  Future<Either<Failure, Unit>> call(
      {required UserRegister userRegister}) async {
    return await auhtRepositry.userRegister(userRegister: userRegister);
  }
}
