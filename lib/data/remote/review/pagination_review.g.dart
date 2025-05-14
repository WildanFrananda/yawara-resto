// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedReview _$PaginatedReviewFromJson(Map<String, dynamic> json) =>
    PaginatedReview(
      data:
          (json['data'] as List<dynamic>)
              .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$PaginatedReviewToJson(PaginatedReview instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
    };
