import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request.freezed.dart';
part 'register_request.g.dart';

@freezed
abstract class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required final String name,
    required final String email,
    required final String password,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(final Map<String, Object?> json) =>
      _$RegisterRequestFromJson(json);
}
