import 'package:fresh_dio/fresh_dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/data/local/secure_storage_service.dart';
import 'package:mobile/data/model/login/login_response.dart';

@injectable
class TokenRepository implements TokenStorage<LoginResponse> {
  final SecureStorageService _secureStorage;

  TokenRepository({required final SecureStorageService secureStorage})
    : _secureStorage = secureStorage;

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _tokenTypeKey = 'token_type';
  static const String _expiresInKey = 'expires_in';

  @override
  Future<void> delete() async {
    await _secureStorage.deleteSecure(key: _accessTokenKey);
    await _secureStorage.deleteSecure(key: _refreshTokenKey);
    await _secureStorage.deleteSecure(key: _tokenTypeKey);
    await _secureStorage.deleteSecure(key: _expiresInKey);
  }

  @override
  Future<LoginResponse?> read() {
    return Future.wait([
      _secureStorage.getSecure(key: _accessTokenKey),
      _secureStorage.getSecure(key: _refreshTokenKey),
      _secureStorage.getSecure(key: _tokenTypeKey),
      _secureStorage.getSecure(key: _expiresInKey),
    ]).then((final values) {
      final accessToken = values[0];
      final refreshToken = values[1];
      final tokenType = values[2];
      final expiresIn = values[3];

      if (accessToken == null ||
          refreshToken == null ||
          tokenType == null ||
          expiresIn == null) {
        return null;
      }

      return LoginResponse(
        accessToken: accessToken,
        refreshToken: refreshToken,
        tokenType: tokenType,
        expiresIn: expiresIn,
        user: null, // User data is not stored in secure storage
      );
    });
  }

  @override
  Future<void> write(final LoginResponse token) {
    return Future.wait([
      _secureStorage.saveSecure(key: _accessTokenKey, value: token.accessToken),
      _secureStorage.saveSecure(key: _refreshTokenKey, value: token.refreshToken),
      _secureStorage.saveSecure(key: _tokenTypeKey, value: token.tokenType),
      _secureStorage.saveSecure(key: _expiresInKey, value: token.expiresIn.toString()),
    ]);
  }
}
