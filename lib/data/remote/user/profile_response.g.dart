// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      userId: json['userId'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      address: json['address'] as Map<String, dynamic>,
      walletBallance: (json['walletBallance'] as num).toDouble(),
      updateAt: DateTime.parse(json['updateAt'] as String),
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'address': instance.address,
      'walletBallance': instance.walletBallance,
      'updateAt': instance.updateAt.toIso8601String(),
    };
