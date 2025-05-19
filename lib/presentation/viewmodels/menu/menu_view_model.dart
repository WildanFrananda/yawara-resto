import 'package:flutter/material.dart';
import 'package:mobile/core/routes/app_route.dart';
import 'package:mobile/core/routes/app_router_delegate.dart';
import 'package:mobile/data/model/category/category_model.dart';
import 'package:mobile/data/model/menu/menu_model.dart';
import 'package:mobile/data/remote/menu/menu_api_client.dart';
import 'package:provider/provider.dart';

class MenuViewModel extends ChangeNotifier {
  final MenuApiClient _menuApiClient;

  List<CategoryModel> categories = [];
  bool loadingCategories = false;
  String? categoriesError;

  List<MenuModel> menus = [];
  int _menuPage = 1;
  bool loadingMenus = false;
  bool hasMoreMenus = true;
  String? menusError;
  String? selectedCategoryId;

  MenuViewModel(this._menuApiClient);

  Future<void> fetchCategories() async {
    loadingCategories = true;
    categoriesError = null;
    notifyListeners();

    try {
      categories = await _menuApiClient.fetchCategories();
    } catch (e) {
      categoriesError = e.toString();
    } finally {
      loadingCategories = false;
      notifyListeners();
    }
  }

  Future<void> fetchMenus({final bool refresh = false}) async {
    if (loadingMenus) return;
    if (refresh) {
      _menuPage = 1;
      menus.clear();
      hasMoreMenus = true;
    }
    if (!hasMoreMenus) return;

    loadingMenus = true;
    menusError = null;
    notifyListeners();

    try {
      final response = await _menuApiClient.fetchMenus(page: _menuPage);
      menus.addAll(response.data);
      hasMoreMenus = response.page * response.limit < response.total;
      _menuPage++;
    } catch (e) {
      menusError = e.toString();
    } finally {
      loadingMenus = false;
      notifyListeners();
    }
  }

  Future<void> selectCategory(final String? id) async {
    selectedCategoryId = id;
    await fetchMenus(refresh: true);
  }

  void navigateToMenuListScreen(
    final BuildContext context,
    final CategoryModel category,
  ) {
    context.read<AppRouterDelegate>().setRoute(AppRoute.menuList(category));
  }

  void navigateToMenuDetailScreen(final BuildContext context, final String menuId) {
    context.read<AppRouterDelegate>().setRoute(AppRoute.menuDetail(menuId));
  }
}
