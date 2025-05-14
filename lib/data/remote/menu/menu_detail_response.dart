import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/data/model/category/category_model.dart';
import 'package:mobile/data/model/review/review_model.dart';

part 'menu_detail_response.g.dart';

@JsonSerializable()
class MenuDetailResponse {
  final String id, name, description, status, imageUrl;
  final double price;
  final CategoryModel category;
  final bool isTopWeek;
  final double rating;
  final List<ReviewModel> reviews;

  MenuDetailResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.isTopWeek,
    required this.status,
    required this.imageUrl,
    required this.rating,
    required this.reviews,
  });

  factory MenuDetailResponse.fromJson(final Map<String, dynamic> json) =>
      _$MenuDetailResponseFromJson(json);
}
