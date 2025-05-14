import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/data/remote/user/profile_response.dart';

part 'user_detail_response.g.dart';

@JsonSerializable()
class UserDetailResponse {
  final String id, email, role;
  final ProfileResponse profile;

  UserDetailResponse({
    required this.id,
    required this.email,
    required this.role,
    required this.profile,
  });

  factory UserDetailResponse.fromJson(final Map<String, dynamic> json) =>
      _$UserDetailResponseFromJson(json);
}
