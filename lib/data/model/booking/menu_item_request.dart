import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item_request.freezed.dart';
part 'menu_item_request.g.dart';

@freezed
abstract class MenuItemRequest with _$MenuItemRequest {
  const factory MenuItemRequest({
    required final String menuId,
    required final int quantity,
  }) = _MenuItemRequest;

  factory MenuItemRequest.fromJson(final Map<String, dynamic> json) =>
      _$MenuItemRequestFromJson(json);
}
