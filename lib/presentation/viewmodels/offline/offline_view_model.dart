import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/data/model/booking/booking_request.dart';
import 'package:mobile/data/model/booking/menu_item_request.dart';
import 'package:mobile/data/model/order/order_draft.dart';
import 'package:mobile/data/remote/booking_api_client.dart';

@injectable
class OfflineViewModel extends ChangeNotifier {
  final Box<OrderDraft> _draftBox = Hive.box('order_drafts');
  final BookingApiClient _api;
  final Connectivity _conn;

  List<OrderDraft> drafts = [];
  bool syncing = false;

  OfflineViewModel(this._api, this._conn) {
    _loadDrafts();
    _trySync();
    _conn.onConnectivityChanged.listen((final status) {
      if (status != ConnectivityResult.none) _trySync();
    });
  }

  void _loadDrafts() {
    drafts = _draftBox.values.toList();
    notifyListeners();
  }

  Future<void> saveDraft({
    required final List<MenuItemRequest> items,
    required final String location,
    required final DateTime schedule,
  }) async {
    final draft = OrderDraft(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      items: items,
      location: location,
      schedule: schedule,
      savedAt: DateTime.now(),
    );
    await _draftBox.put(draft.id, draft);
    _loadDrafts();
  }

  Future<void> deleteDraft(final String id) async {
    await _draftBox.delete(id);
    _loadDrafts();
  }

  Future<void> _trySync() async {
    if (syncing || drafts.isEmpty) return;
    syncing = true;
    notifyListeners();

    for (var draft in List<OrderDraft>.from(drafts)) {
      if (draft.retryCount >= 3) {
        // drop after 3 retries
        await deleteDraft(draft.id);
        continue;
      }
      try {
        await _api.createBooking(
          BookingRequest(
            type: 'home dine in',
            menuItems: draft.items,
            location: draft.location,
            schedule: draft.schedule,
          ),
        );
        // success → remove draft
        await deleteDraft(draft.id);
      } catch (_) {
        // increment retryCount
        final updated = draft.copyWith(retryCount: draft.retryCount + 1);
        await _draftBox.put(draft.id, updated);
      }
    }

    syncing = false;
    _loadDrafts();
  }

  Future<void> manualSync() async => _trySync();
}
