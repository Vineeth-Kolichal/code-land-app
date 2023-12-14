import 'package:dartz/dartz.dart';
import 'package:dev_test/core/failure/failures.dart';
import 'package:dev_test/core/network/custom_exception.dart';

import 'package:injectable/injectable.dart';

import '../../domain/repositories/auth_repositories.dart';
import '../../domain/usecases/login_usecase.dart';
import '../datasources/auth_data_source.dart';

@LazySingleton(as: AuthRepositories)
@injectable
class AuthRepositoriesImpl implements AuthRepositories {
  AuthDataSource authDataSource;
  AuthRepositoriesImpl(this.authDataSource);
  @override
  Future<Either<Failure, String>> login(AuthCredential credential) async {
    try {
      final resp = await authDataSource.login(credential);
      return Right(resp);
    } on CustomException catch (e) {
      return Left(ApiRequestFailure("${e.message}"));
    }
  }
}
