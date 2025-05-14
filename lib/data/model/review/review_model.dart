import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@HiveType(typeId: 12)
@freezed
abstract class ReviewModel with _$ReviewModel {
  factory ReviewModel({
    @HiveField(0) required final String id,
    @HiveField(1) required final String user,
    @HiveField(2) required final String menu,
    @HiveField(3) required final String booking,
    @HiveField(4) required final int rating,
    @HiveField(5) final String? comment,
    @HiveField(6) required final DateTime createdAt,
    @HiveField(7) required final DateTime updatedAt,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(final Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}
