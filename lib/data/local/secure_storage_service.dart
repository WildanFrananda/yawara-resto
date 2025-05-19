import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class SecureStorageService {
  final FlutterSecureStorage _secureStorage;
  final encrypt.Encrypter _encrypter;

  SecureStorageService()
    : _secureStorage = const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
      ),
      _encrypter = encrypt.Encrypter(encrypt.AES(encrypt.Key.fromLength(32)));

  Future<void> saveSecure({
    required final String key,
    required final String value,
  }) async {
    // final iv = encrypt.IV.fromSecureRandom(16);
    // final encrypted = _encrypter.encrypt(value, iv: iv);
    // final payload = '${iv.base64}:${encrypted.base64}';
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> getSecure({required final String key}) async {
    return _secureStorage.read(key: key);
    // if (payload == null) return null;

    // final parts = payload.split(':');
    // if (parts.length != 2) {
    //   await _secureStorage.delete(key: key);
    //   return null;
    // }
    // final iv = encrypt.IV.fromBase64(parts[0]);
    // final encrypted = encrypt.Encrypted.fromBase64(parts[1]);
    // return _encrypter.decrypt(encrypted, iv: iv);
  }

  Future<void> deleteSecure({required final String key}) async {
    await _secureStorage.delete(key: key);
  }
}
