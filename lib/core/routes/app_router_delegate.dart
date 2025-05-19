import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/routes/app_route.dart';
import 'package:mobile/data/model/category/category_model.dart';
import 'package:mobile/presentation/screens/category_screen.dart';
import 'package:mobile/presentation/screens/home_screen.dart';
import 'package:mobile/presentation/screens/login_screen.dart';
import 'package:mobile/presentation/screens/menu_detail_screen.dart';
import 'package:mobile/presentation/screens/menu_list_screen.dart';
import 'package:mobile/presentation/screens/profile_screen.dart';
import 'package:mobile/presentation/screens/reservation_screen.dart';
import 'package:mobile/presentation/screens/splash_screen.dart';
import 'package:mobile/presentation/viewmodels/home/home_view_model.dart';
import 'package:mobile/presentation/viewmodels/reservation/reservation_view_model.dart';

@singleton
class AppRouterDelegate extends RouterDelegate<AppRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoute> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  AppRoute _route = AppRoute.splash();
  bool _showSplash = true;

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  AppRoute get currentConfiguration => _showSplash ? AppRoute.splash() : _route;

  void setRoute(final AppRoute r) {
    _route = r;
    notifyListeners();
  }

  void onSplashFinished(final AppRoute route) {
    _showSplash = false;
    _route = route;
    notifyListeners();
  }

  @override
  Navigator build(final BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (_showSplash) ...[
          MaterialPage(child: SplashScreen(onFinished: onSplashFinished)),
        ] else ...[
          const MaterialPage(child: LoginScreen()),
          if (_route is AppRouteHome) ...[const MaterialPage(child: HomeScreen())],
          if (_route is AppRouteProfile) ...[const MaterialPage(child: ProfileScreen())],
          if (_route is AppRouteReservation) ...[
            MaterialPage(
              child: ReservationScreen(viewModel: GetIt.I<ReservationViewModel>()),
            ),
          ],
          if (_route is AppRouteCategory) ...[
            const MaterialPage(child: CategoryScreen()),
          ],
          if (_route is AppRouteMenuList) ...[
            MaterialPage(child: MenuListScreen(category: GetIt.I<CategoryModel>())),
          ],
          if (_route is AppRouteMenuDetail) ...[
            MaterialPage(
              child: MenuDetailScreen(menuId: (_route as AppRouteMenuDetail).menuId),
            ),
          ],
        ],
      ],
      onPopPage: (final Route<dynamic> route, final dynamic result) {
        // Handle pop navigation logic
        if (!route.didPop(result)) {
          return false;
        }
        if (_route is AppRouteHome) {
          // Typically you'd want to handle "back" from home specially
          // For example, maybe show an exit confirmation dialog
          return false; // Don't allow normal pop from home
        }

        // For other routes, let the system pop and update our route state
        _route = AppRoute.login(); // Default to login when popping
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(final AppRoute configuration) async {
    // If we're in splash, keep showing it unless it's an explicit navigation
    if (_showSplash && configuration is! AppRouteSplash) {
      _route = configuration;
      _showSplash = false;
    } else {
      _route = configuration;
    }

    return SynchronousFuture(null);
  }
}
