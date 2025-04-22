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
import 'package:mobile/core/utils/connectivity_service.dart' as _i466;
import 'package:mobile/core/utils/push_notification.dart' as _i277;
import 'package:mobile/data/local/secure_storage_service.dart' as _i848;
import 'package:mobile/data/remote/api_client.dart' as _i1037;
import 'package:mobile/data/remote/https_client.dart' as _i495;
import 'package:mobile/presentation/viewmodels/auth/auth_view_model.dart'
    as _i507;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i277.PushNotification>(() => _i277.PushNotification());
    gh.factory<_i466.ConnectivityService>(() => _i466.ConnectivityService());
    gh.factory<_i495.HttpsClient>(() => _i495.HttpsClient());
    gh.singleton<_i848.SecureStorageService>(
      () => _i848.SecureStorageService(),
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
