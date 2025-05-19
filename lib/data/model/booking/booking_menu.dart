import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/data/model/menu/menu_model.dart';

part 'booking_menu.freezed.dart';
part 'booking_menu.g.dart';

@Freezed(toJson: true)
abstract class BookingMenu with _$BookingMenu {
  factory BookingMenu({
    required final String id,
    required final String booking,
    required final MenuModel menu,
    required final int quantity,
    required final double priceAtBooking,
  }) = _BookingMenu;
  factory BookingMenu.fromJson(final Map<String, dynamic> json) =>
      _$BookingMenuFromJson(json);
}
