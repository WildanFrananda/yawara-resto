import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mobile/data/local/secure_storage_service.dart';

class TokenInterceptor extends Interceptor {
  final SecureStorageService _storage;
  TokenInterceptor(this._storage);

  @override
  void onRequest(
    final RequestOptions options,
    final RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.getSecure(key: 'accessToken');
    if (token != null) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }
    return handler.next(options);
  }
}
