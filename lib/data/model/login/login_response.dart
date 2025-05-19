import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required final String id,
    required final String email,
    @JsonKey(name: 'access_token') required final String accessToken,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(final Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
