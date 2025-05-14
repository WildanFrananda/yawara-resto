import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/utils/menu_cache_manager.dart';
import 'package:mobile/presentation/viewmodels/menu/menu_detail_view_model.dart';
import 'package:mobile/presentation/widgets/shared/resto_app_bar.dart';
import 'package:provider/provider.dart';

class MenuDetailScreen extends StatefulWidget {
  final String menuId;

  const MenuDetailScreen({super.key, required this.menuId});

  @override
  State<MenuDetailScreen> createState() => _MenuDetailScreenState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('menuId', menuId));
  }
}

class _MenuDetailScreenState extends State<MenuDetailScreen> {
  @override
  void initState() {
    super.initState();
    final viewModel = context.watch<MenuDetailViewModel>();
    viewModel.loadDetail(widget.menuId).then((_) => viewModel.fetchReview());
  }

  @override
  Widget build(final BuildContext context) {
    final viewModel = context.watch<MenuDetailViewModel>();
    return Scaffold(
      appBar: RestoAppBar(title: viewModel.menu?.name ?? 'Menu Detail'),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (final BuildContext context, final Widget? child) {
          return viewModel.loadingDetail
              ? const Center(child: CircularProgressIndicator())
              : viewModel.detailError != null
              ? Center(child: Text(viewModel.detailError!))
              : ListView(
                children: [
                  CachedNetworkImage(
                    imageUrl: viewModel.menu!.imageUrl,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    cacheManager: MenuCacheManager(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewModel.menu!.name,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text('\$${viewModel.menu!.price}'),
                        Text(viewModel.menu!.description ?? ''),
                        const SizedBox(height: 8),
                        Text('Rating: ${viewModel.menu!.rating}'),
                        const Divider(),
                        const Text('Reviews', style: TextStyle(fontSize: 18)),
                        ...viewModel.reviews.map(
                          (final r) => ListTile(
                            title: Text('Rating: ${r.rating}'),
                            subtitle: Text(r.comment ?? ''),
                          ),
                        ),
                        if (viewModel.loadingReviews)
                          const Center(child: CircularProgressIndicator())
                        else if (viewModel.hasMoreReviews)
                          TextButton(
                            onPressed: viewModel.fetchReview,
                            child: const Text('Load more'),
                          ),
                      ],
                    ),
                  ),
                ],
              );
        },
      ),
    );
  }
}
