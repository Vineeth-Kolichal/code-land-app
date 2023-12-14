import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'custom_exception.dart';

@lazySingleton
@injectable
class NetworkClient {
  final Dio _dio;
  NetworkClient(this._dio);

  Future<Response> postRequestWithoutToken(String path, dynamic data) async {
    _dio.options.headers = {
      "Content-Type": "application/json",
    };
    try {
      final response = await _dio.post(path, data: data);
      return response;
    } on DioException catch (e) {
      throw CustomException.fromDioError(e);
    }
  }

  Future<dynamic> getRequestWithoutToken(String path) async {
    _dio.options.headers = {
      "Content-Type": "application/json",
    };
    try {
      final response = await _dio.get(path);
      return response.data;
    } on DioException catch (e) {
      throw CustomException.fromDioError(e);
    }
  }
}
