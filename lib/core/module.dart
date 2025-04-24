import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/data/remote/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  ApiClient get apiClient => ApiClient(Dio());

  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();
}
