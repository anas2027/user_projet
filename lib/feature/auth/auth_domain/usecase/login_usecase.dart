import 'package:dartz/dartz.dart';
import 'package:user_final_project/feature/auth/auth_domain/repositry/auth_repo.dart';

import '../../../../error/failure.dart';
import '../entity/login.dart';

class LoginUseCase {
  AuhtRepositry auhtRepositry;
  LoginUseCase({required this.auhtRepositry});
  Future<Either<Failure, Unit>> call({required Login login}) async {
    return await auhtRepositry.login(login: login);
  }
}
