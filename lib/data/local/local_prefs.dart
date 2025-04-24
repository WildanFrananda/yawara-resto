import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsKeys {
  static const String authToken = 'auth_token';
  static const String refreshToken = 'refresh_token';
  static const String userId = 'user_id';
  static const String firsRun = 'first_run';
  static const String locale = 'locale';
  static const String themeMode = 'theme_mode';
}

@injectable
class LocalPrefs {
  final SharedPreferences _prefs;

  const LocalPrefs(this._prefs);

  static Future<LocalPrefs> init() async {
    final prefs = await SharedPreferences.getInstance();

    return LocalPrefs(prefs);
  }

  String? get authToken => _prefs.getString(PrefsKeys.authToken);

  Future<void> setAuthToken(final String? value) async {
    if (value == null) {
      await _prefs.remove(PrefsKeys.authToken);
    } else {
      await _prefs.setString(PrefsKeys.authToken, value);
    }
  }
}
