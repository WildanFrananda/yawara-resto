import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required final String id,
    required final String name,
    final String? description,
    required final String imageUrl,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(final Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
