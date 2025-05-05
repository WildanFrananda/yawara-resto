// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookingRequest _$BookingRequestFromJson(Map<String, dynamic> json) =>
    _BookingRequest(
      type: json['type'] as String,
      menuItems:
          (json['menuItems'] as List<dynamic>)
              .map((e) => MenuItemRequest.fromJson(e as Map<String, dynamic>))
              .toList(),
      location: json['location'] as String,
      schedule: DateTime.parse(json['schedule'] as String),
    );

Map<String, dynamic> _$BookingRequestToJson(_BookingRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'menuItems': instance.menuItems,
      'location': instance.location,
      'schedule': instance.schedule.toIso8601String(),
    };
