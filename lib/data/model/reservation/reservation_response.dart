import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/data/model/booking/booking_menu.dart';
import 'package:mobile/data/model/table/table_model.dart';
import 'package:mobile/data/model/transaction/transaction.dart';

part 'reservation_response.freezed.dart';
part 'reservation_response.g.dart';

@freezed
abstract class ReservationResponse with _$ReservationResponse {
  factory ReservationResponse({
    required final String id,
    required final List<Transaction> transactions,
    required final List<BookingMenu> bookingMenus,
    required final String user,
    required final String type,
    required final DateTime schedule,
    required final String status,
    required final TableModel table,
    required final double totalAmount,
    required final DateTime createdAt,
  }) = _ReservationResponse;

  factory ReservationResponse.fromJson(final Map<String, dynamic> json) =>
      _$ReservationResponseFromJson(json);
}
