// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../data/local/local_prefs.dart' as _i405;
import '../data/local/secure_storage_service.dart' as _i474;
import '../data/remote/api_client.dart' as _i117;
import '../data/remote/https_client.dart' as _i146;
import '../data/repositories/token_repository.dart' as _i1050;
import '../data/repositories/user_repository.dart' as _i977;
import '../domain/repositories/user_repository.dart' as _i544;
import '../domain/service/auth_service.dart' as _i293;
import '../presentation/viewmodels/auth/auth_view_model.dart' as _i521;
import 'module.dart' as _i946;
import 'utils/connectivity_service.dart' as _i910;
import 'utils/push_notification.dart' as _i890;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i890.PushNotification>(() => _i890.PushNotification());
    gh.factory<_i910.ConnectivityService>(() => _i910.ConnectivityService());
    gh.factory<_i474.SecureStorageService>(() => _i474.SecureStorageService());
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.lazySingleton<_i183.ImagePicker>(() => registerModule.imagePicker);
    gh.factory<_i405.LocalPrefs>(
      () => _i405.LocalPrefs(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i1050.TokenRepository>(
      () => _i1050.TokenRepository(
        secureStorage: gh<_i474.SecureStorageService>(),
      ),
    );
    gh.singleton<_i146.HttpsClient>(
      () => _i146.HttpsClient(gh<_i1050.TokenRepository>()),
    );
    gh.lazySingleton<_i117.ApiClient>(
      () => registerModule.apiClient(gh<_i146.HttpsClient>()),
    );
    gh.factory<_i521.AuthViewModel>(
      () => _i521.AuthViewModel(
        gh<_i117.ApiClient>(),
        gh<_i474.SecureStorageService>(),
        gh<_i183.ImagePicker>(),
      ),
    );
    gh.factory<_i544.UserRepository>(
      () => _i977.UserRepositoryImpl(gh<_i117.ApiClient>()),
    );
    gh.lazySingleton<_i293.AuthService>(
      () => _i293.AuthService(gh<_i117.ApiClient>(), gh<_i146.HttpsClient>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i946.RegisterModule {}
