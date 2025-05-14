import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:mobile/data/model/history/history_model.dart';
import 'package:mobile/data/remote/api_client.dart';

class HistoryViewModel extends ChangeNotifier {
  final ApiClient _apiClient;
  final Connectivity _connectivity;
  final Box<HistoryModel> _box = Hive.box('booking_history');

  List<HistoryModel> history = [];
  bool loading = false;
  String? error;

  HistoryViewModel(this._apiClient, this._connectivity) {
    _loadLocal();
    _syncOnStart();
    _connectivity.onConnectivityChanged.listen((status) {
      if (status != ConnectivityResult.none) _syncFromServer();
    });
  }

  void _loadLocal() {
    history = _box.values.toList();
    notifyListeners();
  }

  Future<void> _syncOnStart() => _syncFromServer();

  Future<void> _syncFromServer() async {
    loading = true;
    error = null;
    notifyListeners();

    try {
      final response = await _apiClient.fetchHistory();
      history = response.data;

      await _box.clear();
      for (var h in history) {
        await _box.put(h.id, h);
      }
    } catch (e) {
      error = 'Failed to load history!';
    }

    loading = false;

    notifyListeners();
  }

  Future<void> refresh() async {
    await _syncFromServer();
  }
}
