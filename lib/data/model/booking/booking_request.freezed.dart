// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingRequest {

 String get type; List<MenuItemRequest> get menuItems; String get location; DateTime get schedule;
/// Create a copy of BookingRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingRequestCopyWith<BookingRequest> get copyWith => _$BookingRequestCopyWithImpl<BookingRequest>(this as BookingRequest, _$identity);

  /// Serializes this BookingRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingRequest&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.menuItems, menuItems)&&(identical(other.location, location) || other.location == location)&&(identical(other.schedule, schedule) || other.schedule == schedule));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(menuItems),location,schedule);

@override
String toString() {
  return 'BookingRequest(type: $type, menuItems: $menuItems, location: $location, schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class $BookingRequestCopyWith<$Res>  {
  factory $BookingRequestCopyWith(BookingRequest value, $Res Function(BookingRequest) _then) = _$BookingRequestCopyWithImpl;
@useResult
$Res call({
 String type, List<MenuItemRequest> menuItems, String location, DateTime schedule
});




}
/// @nodoc
class _$BookingRequestCopyWithImpl<$Res>
    implements $BookingRequestCopyWith<$Res> {
  _$BookingRequestCopyWithImpl(this._self, this._then);

  final BookingRequest _self;
  final $Res Function(BookingRequest) _then;

/// Create a copy of BookingRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? menuItems = null,Object? location = null,Object? schedule = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,menuItems: null == menuItems ? _self.menuItems : menuItems // ignore: cast_nullable_to_non_nullable
as List<MenuItemRequest>,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BookingRequest implements BookingRequest {
  const _BookingRequest({required this.type, required final  List<MenuItemRequest> menuItems, required this.location, required this.schedule}): _menuItems = menuItems;
  factory _BookingRequest.fromJson(Map<String, dynamic> json) => _$BookingRequestFromJson(json);

@override final  String type;
 final  List<MenuItemRequest> _menuItems;
@override List<MenuItemRequest> get menuItems {
  if (_menuItems is EqualUnmodifiableListView) return _menuItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_menuItems);
}

@override final  String location;
@override final  DateTime schedule;

/// Create a copy of BookingRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingRequestCopyWith<_BookingRequest> get copyWith => __$BookingRequestCopyWithImpl<_BookingRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingRequest&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._menuItems, _menuItems)&&(identical(other.location, location) || other.location == location)&&(identical(other.schedule, schedule) || other.schedule == schedule));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(_menuItems),location,schedule);

@override
String toString() {
  return 'BookingRequest(type: $type, menuItems: $menuItems, location: $location, schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class _$BookingRequestCopyWith<$Res> implements $BookingRequestCopyWith<$Res> {
  factory _$BookingRequestCopyWith(_BookingRequest value, $Res Function(_BookingRequest) _then) = __$BookingRequestCopyWithImpl;
@override @useResult
$Res call({
 String type, List<MenuItemRequest> menuItems, String location, DateTime schedule
});




}
/// @nodoc
class __$BookingRequestCopyWithImpl<$Res>
    implements _$BookingRequestCopyWith<$Res> {
  __$BookingRequestCopyWithImpl(this._self, this._then);

  final _BookingRequest _self;
  final $Res Function(_BookingRequest) _then;

/// Create a copy of BookingRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? menuItems = null,Object? location = null,Object? schedule = null,}) {
  return _then(_BookingRequest(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,menuItems: null == menuItems ? _self._menuItems : menuItems // ignore: cast_nullable_to_non_nullable
as List<MenuItemRequest>,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
