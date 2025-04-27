import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/data/model/login/login_request.dart';
import 'package:mobile/data/model/login/login_response.dart';
import 'package:mobile/data/model/register/register_request.dart';
import 'package:mobile/data/model/user/user.dart';
import 'package:mobile/data/remote/api_client.dart';
import 'package:mobile/data/remote/https_client.dart';
import 'package:retrofit/dio.dart';

@lazySingleton
class AuthService {
  final ApiClient _apiClient;
  final HttpsClient _httpsClient;

  AuthService(this._apiClient, this._httpsClient);

  Future<bool> register(
    final String name,
    final String email,
    final String password,
  ) async {
    try {
      final request = new RegisterRequest(name: name, email: email, password: password);
      final response = await _apiClient.register(request);

      return response.response.statusCode == 200 || response.response.statusCode == 201;
    } catch (e) {
      return false;
    }
  }

  Future<HttpResponse<LoginResponse>> login(
    final String email,
    final String password,
  ) async {
    try {
      final request = new LoginRequest(email: email, password: password);
      final response = await _apiClient.login(request);

      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        await _httpsClient.fresh.setToken(response.data);
      }

      return response;
    } on DioException catch (e) {
      throw FormatException((e.response?.data['message'] as String?) ?? 'Login failed');
    }
  }

  Future<User> getProfile() async {
    try {
      final response = await _apiClient.getProfile();

      return response;
    } on DioException catch (e) {
      throw FormatException(
        (e.response?.data['message'] as String?) ?? 'Failed to fetch profile',
      );
    }
  }

  Future<HttpResponse<User>> updateProfile(
    final String name,
    final String email,
    final String? phone,
    final String? address,
    final File? avatar,
  ) async {
    try {
      final response = await _apiClient.updateProfile(
        name,
        email,
        phone,
        address,
        avatar,
      );

      return response;
    } on DioException catch (e) {
      throw FormatException(
        (e.response?.data['message'] as String?) ?? 'Failed to update profile',
      );
    }
  }

  Future<void> logout() async {
    await _httpsClient.fresh.clearToken();
  }

  Stream<AuthenticationStatus> get authenticationStatus =>
      _httpsClient.authenticationStatus;
}
