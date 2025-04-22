import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required final String id,
    required final String name,
    required final String email,
    required final String? phone,
    required final String? address,
    required final String? avatarUrl,
  }) = _User;

  factory User.fromJson(final Map<String, Object?> json) => _$UserFromJson(json);
}
