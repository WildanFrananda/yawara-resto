import 'package:mobile/data/model/category/category_model.dart';

sealed class AppRoute {
  const AppRoute();

  factory AppRoute.splash() = AppRouteSplash;
  factory AppRoute.login() = AppRouteLogin;
  factory AppRoute.register() = AppRouteRegister;
  factory AppRoute.profile() = AppRouteProfile;
  factory AppRoute.home() = AppRouteHome;
  factory AppRoute.reservation() = AppRouteReservation;
  factory AppRoute.categories() = AppRouteCategory;
  factory AppRoute.menuList(final CategoryModel categoryId) = AppRouteMenuList;
  factory AppRoute.menuDetail(final String menuId) = AppRouteMenuDetail;
}

class AppRouteSplash extends AppRoute {
  const AppRouteSplash();
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

class AppRouteReservation extends AppRoute {
  const AppRouteReservation();
}

class AppRouteCategory extends AppRoute {
  const AppRouteCategory();
}

class AppRouteMenuList extends AppRoute {
  final CategoryModel categoryId;

  const AppRouteMenuList(this.categoryId);
}

class AppRouteMenuDetail extends AppRoute {
  final String menuId;

  const AppRouteMenuDetail(this.menuId);
}
