// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReservationResponse _$ReservationResponseFromJson(Map<String, dynamic> json) =>
    _ReservationResponse(
      id: json['id'] as String,
      transactions:
          (json['transactions'] as List<dynamic>)
              .map((e) => Transaction.fromJson(e as Map<String, dynamic>))
              .toList(),
      bookingMenus:
          (json['bookingMenus'] as List<dynamic>)
              .map((e) => BookingMenu.fromJson(e as Map<String, dynamic>))
              .toList(),
      user: json['user'] as String,
      type: json['type'] as String,
      schedule: DateTime.parse(json['schedule'] as String),
      status: json['status'] as String,
      table: TableModel.fromJson(json['table'] as Map<String, dynamic>),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ReservationResponseToJson(
  _ReservationResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'transactions': instance.transactions,
  'bookingMenus': instance.bookingMenus,
  'user': instance.user,
  'type': instance.type,
  'schedule': instance.schedule.toIso8601String(),
  'status': instance.status,
  'table': instance.table,
  'totalAmount': instance.totalAmount,
  'createdAt': instance.createdAt.toIso8601String(),
};
