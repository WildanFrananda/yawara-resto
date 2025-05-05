import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_detail.freezed.dart';
part 'menu_detail.g.dart';

@freezed
abstract class MenuDetail with _$MenuDetail {
  factory MenuDetail({
    required final String id,
    required final String name,
    final String? description,
    required final double price,
    final String? category,
    final bool? isTopWeek,
    final String? status,
    required final String imageUrl,
  }) = _MenuDetail;
  factory MenuDetail.fromJson(final Map<String, dynamic> json) =>
      _$MenuDetailFromJson(json);
}
