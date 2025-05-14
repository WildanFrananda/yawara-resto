import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:mobile/data/model/review/review_model.dart';
import 'package:mobile/data/remote/menu/menu_api_client.dart';

class ReviewManagementViewModel extends ChangeNotifier {
  final MenuApiClient _api;
  final Box<ReviewModel> _box = Hive.box('reviews');
  final Connectivity _connectivity;

  List<ReviewModel> reviews = [];
  bool loading = false;
  String? error;

  ReviewManagementViewModel(this._api, this._connectivity) {
    _loadLocal();
    _syncOnStart();
    _connectivity.onConnectivityChanged.listen((final stat) {
      if (stat != ConnectivityResult.none) _syncFromServer();
    });
  }

  void _loadLocal() {
    reviews = _box.values.toList();
    notifyListeners();
  }

  Future<void> _syncOnStart() async => _syncFromServer();

  Future<void> _syncFromServer() async {
    loading = true;
    error = null;
    notifyListeners();
    try {
      // For demo, fetch reviews for each local menuId, but real API may differ
      final all = <ReviewModel>[];
      for (var r in _box.values) {
        final fresh = await _api.fetchUserReviews(r.menu);
        all.addAll(fresh.where((final x) => x.user == r.user));
      }
      reviews = all;
      await _box.clear();
      for (var r in reviews) {
        await _box.put(r.id, r);
      }
    } catch (e) {
      error = 'Failed to load reviews!';
    }
    loading = false;
    notifyListeners();
  }

  Future<void> refresh() async => _syncFromServer();

  Future<void> deleteReview(final String id) async {
    try {
      await _api.deleteReview(id);
      await _box.delete(id);
      reviews = _box.values.toList();
      notifyListeners();
    } catch (_) {
      // handle error
    }
  }

  Future<void> updateReview(
    final String id,
    final int rating,
    final String? comment,
  ) async {
    try {
      final updated = await _api.updateReview(id, {'rating': rating, 'comment': comment});
      await _box.put(id, updated);
      reviews = _box.values.toList();
      notifyListeners();
    } catch (_) {}
  }
}
