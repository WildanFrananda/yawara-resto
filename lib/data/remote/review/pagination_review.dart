import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/data/model/review/review_model.dart';

part 'pagination_review.g.dart';

@JsonSerializable()
class PaginatedReview {
  final List<ReviewModel> data;
  final int total;
  final int page;
  final int limit;

  PaginatedReview({
    required this.data,
    required this.total,
    required this.page,
    required this.limit,
  });

  factory PaginatedReview.fromJson(final Map<String, dynamic> json) =>
      _$PaginatedReviewFromJson(json);
}
