import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/utils/menu_cache_manager.dart';
import 'package:mobile/data/model/category/category_model.dart';
import 'package:mobile/presentation/viewmodels/menu/menu_view_model.dart';
import 'package:mobile/presentation/widgets/shared/resto_app_bar.dart';
import 'package:provider/provider.dart';

class MenuListScreen extends StatelessWidget {
  final CategoryModel category;

  const MenuListScreen({super.key, required this.category});

  @override
  Widget build(final BuildContext context) {
    final viewModel = context.watch<MenuViewModel>();
    return Scaffold(
      appBar: RestoAppBar(title: category.name),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (final BuildContext context, final Widget? child) {
          return NotificationListener<ScrollNotification>(
            onNotification: (final notif) {
              if (notif.metrics.pixels >= notif.metrics.maxScrollExtent - 200) {
                viewModel.fetchMenus();
              }

              return false;
            },
            child: ListView.builder(
              itemBuilder: (_, final i) {
                if (i == viewModel.menus.length + 1) {
                  return viewModel.loadingMenus
                      ? const Center(child: CircularProgressIndicator())
                      : const SizedBox.shrink();
                }

                final m = viewModel.menus[i];

                return ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: m.imageUrl,
                    width: 50,
                    height: 50,
                    cacheManager: MenuCacheManager(),
                  ),
                  title: Text(m.name),
                  subtitle: Text('\$${m.price}'),
                  onTap: () => viewModel.navigateToMenuDetailScreen(context, m.id),
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<CategoryModel?>('category', category));
  }
}
