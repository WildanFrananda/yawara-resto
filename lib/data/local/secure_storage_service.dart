import 'package:encrypt/encrypt.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@singleton
class SecureStorageService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final Encrypter _encrypter;
  final IV _iv;

  SecureStorageService()
    : _iv = IV.fromLength(16),
      _encrypter = Encrypter(AES(Key.fromLength(32)));

  Future<void> saveSecure({
    required final String key,
    required final String value,
  }) async {
    final encrypted = _encrypter.encrypt(value, iv: _iv);
    await _secureStorage.write(key: key, value: encrypted.base64);
  }

  Future<String?> getSecure({required final String key}) async {
    final encrypted = await _secureStorage.read(key: key);

    if (encrypted == null) return null;

    return _encrypter.decrypt64(encrypted, iv: _iv);
  }
}
