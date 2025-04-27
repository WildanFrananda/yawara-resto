import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/data/model/login/login_response.dart';
import 'package:mobile/data/repositories/token_repository.dart';

@singleton
class HttpsClient {
  final Dio _dio = new Dio();
  final TokenRepository _tokenRepository;
  late final Fresh<LoginResponse> _fresh;

  HttpsClient(this._tokenRepository) {
    _configureDio();
  }

  void _configureDio() {
    _dio.options.baseUrl = dotenv.env['BASE_URL'] ?? '';
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    _dio.interceptors.add(new LogInterceptor(responseBody: true, requestBody: true));
  }

  void configureTokenRefresh() {
    _fresh = Fresh<LoginResponse>(
      tokenStorage: _tokenRepository,
      refreshToken: (final token, _) async {
        try {
          final baseUrl = dotenv.env['BASE_URL'] ?? '';
          final refreshDio = new Dio(BaseOptions(baseUrl: baseUrl));

          final response = await refreshDio.post<dynamic>(
            '/auth/refresh',
            data: {'refreshToken': token?.refreshToken},
          );

          return LoginResponse.fromJson(response.data as Map<String, dynamic>);
        } catch (e) {
          throw RevokeTokenException();
        }
      },
      tokenHeader: (final token) {
        return {'Authorization': 'Bearer ${token.accessToken}'};
      },
      shouldRefresh: (final response) {
        return response?.statusCode == 401;
      },
    );

    _dio.interceptors.add(_fresh);
  }

  Dio get https => _dio;
  Fresh<LoginResponse> get fresh => _fresh;
  Stream<AuthenticationStatus> get authenticationStatus => _fresh.authenticationStatus;
}
