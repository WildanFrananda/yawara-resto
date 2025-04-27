import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/core/routes/app_route.dart';
import 'package:mobile/presentation/screens/login_screen.dart';
import 'package:mobile/presentation/screens/profile_screen.dart';
import 'package:mobile/presentation/screens/register_screen.dart';
import 'package:mobile/presentation/viewmodels/auth/auth_view_model.dart';

class AppRouterDelegate extends RouterDelegate<AppRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoute> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  AppRoute _route = const AppRouteLogin();

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  AppRoute get currentConfiguration => _route;

  @override
  Navigator build(final BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (_route is AppRouteLogin)
          MaterialPage(child: LoginScreen(authViewModel: GetIt.I<AuthViewModel>())),
        if (_route is AppRouteRegister)
          MaterialPage(child: RegisterScreen(authViewModel: GetIt.I<AuthViewModel>())),
        if (_route is AppRouteProfile)
          MaterialPage(child: ProfileScreen(authViewModel: GetIt.I<AuthViewModel>())),
      ],
      onDidRemovePage: (final route) {
        _route = const AppRouteLogin();
        notifyListeners();
      },
    );
  }

  @override
  Future<void> setNewRoutePath(final dynamic configuration) async {
    if (configuration is AppRoute) {
      _route = configuration;
    }
  }
}
