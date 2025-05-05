// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuDetail _$MenuDetailFromJson(Map<String, dynamic> json) => _MenuDetail(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  price: (json['price'] as num).toDouble(),
  category: json['category'] as String?,
  isTopWeek: json['isTopWeek'] as bool?,
  status: json['status'] as String?,
  imageUrl: json['imageUrl'] as String,
);

Map<String, dynamic> _$MenuDetailToJson(_MenuDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'category': instance.category,
      'isTopWeek': instance.isTopWeek,
      'status': instance.status,
      'imageUrl': instance.imageUrl,
    };
