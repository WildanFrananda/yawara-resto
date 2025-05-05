import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/data/model/booking/menu_item_request.dart';

part 'booking_request.freezed.dart';
part 'booking_request.g.dart';

@freezed
abstract class BookingRequest with _$BookingRequest {
  const factory BookingRequest({
    required final String type,
    required final List<MenuItemRequest> menuItems,
    required final String location,
    required final DateTime schedule,
  }) = _BookingRequest;

  factory BookingRequest.fromJson(final Map<String, dynamic> json) =>
      _$BookingRequestFromJson(json);
}
