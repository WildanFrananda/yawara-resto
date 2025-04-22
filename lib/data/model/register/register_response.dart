import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_response.freezed.dart';
part 'register_response.g.dart';

@freezed
abstract class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    required final String message,
    required final String token,
  }) = _RegisterResponse;

  factory RegisterResponse.fromJson(final Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}
