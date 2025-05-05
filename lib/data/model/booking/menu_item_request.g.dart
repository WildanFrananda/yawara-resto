// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuItemRequest _$MenuItemRequestFromJson(Map<String, dynamic> json) =>
    _MenuItemRequest(
      menuId: json['menuId'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$MenuItemRequestToJson(_MenuItemRequest instance) =>
    <String, dynamic>{'menuId': instance.menuId, 'quantity': instance.quantity};
