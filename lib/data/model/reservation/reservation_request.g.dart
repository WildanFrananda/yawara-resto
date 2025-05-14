// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReservationRequest _$ReservationRequestFromJson(Map<String, dynamic> json) =>
    _ReservationRequest(
      type: json['type'] as String,
      tableId: json['tableId'] as String,
      menuItems:
          (json['menuItems'] as List<dynamic>)
              .map((e) => MenuItemRequest.fromJson(e as Map<String, dynamic>))
              .toList(),
      schedule: DateTime.parse(json['schedule'] as String),
    );

Map<String, dynamic> _$ReservationRequestToJson(_ReservationRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'tableId': instance.tableId,
      'menuItems': instance.menuItems,
      'schedule': instance.schedule.toIso8601String(),
    };
