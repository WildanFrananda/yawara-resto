import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: true)
Future<void> configureDependencies() async => getIt.init();
