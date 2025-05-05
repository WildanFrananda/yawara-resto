import 'package:flutter/material.dart';
import 'package:mobile/core/routes/app_route.dart';

class AppRouteParser extends RouteInformationParser<AppRoute> {
  @override
  Future<AppRoute> parseRouteInformation(final RouteInformation routeInformation) async {
    final uri = routeInformation.uri;

    return AppRoute.fromLocation(uri.toString());
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
    return RouteInformation(uri: Uri.parse('/login'));
  }
}
