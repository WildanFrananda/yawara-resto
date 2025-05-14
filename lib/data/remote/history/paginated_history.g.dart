// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedHistory _$PaginatedHistoryFromJson(Map<String, dynamic> json) =>
    PaginatedHistory(
      data:
          (json['data'] as List<dynamic>)
              .map((e) => HistoryModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$PaginatedHistoryToJson(PaginatedHistory instance) =>
    <String, dynamic>{'data': instance.data, 'total': instance.total};
