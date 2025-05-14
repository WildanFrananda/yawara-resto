import 'package:flutter/material.dart';
import 'package:mobile/presentation/viewmodels/address/address_view_model.dart';
import 'package:mobile/presentation/viewmodels/history/history_view_model.dart';
import 'package:mobile/presentation/viewmodels/review/review_management.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(final BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile & History'),
          bottom: const TabBar(
            tabs: [Tab(text: 'History'), Tab(text: 'Addresses'), Tab(text: 'My Reviews')],
          ),
        ),
        body: TabBarView(
          children: [
            // History Tab
            Consumer<HistoryViewModel>(
              builder: (_, final vm, final __) {
                return RefreshIndicator(
                  onRefresh: vm.refresh,
                  child:
                      vm.loading
                          ? const Center(child: CircularProgressIndicator())
                          : vm.error != null
                          ? Center(child: Text(vm.error!))
                          : ListView(
                            children:
                                vm.history
                                    .map(
                                      (final h) => ListTile(
                                        title: Text('${h.type} - ${h.status}'),
                                        subtitle: Text(
                                          '${h.schedule.toLocal()} - \$${h.totalAmount}',
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                );
              },
            ),
            // Addresses Tab
            Consumer<AddressViewModel>(
              builder: (_, final vm, final __) {
                return ListView(
                  children: [
                    ...vm.addresses.map(
                      (final a) => ListTile(
                        title: Text(a.label),
                        subtitle: Text(a.street),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => vm.delete(a.id),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.add),
                      title: const Text('Add Address'),
                      onTap: () {
                        // show dialog to add
                      },
                    ),
                  ],
                );
              },
            ),
            // Reviews Tab
            Consumer<ReviewManagementViewModel>(
              builder: (_, final vm, final __) {
                return RefreshIndicator(
                  onRefresh: vm.refresh,
                  child:
                      vm.loading
                          ? const Center(child: CircularProgressIndicator())
                          : vm.error != null
                          ? Center(child: Text(vm.error!))
                          : ListView(
                            children:
                                vm.reviews
                                    .map(
                                      (final r) => ListTile(
                                        title: Text('Rating: ${r.rating}'),
                                        subtitle: Text(r.comment ?? ''),
                                        trailing: PopupMenuButton(
                                          onSelected: (final v) {
                                            if (v == 'edit') {
                                              // show edit dialog
                                            } else {
                                              vm.deleteReview(r.id);
                                            }
                                          },
                                          itemBuilder:
                                              (_) => const [
                                                PopupMenuItem(
                                                  value: 'edit',
                                                  child: Text('Edit'),
                                                ),
                                                PopupMenuItem(
                                                  value: 'delete',
                                                  child: Text('Delete'),
                                                ),
                                              ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
