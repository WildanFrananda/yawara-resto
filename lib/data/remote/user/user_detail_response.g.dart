// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailResponse _$UserDetailResponseFromJson(Map<String, dynamic> json) =>
    UserDetailResponse(
      id: json['id'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      profile: ProfileResponse.fromJson(
        json['profile'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$UserDetailResponseToJson(UserDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'role': instance.role,
      'profile': instance.profile,
    };
