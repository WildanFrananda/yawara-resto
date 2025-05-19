// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuModel _$MenuModelFromJson(Map<String, dynamic> json) => _MenuModel(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  price: _priceFromJson(json['price']),
  category: CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
  isTopWeek: json['isTopWeek'] as bool?,
  status: json['status'] as String?,
  imageUrl: json['imageUrl'] as String,
);

Map<String, dynamic> _$MenuModelToJson(_MenuModel instance) =>
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
