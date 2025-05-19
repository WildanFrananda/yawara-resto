import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/utils/token_interceptor.dart';
import 'package:mobile/data/local/secure_storage_service.dart';

@singleton
class HttpsClient {
  final Dio _dio = Dio();
  final SecureStorageService _storage;

  HttpsClient(this._storage) {
    _dio.options
      ..baseUrl = dotenv.env['BASE_URL'] ?? ''
      ..connectTimeout = const Duration(seconds: 30)
      ..receiveTimeout = const Duration(seconds: 30)
      ..headers = {'Content-Type': 'application/json', 'Accept': 'application/json'};

    _dio.interceptors
      ..add(LogInterceptor(responseBody: true, requestBody: true))
      ..add(TokenInterceptor(_storage));
  }

  Dio get https => _dio;
}
