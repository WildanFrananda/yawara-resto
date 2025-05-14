// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryModelAdapter extends TypeAdapter<HistoryModel> {
  @override
  final typeId = 10;

  @override
  HistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryModel(
      id: fields[0] as String,
      type: fields[1] as String,
      schedule: fields[2] as DateTime,
      location: fields[3] as String?,
      status: fields[4] as String,
      totalAmount: (fields[5] as num).toDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, HistoryModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.schedule)
      ..writeByte(3)
      ..write(obj.location)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.totalAmount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryModel _$HistoryModelFromJson(Map<String, dynamic> json) =>
    _HistoryModel(
      id: json['id'] as String,
      type: json['type'] as String,
      schedule: DateTime.parse(json['schedule'] as String),
      location: json['location'] as String?,
      status: json['status'] as String,
      totalAmount: (json['totalAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$HistoryModelToJson(_HistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'schedule': instance.schedule.toIso8601String(),
      'location': instance.location,
      'status': instance.status,
      'totalAmount': instance.totalAmount,
    };
