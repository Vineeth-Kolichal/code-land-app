import 'package:dev_test/core/api_endpoints/api_endpoints.dart';
import 'package:dev_test/core/network/custom_exception.dart';
import 'package:dev_test/core/network/network_client.dart';
import 'package:dev_test/features/authentication/data/datasources/local_data_source.dart';
import 'package:dev_test/features/authentication/data/models/login_resp_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/login_usecase.dart';

abstract class AuthDataSource {
  Future<String> login(AuthCredential credential);
}

@LazySingleton(as: AuthDataSource)
@injectable
class AuthDataSourceImpl implements AuthDataSource {
  LocalDataSource localDataSource;
  NetworkClient client;
  AuthDataSourceImpl(this.client, this.localDataSource);
  @override
  Future<String> login(AuthCredential credential) async {
    try {
      final response =
          await client.postRequestWithoutToken(ApiEndpoints.login, {
        "params": {
          "login": credential.useName,
          "password": credential.password,
          "db": "cabs"
        }
      });
      if (response.statusCode == 200) {
        final data = LoginRespModel.fromJson(response.data);
        await localDataSource.storeData(data.result.userContext);
        return "Success";
      } else {
        throw CustomException.fromDioError(DioException.badResponse(
          statusCode: 404,
          requestOptions: RequestOptions(),
          response: response,
        ));
      }
    } on DioException catch (e) {
      throw CustomException.fromDioError(e);
    }
  }
}
