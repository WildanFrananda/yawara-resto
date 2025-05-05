// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookingMenu _$BookingMenuFromJson(Map<String, dynamic> json) => _BookingMenu(
  id: json['id'] as String,
  booking: json['booking'] as String,
  menu: MenuDetail.fromJson(json['menu'] as Map<String, dynamic>),
  quantity: (json['quantity'] as num).toInt(),
  priceAtBooking: (json['priceAtBooking'] as num).toDouble(),
);

Map<String, dynamic> _$BookingMenuToJson(_BookingMenu instance) =>
    <String, dynamic>{
      'id': instance.id,
      'booking': instance.booking,
      'menu': instance.menu,
      'quantity': instance.quantity,
      'priceAtBooking': instance.priceAtBooking,
    };
