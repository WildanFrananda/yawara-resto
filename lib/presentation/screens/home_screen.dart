import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/utils/menu_cache_manager.dart';
import 'package:mobile/data/model/booking/menu_item_request.dart';
import 'package:mobile/presentation/viewmodels/home/home_view_model.dart';
import 'package:mobile/presentation/widgets/shared/resto_app_bar.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomeScreen({super.key, required this.viewModel});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: const RestoAppBar(title: 'Home dine in'),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (final BuildContext context, final Widget? child) {
          final scaffold = ScaffoldMessenger.of(context);

          return Column(
            children: [
              if (!viewModel.online)
                const ColoredBox(color: Colors.red, child: Text('offline')),
              Expanded(
                child:
                    viewModel.loadingMenus
                        ? const Center(child: CircularProgressIndicator())
                        : viewModel.menuError != null
                        ? Center(child: Text(viewModel.menuError!))
                        : ListView.builder(
                          itemCount: viewModel.menus.length,
                          itemBuilder: (_, final i) {
                            final menu = viewModel.menus[i];
                            return ListTile(
                              leading: CachedNetworkImage(
                                imageUrl: menu.imageUrl,
                                width: 50,
                                height: 50,
                                cacheManager: MenuCacheManager(),
                              ),
                              title: Text(menu.name),
                              subtitle: Text(menu.price.toString()),
                              onTap: () {
                                // add to cart from viewModel
                              },
                            );
                          },
                        ),
              ),
              ElevatedButton(
                onPressed:
                    viewModel.bookingLoading
                        ? null
                        : () async {
                          // hardcoded example items and location, in the future change to use form
                          await viewModel.createBooking(
                            items:
                                viewModel.menus
                                    .take(2)
                                    .map(
                                      (final e) =>
                                          MenuItemRequest(menuId: e.id, quantity: 1),
                                    )
                                    .toList(),
                            location: 'Jl. Example No. 123, Jakarta',
                            schedule: DateTime.now().add(const Duration(hours: 1)),
                          );
                          if (viewModel.bookingError != null) {
                            scaffold.showSnackBar(
                              SnackBar(content: Text(viewModel.bookingError!)),
                            );
                          } else {
                            scaffold.showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Booking created, status: ${viewModel.paymentStatus}',
                                ),
                              ),
                            );
                          }
                        },
                child:
                    viewModel.bookingLoading
                        ? const CircularProgressIndicator()
                        : const Text('Book Now'),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<HomeViewModel>('viewModel', viewModel));
  }
}
