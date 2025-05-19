// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedMenu _$PaginatedMenuFromJson(Map<String, dynamic> json) =>
    PaginatedMenu(
      data:
          (json['data'] as List<dynamic>)
              .map((e) => MenuModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$PaginatedMenuToJson(PaginatedMenu instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
    };
