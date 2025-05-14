import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_model.freezed.dart';
part 'menu_model.g.dart';

@freezed
abstract class MenuModel with _$MenuModel {
  factory MenuModel({
    required final String id,
    required final String name,
    final String? description,
    required final double price,
    final String? category,
    final bool? isTopWeek,
    final String? status,
    required final String imageUrl,
  }) = _MenuModel;
  factory MenuModel.fromJson(final Map<String, dynamic> json) =>
      _$MenuModelFromJson(json);
}
