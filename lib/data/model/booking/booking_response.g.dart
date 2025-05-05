// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookingResponse _$BookingResponseFromJson(Map<String, dynamic> json) =>
    _BookingResponse(
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
      location: json['location'] as String,
      status: json['status'] as String,
      chefLocation: json['chefLocation'] as String,
      menu: MenuDetail.fromJson(json['menu'] as Map<String, dynamic>),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$BookingResponseToJson(_BookingResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transactions': instance.transactions,
      'bookingMenus': instance.bookingMenus,
      'user': instance.user,
      'type': instance.type,
      'schedule': instance.schedule.toIso8601String(),
      'location': instance.location,
      'status': instance.status,
      'chefLocation': instance.chefLocation,
      'menu': instance.menu,
      'totalAmount': instance.totalAmount,
      'createdAt': instance.createdAt.toIso8601String(),
    };
