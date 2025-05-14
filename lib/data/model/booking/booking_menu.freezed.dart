// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingMenu {

 String get id; String get booking; MenuModel get menu; int get quantity; double get priceAtBooking;
/// Create a copy of BookingMenu
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingMenuCopyWith<BookingMenu> get copyWith => _$BookingMenuCopyWithImpl<BookingMenu>(this as BookingMenu, _$identity);

  /// Serializes this BookingMenu to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingMenu&&(identical(other.id, id) || other.id == id)&&(identical(other.booking, booking) || other.booking == booking)&&(identical(other.menu, menu) || other.menu == menu)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.priceAtBooking, priceAtBooking) || other.priceAtBooking == priceAtBooking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,booking,menu,quantity,priceAtBooking);

@override
String toString() {
  return 'BookingMenu(id: $id, booking: $booking, menu: $menu, quantity: $quantity, priceAtBooking: $priceAtBooking)';
}


}

/// @nodoc
abstract mixin class $BookingMenuCopyWith<$Res>  {
  factory $BookingMenuCopyWith(BookingMenu value, $Res Function(BookingMenu) _then) = _$BookingMenuCopyWithImpl;
@useResult
$Res call({
 String id, String booking, MenuModel menu, int quantity, double priceAtBooking
});


$MenuModelCopyWith<$Res> get menu;

}
/// @nodoc
class _$BookingMenuCopyWithImpl<$Res>
    implements $BookingMenuCopyWith<$Res> {
  _$BookingMenuCopyWithImpl(this._self, this._then);

  final BookingMenu _self;
  final $Res Function(BookingMenu) _then;

/// Create a copy of BookingMenu
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? booking = null,Object? menu = null,Object? quantity = null,Object? priceAtBooking = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,booking: null == booking ? _self.booking : booking // ignore: cast_nullable_to_non_nullable
as String,menu: null == menu ? _self.menu : menu // ignore: cast_nullable_to_non_nullable
as MenuModel,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,priceAtBooking: null == priceAtBooking ? _self.priceAtBooking : priceAtBooking // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of BookingMenu
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuModelCopyWith<$Res> get menu {
  
  return $MenuModelCopyWith<$Res>(_self.menu, (value) {
    return _then(_self.copyWith(menu: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _BookingMenu implements BookingMenu {
   _BookingMenu({required this.id, required this.booking, required this.menu, required this.quantity, required this.priceAtBooking});
  factory _BookingMenu.fromJson(Map<String, dynamic> json) => _$BookingMenuFromJson(json);

@override final  String id;
@override final  String booking;
@override final  MenuModel menu;
@override final  int quantity;
@override final  double priceAtBooking;

/// Create a copy of BookingMenu
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingMenuCopyWith<_BookingMenu> get copyWith => __$BookingMenuCopyWithImpl<_BookingMenu>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingMenuToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingMenu&&(identical(other.id, id) || other.id == id)&&(identical(other.booking, booking) || other.booking == booking)&&(identical(other.menu, menu) || other.menu == menu)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.priceAtBooking, priceAtBooking) || other.priceAtBooking == priceAtBooking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,booking,menu,quantity,priceAtBooking);

@override
String toString() {
  return 'BookingMenu(id: $id, booking: $booking, menu: $menu, quantity: $quantity, priceAtBooking: $priceAtBooking)';
}


}

/// @nodoc
abstract mixin class _$BookingMenuCopyWith<$Res> implements $BookingMenuCopyWith<$Res> {
  factory _$BookingMenuCopyWith(_BookingMenu value, $Res Function(_BookingMenu) _then) = __$BookingMenuCopyWithImpl;
@override @useResult
$Res call({
 String id, String booking, MenuModel menu, int quantity, double priceAtBooking
});


@override $MenuModelCopyWith<$Res> get menu;

}
/// @nodoc
class __$BookingMenuCopyWithImpl<$Res>
    implements _$BookingMenuCopyWith<$Res> {
  __$BookingMenuCopyWithImpl(this._self, this._then);

  final _BookingMenu _self;
  final $Res Function(_BookingMenu) _then;

/// Create a copy of BookingMenu
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? booking = null,Object? menu = null,Object? quantity = null,Object? priceAtBooking = null,}) {
  return _then(_BookingMenu(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,booking: null == booking ? _self.booking : booking // ignore: cast_nullable_to_non_nullable
as String,menu: null == menu ? _self.menu : menu // ignore: cast_nullable_to_non_nullable
as MenuModel,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,priceAtBooking: null == priceAtBooking ? _self.priceAtBooking : priceAtBooking // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of BookingMenu
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuModelCopyWith<$Res> get menu {
  
  return $MenuModelCopyWith<$Res>(_self.menu, (value) {
    return _then(_self.copyWith(menu: value));
  });
}
}

// dart format on
