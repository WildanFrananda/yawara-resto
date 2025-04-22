import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:mobile/core/injection.dart';
import 'package:mobile/core/routes/app_route_parser.dart';
import 'package:mobile/core/routes/app_router_delegate.dart';
import 'package:mobile/core/utils/push_notification.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocDir = await getApplicationDocumentsDirectory();
  final pushService = getIt<PushNotification>();
  await dotenv.load();
  await configureDependencies();
  await Hive.initFlutter(appDocDir.path);
  await pushService.init();
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp.router(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerDelegate: getIt<AppRouterDelegate>(),
      routeInformationParser: getIt<AppRouteParser>(),
    );
  }
}
