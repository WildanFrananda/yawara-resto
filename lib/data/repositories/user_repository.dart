import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:mobile/data/model/user/user.dart';
import 'package:mobile/data/remote/api_client.dart';
import 'package:mobile/domain/repositories/user_repository.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final ApiClient _apiClient;

  UserRepositoryImpl(this._apiClient);

  @override
  Future<User?> getProfile() async {
    try {
      return await _apiClient.getProfile();
    } catch (e) {
      throw Exception('Failed to fetch user profile: $e');
    }
  }

  @override
  Future<User> updateProfile({
    required final String name,
    required final String email,
    final String? phone,
    final String? address,
    final File? avatar,
  }) async {
    try {
      final response = await _apiClient.updateProfile(
        name,
        email,
        phone,
        address,
        avatar,
      );

      return response.data;
    } catch (e) {
      throw Exception('Failed to update user profile: $e');
    }
  }
}
