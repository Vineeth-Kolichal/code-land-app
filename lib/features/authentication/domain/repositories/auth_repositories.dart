import 'package:dartz/dartz.dart';
import 'package:dev_test/core/failure/failures.dart';

import '../usecases/login_usecase.dart';

abstract class AuthRepositories {
  Future<Either<Failure, String>> login(AuthCredential credential);
}
