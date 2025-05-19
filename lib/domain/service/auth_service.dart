import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/data/local/secure_storage_service.dart';
import 'package:mobile/data/model/login/login_request.dart';
import 'package:mobile/data/model/login/login_response.dart';
import 'package:mobile/data/model/register/register_request.dart';
import 'package:mobile/data/model/user/user.dart';
import 'package:mobile/data/remote/api_client.dart';
import 'package:retrofit/dio.dart';

@lazySingleton
class AuthService {
  final ApiClient _apiClient;
  final SecureStorageService _storage;

  AuthService(this._apiClient, this._storage);

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
    final request = LoginRequest(email: email, password: password);
    final response = await _apiClient.login(request);
    if (response.response.statusCode == 200 || response.response.statusCode == 201) {
      await _storage.saveSecure(key: 'accessToken', value: response.data.accessToken);
    }
    return response;
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
    await _storage.deleteSecure(key: 'accessToken');
  }
}
