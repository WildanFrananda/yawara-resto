// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TableModel _$TableModelFromJson(Map<String, dynamic> json) => _TableModel(
  id: json['id'] as String,
  tableNumber: json['tableNumber'] as String,
  capacity: (json['capacity'] as num).toInt(),
  status: $enumDecode(_$TableStatusEnumMap, json['status']),
);

Map<String, dynamic> _$TableModelToJson(_TableModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tableNumber': instance.tableNumber,
      'capacity': instance.capacity,
      'status': _$TableStatusEnumMap[instance.status]!,
    };

const _$TableStatusEnumMap = {
  TableStatus.available: 'available',
  TableStatus.reserved: 'reserved',
};
