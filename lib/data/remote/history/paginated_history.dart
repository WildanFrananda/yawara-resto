import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/data/model/history/history_model.dart';

part 'paginated_history.g.dart';

@JsonSerializable()
class PaginatedHistory {
  final List<HistoryModel> data;
  final int total;

  PaginatedHistory({required this.data, required this.total});

  factory PaginatedHistory.fromJson(final Map<String, dynamic> json) =>
      _$PaginatedHistoryFromJson(json);
}
