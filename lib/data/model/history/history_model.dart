import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

part 'history_model.freezed.dart';
part 'history_model.g.dart';

@HiveType(typeId: 10)
@freezed
abstract class HistoryModel with _$HistoryModel {
  factory HistoryModel({
    @HiveField(0) required final String id,
    @HiveField(1) required final String type,
    @HiveField(2) required final DateTime schedule,
    @HiveField(3) final String? location,
    @HiveField(4) required final String status,
    @HiveField(5) required final double totalAmount,
  }) = _HistoryModel;

  factory HistoryModel.fromJson(final Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);
}
