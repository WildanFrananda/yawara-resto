import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/data/model/user/user.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required final String accessToken,
    required final String refreshToken,
    required final User user,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(final Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
