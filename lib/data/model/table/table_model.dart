import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/domain/enums/table_status.dart';

part 'table_model.freezed.dart';
part 'table_model.g.dart';

@freezed
abstract class TableModel with _$TableModel {
  factory TableModel({
    required final String id,
    required final String tableNumber,
    required final int capacity,
    required final TableStatus status,
  }) = _TableModel;

  factory TableModel.fromJson(final Map<String, dynamic> json) =>
      _$TableModelFromJson(json);
}
