import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsKeys {
  static const String authToken = 'auth_token';
  static const String refreshToken = 'refresh_token';
  static const String userId = 'user_id';
  static const String firsRun = 'first_run';
  static const String locale = 'locale';
  static const String themeMode = 'theme_mode';
}

class LocalPrefs {
  final SharedPreferences _prefs;

  LocalPrefs._(this._prefs);

  static Future<LocalPrefs> init() async {
    final prefs = await SharedPreferences.getInstance();

    return LocalPrefs._(prefs);
  }

  String? get authToken => _prefs.getString(PrefsKeys.authToken);
  set authToken(final String? value) {
    if (value == null) {
      unawaited(_prefs.remove(PrefsKeys.authToken));
    } else {
      unawaited(_prefs.setString(PrefsKeys.authToken, value));
    }
  }
}
