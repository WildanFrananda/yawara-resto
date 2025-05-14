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
import 'package:mobile/presentation/screens/register_screen.dart';
import 'package:mobile/presentation/screens/reservation_screen.dart';
import 'package:mobile/presentation/viewmodels/auth/auth_view_model.dart';
import 'package:mobile/presentation/viewmodels/home/home_view_model.dart';
import 'package:mobile/presentation/viewmodels/reservation/reservation_view_model.dart';

@singleton
class AppRouterDelegate extends RouterDelegate<AppRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoute> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  AppRoute _route = AppRoute.login();

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  AppRoute get currentConfiguration => _route;

  void setRoute(final AppRoute r) {
    _route = r;
    notifyListeners();
  }

  @override
  Navigator build(final BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(child: LoginScreen(authViewModel: GetIt.I<AuthViewModel>())),
        if (_route is AppRouteRegister) ...[
          MaterialPage(child: RegisterScreen(authViewModel: GetIt.I<AuthViewModel>())),
        ],
        if (_route is AppRouteHome) ...[
          MaterialPage(child: HomeScreen(viewModel: GetIt.I<HomeViewModel>())),
        ],
        if (_route is AppRouteProfile) ...[const MaterialPage(child: ProfileScreen())],
        if (_route is AppRouteReservation) ...[
          MaterialPage(
            child: ReservationScreen(viewModel: GetIt.I<ReservationViewModel>()),
          ),
        ],
        if (_route is AppRouteCategory) ...[const MaterialPage(child: CategoryScreen())],
        if (_route is AppRouteMenuList) ...[
          MaterialPage(child: MenuListScreen(category: GetIt.I<CategoryModel>())),
        ],
        if (_route is AppRouteMenuDetail) ...[
          MaterialPage(
            child: MenuDetailScreen(menuId: (_route as AppRouteMenuDetail).menuId),
          ),
        ],
      ],
      onDidRemovePage: (final route) {
        _route = const AppRouteLogin();
        notifyListeners();
      },
    );
  }

  @override
  Future<void> setNewRoutePath(final AppRoute configuration) async {
    _route = configuration;

    return SynchronousFuture(null);
  }
}
