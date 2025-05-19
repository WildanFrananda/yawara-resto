import 'package:freezed_annotation/freezed_annotation.dart';

import '../category/category_model.dart';

part 'menu_model.freezed.dart';
part 'menu_model.g.dart';

double _priceFromJson(final dynamic value) {
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  throw FormatException('Cannot parse price from $value');
}

@Freezed(toJson: true)
abstract class MenuModel with _$MenuModel {
  factory MenuModel({
    required final String id,
    required final String name,
    final String? description,
    @JsonKey(fromJson: _priceFromJson) required final double price,
    required final CategoryModel category,
    final bool? isTopWeek,
    final String? status,
    required final String imageUrl,
  }) = _MenuModel;
  factory MenuModel.fromJson(final Map<String, dynamic> json) =>
      _$MenuModelFromJson(json);
}
