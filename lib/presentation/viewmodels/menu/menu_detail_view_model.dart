import 'package:flutter/material.dart';
import 'package:mobile/data/model/review/review_model.dart';
import 'package:mobile/data/remote/menu/menu_api_client.dart';
import 'package:mobile/data/remote/menu/menu_detail_response.dart';

class MenuDetailViewModel extends ChangeNotifier {
  final MenuApiClient _menuApiClient;

  MenuDetailResponse? menu;
  bool loadingDetail = false;
  String? detailError;

  List<ReviewModel> reviews = [];
  int _reviewPage = 1;
  bool loadingReviews = false;
  bool hasMoreReviews = true;
  String? reviewsError;

  MenuDetailViewModel(this._menuApiClient);

  Future<void> loadDetail(final String id) async {
    loadingDetail = true;
    detailError = null;
    notifyListeners();

    try {
      menu = await _menuApiClient.fetchMenuDetail(id);
    } catch (e) {
      detailError = e.toString();
    } finally {
      loadingDetail = false;
      notifyListeners();
    }
  }

  Future<void> fetchReview({final bool refresh = false}) async {
    if (loadingReviews) return;
    if (refresh) {
      _reviewPage = 1;
      reviews.clear();
      hasMoreReviews = true;
    }
    if (!hasMoreReviews) return;
    loadingReviews = true;
    reviewsError = null;
    notifyListeners();

    try {
      final response = await _menuApiClient.fetchReviews(id: menu!.id, page: _reviewPage);
      reviews.addAll(response.data);
      hasMoreReviews = response.page * response.limit < response.total;
      _reviewPage++;
    } catch (e) {
      reviewsError = e.toString();
    } finally {
      loadingReviews = false;
      notifyListeners();
    }
  }

  Future<void> submitReview(final int rating, final String? comment) async {
    try {
      final newReview = await _menuApiClient.submitReview({
        'bookingId': '', // assume from last booking context
        'menuId': menu!.id,
        'rating': rating,
        'comment': comment,
      });
      reviews.insert(0, newReview);
    } catch (e) {
      reviewsError = e.toString();
    } finally {
      loadingReviews = false;
      notifyListeners();
    }
  }
}
