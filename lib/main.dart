import 'dart:convert';
import 'dart:io';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:mobile/core/injection.dart';
import 'package:mobile/core/routes/app_route_parser.dart';
import 'package:mobile/core/routes/app_router_delegate.dart';
import 'package:mobile/core/utils/push_notification.dart';
import 'package:mobile/data/model/address/address_model.dart';
import 'package:mobile/data/model/history/history_model.dart';
import 'package:mobile/data/model/order/order_draft.dart';
import 'package:mobile/data/model/review/review_model.dart';
import 'package:mobile/presentation/viewmodels/address/address_view_model.dart';
import 'package:mobile/presentation/viewmodels/history/history_view_model.dart';
import 'package:mobile/presentation/viewmodels/menu/menu_detail_view_model.dart';
import 'package:mobile/presentation/viewmodels/menu/menu_view_model.dart';
import 'package:mobile/presentation/viewmodels/review/review_management.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class HttpsOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(final SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (final X509Certificate cert, final String host, final int port) => true;
  }
}

Future<void> main() async {
  HttpOverrides.global = HttpsOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await configureDependencies();
  const keyStorage = FlutterSecureStorage();
  String? base64Key = await keyStorage.read(key: 'hive_box_key');
  if (base64Key == null) {
    final raw = encrypt.Key.fromSecureRandom(32);
    base64Key = base64.encode(raw.bytes);
    await keyStorage.write(key: 'hive_box_key', value: base64Key);
  }
  final encryptionKey = base64.decode(base64Key);
  final appDocDir = await getApplicationDocumentsDirectory();
  final pushService = getIt<PushNotification>();
  await Hive.initFlutter(appDocDir.path);
  Hive
    ..registerAdapter(HistoryModelAdapter())
    ..registerAdapter(AddressModelAdapter())
    ..registerAdapter(ReviewModelAdapter())
    ..registerAdapter(OrderDraftAdapter());
  await pushService.init();
  await Hive.openBox<HistoryModel>('booking_history');
  await Hive.openBox<AddressModel>('addresses');
  await Hive.openBox<ReviewModel>('reviews');
  await Hive.openBox<OrderDraft>(
    'order_drafts',
    encryptionCipher: HiveAesCipher(encryptionKey),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<MenuViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<MenuDetailViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<HistoryViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<AddressViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<ReviewManagementViewModel>()),
      ],
      child: const RestaurantApp(),
    ),
  );
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
      debugShowCheckedModeBanner: false,
    );
  }
}
