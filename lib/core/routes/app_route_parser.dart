import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/routes/app_route.dart';

@singleton
class AppRouteParser extends RouteInformationParser<AppRoute> {
  @override
  Future<AppRoute> parseRouteInformation(final RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.uri.toString());
    if (uri.pathSegments.isEmpty) {
      return const AppRouteLogin();
    }
    if (uri.pathSegments[0] == 'login') {
      return const AppRouteLogin();
    }
    if (uri.pathSegments[0] == 'register') {
      return const AppRouteRegister();
    }
    if (uri.pathSegments[0] == 'home') {
      return const AppRouteHome();
    }
    if (uri.pathSegments[0] == 'profile') {
      return const AppRouteProfile();
    }
    return const AppRouteLogin();
  }

  @override
  RouteInformation? restoreRouteInformation(final AppRoute configuration) {
    if (configuration is AppRouteLogin) return RouteInformation(uri: Uri.parse('/login'));
    if (configuration is AppRouteRegister) {
      return RouteInformation(uri: Uri.parse('/register'));
    }
    if (configuration is AppRouteHome) {
      return RouteInformation(uri: Uri.parse('/home'));
    }
    if (configuration is AppRouteProfile) {
      return RouteInformation(uri: Uri.parse('/profile'));
    }
    if (configuration is AppRouteCategory) {
      return RouteInformation(uri: Uri.parse('/category'));
    }
    if (configuration is AppRouteMenuList) {
      return RouteInformation(uri: Uri.parse('/menu/${configuration.categoryId}'));
    }
    if (configuration is AppRouteMenuDetail) {
      return RouteInformation(uri: Uri.parse('/menu/${configuration.menuId}'));
    }
    if (configuration is AppRouteReservation) {
      return RouteInformation(uri: Uri.parse('/reservation'));
    }
    return RouteInformation(uri: Uri.parse('/login'));
  }
}
