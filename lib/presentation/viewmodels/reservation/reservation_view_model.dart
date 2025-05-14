import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/data/model/booking/menu_item_request.dart';
import 'package:mobile/data/model/reservation/reservation_request.dart';
import 'package:mobile/data/model/reservation/reservation_response.dart';
import 'package:mobile/data/model/table/table_model.dart';
import 'package:mobile/data/remote/booking_api_client.dart';
import 'package:mobile/domain/enums/table_status.dart';

class ReservationViewModel extends ChangeNotifier {
  final BookingApiClient _bookingApiClient;

  List<TableModel> tables = [];
  bool loadingTables = false;
  String? tableError;

  TableModel? selectedTable;
  DateTime? selectedSchedule;
  List<MenuItemRequest> selectedItems = [];

  bool submitting = false;
  String? submitError;
  ReservationResponse? lastReservation;

  final _now = DateTime.now();
  final DateFormat dateFmt = DateFormat('yyyy-MM-dd');
  final DateFormat timeFmt = DateFormat('HH:mm');

  ReservationViewModel(this._bookingApiClient) {
    fetchTables();
  }

  Future<void> fetchTables() async {
    loadingTables = true;
    tableError = null;
    notifyListeners();

    try {
      tables = await _bookingApiClient.fetchTables();
    } catch (e) {
      tableError = e.toString();
    } finally {
      loadingTables = false;
      notifyListeners();
    }
  }

  void pickTable(final TableModel table) {
    if (table.status != TableStatus.available.unit) return;

    selectedTable = table;
    notifyListeners();
  }

  void pickSchedule(final DateTime date, final TimeOfDay time) {
    final dt = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    selectedSchedule = dt;
    notifyListeners();
  }

  String? validateSchedule() {
    if (selectedSchedule == null) return 'Please select a schedule';

    final dt = selectedSchedule!;

    if (dt.isBefore(_now)) return 'Schedule must be in the future';
    if (dt.isAfter(_now.add(const Duration(days: 7)))) {
      return 'Schedule must be within 7 days';
    }
    if (dt.hour < 9 || dt.hour > 21) return 'Schedule must be between 09:00 and 21:00';

    return null;
  }

  Future<void> submit() async {
    submitError = null;
    final scheduleError = validateSchedule();

    if (selectedTable == null) {
      submitError = 'Please select a table';
      notifyListeners();
      return;
    }

    if (scheduleError != null) {
      submitError = scheduleError;
      notifyListeners();
      return;
    }

    if (selectedItems.isEmpty) {
      submitError = 'Please select at least one menu item';
      notifyListeners();
      return;
    }

    submitting = true;
    notifyListeners();

    try {
      lastReservation = await _bookingApiClient.createReservation(
        ReservationRequest(
          type: 'restaurant',
          tableId: selectedTable!.id,
          menuItems: selectedItems,
          schedule: selectedSchedule!,
        ),
      );
      selectedTable = null;
    } catch (e) {
      submitError = e.toString();
    } finally {
      submitting = false;
      notifyListeners();
    }
  }
}
