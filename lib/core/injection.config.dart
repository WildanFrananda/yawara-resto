// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../data/local/local_prefs.dart' as _i405;
import '../data/local/secure_storage_service.dart' as _i474;
import '../data/remote/api_client.dart' as _i117;
import '../data/remote/booking_api_client.dart' as _i452;
import '../data/remote/https_client.dart' as _i146;
import '../data/remote/menu/menu_api_client.dart' as _i379;
import '../data/repositories/user_repository.dart' as _i977;
import '../domain/repositories/user_repository.dart' as _i544;
import '../domain/service/auth_service.dart' as _i293;
import '../presentation/viewmodels/auth/auth_view_model.dart' as _i521;
import '../presentation/viewmodels/home/home_view_model.dart' as _i763;
import '../presentation/viewmodels/offline/offline_view_model.dart' as _i978;
import 'module.dart' as _i946;
import 'routes/app_route_parser.dart' as _i962;
import 'routes/app_router_delegate.dart' as _i1003;
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
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i890.PushNotification>(() => _i890.PushNotification());
    gh.factory<_i474.SecureStorageService>(() => _i474.SecureStorageService());
    gh.singleton<_i962.AppRouteParser>(() => _i962.AppRouteParser());
    gh.singleton<_i1003.AppRouterDelegate>(() => _i1003.AppRouterDelegate());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.lazySingleton<_i183.ImagePicker>(() => registerModule.imagePicker);
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.factory<_i405.LocalPrefs>(
      () => _i405.LocalPrefs(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i910.ConnectivityService>(
      () => _i910.ConnectivityService(gh<_i895.Connectivity>()),
    );
    gh.singleton<_i146.HttpsClient>(
      () => _i146.HttpsClient(gh<_i474.SecureStorageService>()),
    );
    gh.lazySingleton<_i117.ApiClient>(
      () => registerModule.apiClient(gh<_i146.HttpsClient>()),
    );
    gh.lazySingleton<_i452.BookingApiClient>(
      () => registerModule.bookingApiClient(gh<_i146.HttpsClient>()),
    );
    gh.lazySingleton<_i379.MenuApiClient>(
      () => registerModule.menuApiClient(gh<_i146.HttpsClient>()),
    );
    gh.factory<_i978.OfflineViewModel>(
      () => _i978.OfflineViewModel(
        gh<_i452.BookingApiClient>(),
        gh<_i895.Connectivity>(),
      ),
    );
    gh.lazySingleton<_i293.AuthService>(
      () => _i293.AuthService(
        gh<_i117.ApiClient>(),
        gh<_i474.SecureStorageService>(),
      ),
    );
    gh.factory<_i544.UserRepository>(
      () => _i977.UserRepositoryImpl(gh<_i117.ApiClient>()),
    );
    gh.factory<_i763.HomeViewModel>(
      () => _i763.HomeViewModel(
        gh<_i452.BookingApiClient>(),
        gh<_i895.Connectivity>(),
        gh<_i978.OfflineViewModel>(),
        gh<_i379.MenuApiClient>(),
      ),
    );
    gh.factory<_i521.AuthViewModel>(
      () => _i521.AuthViewModel(
        gh<_i293.AuthService>(),
        gh<_i474.SecureStorageService>(),
        gh<_i183.ImagePicker>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i946.RegisterModule {}
