import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/data/local/secure_storage_service.dart';
import 'package:mobile/data/model/login/login_request.dart';
import 'package:mobile/data/model/register/register_request.dart';
import 'package:mobile/data/model/user/user.dart';
import 'package:mobile/data/remote/api_client.dart';

@injectable
class AuthViewModel extends ChangeNotifier {
  final ApiClient _apiClient;
  final SecureStorageService _secureStorage;
  final ImagePicker _imagePicker;

  User? user;
  bool loading = false;

  AuthViewModel(this._apiClient, this._secureStorage, this._imagePicker);

  Future<void> login(final String email, final String password) async {
    loading = true;
    notifyListeners();

    try {
      final response = await _apiClient.login(
        LoginRequest(email: email, password: password),
      );
      await _secureStorage.saveSecure(
        key: 'accessToken',
        value: response.data.accessToken,
      );
      await _secureStorage.saveSecure(
        key: 'refreshToken',
        value: response.data.refreshToken,
      );
      user = response.data.user;
    } on DioException catch (e) {
      throw FormatException((e.response?.data['message'] as String?) ?? 'Login failed');
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> register(
    final String name,
    final String email,
    final String password,
  ) async {
    loading = true;
    notifyListeners();

    try {
      await _apiClient.register(
        RegisterRequest(name: name, email: email, password: password),
      );
    } on DioException catch (e) {
      throw FormatException(
        (e.response?.data['message'] as String?) ?? 'Registration failed',
      );
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> fetchProfile() async {
    loading = true;
    notifyListeners();

    try {
      user = await _apiClient.getProfile();
    } on DioException catch (e) {
      throw FormatException(
        (e.response?.data['message'] as String?) ?? 'Failed to fetch user',
      );
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> updateProfile({
    required final String name,
    required final String email,
    required final String phone,
    required final String address,
  }) async {
    loading = true;
    notifyListeners();

    try {
      final XFile? picked = await _imagePicker.pickImage(source: ImageSource.gallery);
      final File file = File(picked!.path);
      final response = await _apiClient.updateProfile(name, email, phone, address, file);
      user = response.data;
    } on DioException catch (e) {
      throw FormatException(
        (e.response?.data['message'] as String?) ?? 'Failed to update user',
      );
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
