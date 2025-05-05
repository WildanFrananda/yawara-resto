sealed class AppRoute {
  const AppRoute();

  static AppRoute fromLocation(final String location) {
    if (location == '/login') {
      return const AppRouteLogin();
    } else if (location == '/register') {
      return const AppRouteRegister();
    } else if (location == '/profile') {
      return const AppRouteProfile();
    } else {
      throw Exception('Unknown route: $location');
    }
  }
}

class AppRouteLogin extends AppRoute {
  const AppRouteLogin();
}

class AppRouteRegister extends AppRoute {
  const AppRouteRegister();
}

class AppRouteHome extends AppRoute {
  const AppRouteHome();
}

class AppRouteProfile extends AppRoute {
  const AppRouteProfile();
}
