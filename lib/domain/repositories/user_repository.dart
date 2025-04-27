import 'dart:io';

import 'package:mobile/data/model/user/user.dart';

abstract interface class UserRepository {
  Future<User?> getProfile();
  Future<User> updateProfile({
    required final String name,
    required final String email,
    final String? phone,
    final String? address,
    final File? avatar,
  });
}
