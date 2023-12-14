import 'package:dartz/dartz.dart';
import 'package:dev_test/core/base_usecase/base_usecase.dart';
import 'package:dev_test/core/failure/failures.dart';
import 'package:injectable/injectable.dart';

import '../repositories/auth_repositories.dart';

@lazySingleton
@injectable
class LoginUseCase extends UseCase<String, AuthCredential> {
  AuthRepositories authRepositories;
  LoginUseCase(this.authRepositories);
  @override
  Future<Either<Failure, String>> call(AuthCredential params) async {
    return await authRepositories.login(params);
  }
}

class AuthCredential {
  final String useName;
  final String password;

  AuthCredential(this.useName, this.password);
}
