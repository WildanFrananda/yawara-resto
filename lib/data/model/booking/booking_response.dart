import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/data/model/booking/booking_menu.dart';
import 'package:mobile/data/model/menu/menu_model.dart';
import 'package:mobile/data/model/transaction/transaction.dart';

part 'booking_response.freezed.dart';
part 'booking_response.g.dart';

@freezed
abstract class BookingResponse with _$BookingResponse {
  factory BookingResponse({
    required final String id,
    required final List<Transaction> transactions,
    required final List<BookingMenu> bookingMenus,
    required final String user,
    required final String type,
    required final DateTime schedule,
    required final String location,
    required final String status,
    required final String chefLocation,
    required final MenuModel menu,
    required final double totalAmount,
    required final DateTime createdAt,
  }) = _BookingResponse;
  factory BookingResponse.fromJson(final Map<String, dynamic> json) =>
      _$BookingResponseFromJson(json);
}
