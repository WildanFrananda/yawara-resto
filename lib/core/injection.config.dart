// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;
import 'package:mobile/core/module.dart' as _i285;
import 'package:mobile/core/utils/connectivity_service.dart' as _i466;
import 'package:mobile/core/utils/push_notification.dart' as _i277;
import 'package:mobile/data/local/local_prefs.dart' as _i274;
import 'package:mobile/data/local/secure_storage_service.dart' as _i848;
import 'package:mobile/data/remote/api_client.dart' as _i1037;
import 'package:mobile/data/remote/https_client.dart' as _i495;
import 'package:mobile/presentation/viewmodels/auth/auth_view_model.dart'
    as _i507;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i277.PushNotification>(() => _i277.PushNotification());
    gh.factory<_i466.ConnectivityService>(() => _i466.ConnectivityService());
    gh.factory<_i848.SecureStorageService>(() => _i848.SecureStorageService());
    gh.factory<_i495.HttpsClient>(() => _i495.HttpsClient());
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i1037.ApiClient>(() => registerModule.apiClient);
    gh.lazySingleton<_i183.ImagePicker>(() => registerModule.imagePicker);
    gh.factory<_i274.LocalPrefs>(
      () => _i274.LocalPrefs(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i507.AuthViewModel>(
      () => _i507.AuthViewModel(
        gh<_i1037.ApiClient>(),
        gh<_i848.SecureStorageService>(),
        gh<_i183.ImagePicker>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i285.RegisterModule {}
