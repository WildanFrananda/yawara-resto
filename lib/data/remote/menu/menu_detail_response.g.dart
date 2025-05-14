// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuDetailResponse _$MenuDetailResponseFromJson(Map<String, dynamic> json) =>
    MenuDetailResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      category: CategoryModel.fromJson(
        json['category'] as Map<String, dynamic>,
      ),
      isTopWeek: json['isTopWeek'] as bool,
      status: json['status'] as String,
      imageUrl: json['imageUrl'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviews:
          (json['reviews'] as List<dynamic>)
              .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$MenuDetailResponseToJson(MenuDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'status': instance.status,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'category': instance.category,
      'isTopWeek': instance.isTopWeek,
      'rating': instance.rating,
      'reviews': instance.reviews,
    };
