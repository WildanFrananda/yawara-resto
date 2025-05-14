import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/model/booking/menu_item_request.dart';
import 'package:mobile/domain/enums/table_status.dart';
import 'package:mobile/presentation/viewmodels/reservation/reservation_view_model.dart';
import 'package:mobile/presentation/widgets/shared/resto_app_bar.dart';

class ReservationScreen extends StatelessWidget {
  final ReservationViewModel viewModel;

  const ReservationScreen({super.key, required this.viewModel});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: const RestoAppBar(title: 'Reservation'),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (final BuildContext context, final Widget? child) {
          return viewModel.loadingTables
              ? const Center(child: CircularProgressIndicator())
              : viewModel.tableError != null
              ? Center(child: Text(viewModel.tableError!))
              : Column(
                children: [
                  ListTile(
                    title: const Text('Booking Schedule'),
                    subtitle: Text(
                      viewModel.selectedSchedule != null
                          ? '${viewModel.dateFmt.format(viewModel.selectedSchedule!)} ${viewModel.timeFmt.format(viewModel.selectedSchedule!)}'
                          : 'Select a schedule',
                    ),
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 7)),
                      );

                      if (date == null) return;

                      final time = await showTimePicker(
                        context: context,
                        initialTime: const TimeOfDay(hour: 9, minute: 0),
                      );

                      if (time == null) return;
                      viewModel.pickSchedule(date, time);
                    },
                  ),
                  TextButton(
                    onPressed:
                        viewModel.submitting
                            ? null
                            : () async {
                              // dummy data
                              viewModel.selectedItems = [
                                MenuItemRequest(
                                  menuId: viewModel.tables.first.id,
                                  quantity: 2,
                                ),
                              ];
                            },
                    child: const Text('Select Menu'),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(8),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: viewModel.tables.length,
                      itemBuilder: (_, final i) {
                        final t = viewModel.tables[i];
                        final selected = viewModel.selectedTable == t;

                        return GestureDetector(
                          onTap: () => viewModel.pickTable(t),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:
                                    selected
                                        ? Colors.blue
                                        : t.status == TableStatus.available.unit
                                        ? Colors.green
                                        : Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(t.tableNumber),
                                Text('(${t.capacity} pax)'),
                                Text(t.status.toString().split('.').last),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed:
                        viewModel.submitting
                            ? null
                            : () {
                              viewModel.submit();
                              if (viewModel.submitError != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(viewModel.submitError!)),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Reservation Success!')),
                                );
                              }
                            },
                    child:
                        viewModel.submitting
                            ? const CircularProgressIndicator()
                            : const Text('Submit Reservation'),
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
    properties.add(DiagnosticsProperty<ReservationViewModel>('viewModel', viewModel));
  }
}
