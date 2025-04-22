import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@injectable
class HttpsClient {
  Dio get https {
    final https = Dio();
    https.options.baseUrl = dotenv.env['BASE_URL'] ?? '';
    https.options.connectTimeout = const Duration(seconds: 30);
    https.options.receiveTimeout = const Duration(seconds: 30);
    https.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    https.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

    return https;
  }
}
