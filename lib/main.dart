import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/foundation.dart';
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
import 'package:mobile/data/model/menu/menu_model.dart';
import 'package:mobile/data/model/order/order_draft.dart';
import 'package:mobile/data/model/review/review_model.dart';
import 'package:mobile/presentation/viewmodels/address/address_view_model.dart';
import 'package:mobile/presentation/viewmodels/auth/auth_view_model.dart';
import 'package:mobile/presentation/viewmodels/history/history_view_model.dart';
import 'package:mobile/presentation/viewmodels/home/home_view_model.dart';
import 'package:mobile/presentation/viewmodels/menu/menu_detail_view_model.dart';
import 'package:mobile/presentation/viewmodels/menu/menu_view_model.dart';
import 'package:mobile/presentation/viewmodels/offline/offline_view_model.dart';
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

Future<void> migrateEncryptedSecure({required final String key}) async {
  const storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
  final raw = await storage.read(key: key);

  if (raw != null && !raw.contains(':')) {
    await storage.delete(key: key);
    debugPrint('Migrated (deleted) old key `$key` from encryptedSharedPrefs');
  }
}

Future<void> main() async {
  HttpOverrides.global = HttpsOverrides();
  BindingBase.debugZoneErrorsAreFatal = true;


  // 1️⃣ Atur Flutter error handler (widget–tree errors)
  FlutterError.onError = (final FlutterErrorDetails details) {
    // Cetak ke console (atau kirim ke Sentry/Crashlytics)
    FlutterError.presentError(details);
    // Jika ingin berhenti di debugger untuk error sinkron di widget tree:
    if (kDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    }
  };

  // 2️⃣ Bungkus runApp dalam zone yang menangani uncaught async errors
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await migrateEncryptedSecure(key: 'accessToken');
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
      await Hive.openBox<MenuModel>('menus');
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
            ChangeNotifierProvider(create: (_) => getIt<OfflineViewModel>()),
            ChangeNotifierProvider(create: (_) => getIt<AuthViewModel>()),
            ChangeNotifierProvider(create: (_) => getIt<HomeViewModel>()),
            ChangeNotifierProvider(create: (_) => getIt<MenuViewModel>()),
            ChangeNotifierProvider(create: (_) => getIt<MenuDetailViewModel>()),
            ChangeNotifierProvider(create: (_) => getIt<HistoryViewModel>()),
            ChangeNotifierProvider(create: (_) => getIt<AddressViewModel>()),
            ChangeNotifierProvider(create: (_) => getIt<ReviewManagementViewModel>()),
          ],
          child: const RestaurantApp(),
        ),
      );
    },
    (final Object error, final StackTrace stack) {
      // Tangani atau laporkan error asinkron
      debugPrint('❌ Uncaught async error: $error');
      debugPrintStack(stackTrace: stack);
      // Di sini Anda bisa kirim ke Crashlytics, Sentry, dsb.
    },
  );
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp.router(
      title: 'Restaurant App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0x00000000),
        primarySwatch: const MaterialColor(0xFF362E54, <int, Color>{
          50: Color(0xFFE5E3EB),
          100: Color(0xFFBEB8CE),
          200: Color(0xFF938AAE),
          300: Color(0xFF675C8E),
          400: Color(0xFF473A76),
          500: Color(0xFF362E54),
          600: Color(0xFF30294C),
          700: Color(0xFF282241),
          800: Color(0xFF211C37),
          900: Color(0xFF151026),
        }),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerDelegate: getIt<AppRouterDelegate>(),
      routeInformationParser: getIt<AppRouteParser>(),
      debugShowCheckedModeBanner: false,
    );
  }
}
