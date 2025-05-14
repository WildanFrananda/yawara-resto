// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_draft.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderDraftAdapter extends TypeAdapter<OrderDraft> {
  @override
  final typeId = 20;

  @override
  OrderDraft read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderDraft(
      id: fields[0] as String,
      items: (fields[1] as List).cast<MenuItemRequest>(),
      location: fields[2] as String,
      schedule: fields[3] as DateTime,
      savedAt: fields[4] as DateTime,
      retryCount: fields[5] == null ? 0 : (fields[5] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, OrderDraft obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.items)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.schedule)
      ..writeByte(4)
      ..write(obj.savedAt)
      ..writeByte(5)
      ..write(obj.retryCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderDraftAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderDraft _$OrderDraftFromJson(Map<String, dynamic> json) => _OrderDraft(
  id: json['id'] as String,
  items:
      (json['items'] as List<dynamic>)
          .map((e) => MenuItemRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
  location: json['location'] as String,
  schedule: DateTime.parse(json['schedule'] as String),
  savedAt: DateTime.parse(json['savedAt'] as String),
  retryCount: (json['retryCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$OrderDraftToJson(_OrderDraft instance) =>
    <String, dynamic>{
      'id': instance.id,
      'items': instance.items,
      'location': instance.location,
      'schedule': instance.schedule.toIso8601String(),
      'savedAt': instance.savedAt.toIso8601String(),
      'retryCount': instance.retryCount,
    };
