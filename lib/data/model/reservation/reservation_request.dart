import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/data/model/booking/menu_item_request.dart';

part 'reservation_request.freezed.dart';
part 'reservation_request.g.dart';

@freezed
abstract class ReservationRequest with _$ReservationRequest {
  factory ReservationRequest({
    required final String type,
    required final String tableId,
    required final List<MenuItemRequest> menuItems,
    required final DateTime schedule,
  }) = _ReservationRequest;

  factory ReservationRequest.fromJson(final Map<String, dynamic> json) =>
      _$ReservationRequestFromJson(json);
}
