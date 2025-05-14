import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  final String userId, name, imageUrl;
  final Map<String, dynamic> address;
  final double walletBallance;
  final DateTime updateAt;

  ProfileResponse({
    required this.userId,
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.walletBallance,
    required this.updateAt,
  });

  factory ProfileResponse.fromJson(final Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}
