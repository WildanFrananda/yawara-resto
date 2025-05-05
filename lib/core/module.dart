import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/data/remote/api_client.dart';
import 'package:mobile/data/remote/booking_api_client.dart';
import 'package:mobile/data/remote/https_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @lazySingleton
  ApiClient apiClient(final HttpsClient client) => ApiClient(client.https);

  @lazySingleton
  BookingApiClient bookingApiClient(final HttpsClient client) =>
      BookingApiClient(client.https);

  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();

  @lazySingleton
  Connectivity get connectivity => Connectivity();
}
