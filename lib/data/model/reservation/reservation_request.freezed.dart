// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReservationRequest {

 String get type; String get tableId; List<MenuItemRequest> get menuItems; DateTime get schedule;
/// Create a copy of ReservationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationRequestCopyWith<ReservationRequest> get copyWith => _$ReservationRequestCopyWithImpl<ReservationRequest>(this as ReservationRequest, _$identity);

  /// Serializes this ReservationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReservationRequest&&(identical(other.type, type) || other.type == type)&&(identical(other.tableId, tableId) || other.tableId == tableId)&&const DeepCollectionEquality().equals(other.menuItems, menuItems)&&(identical(other.schedule, schedule) || other.schedule == schedule));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,tableId,const DeepCollectionEquality().hash(menuItems),schedule);

@override
String toString() {
  return 'ReservationRequest(type: $type, tableId: $tableId, menuItems: $menuItems, schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class $ReservationRequestCopyWith<$Res>  {
  factory $ReservationRequestCopyWith(ReservationRequest value, $Res Function(ReservationRequest) _then) = _$ReservationRequestCopyWithImpl;
@useResult
$Res call({
 String type, String tableId, List<MenuItemRequest> menuItems, DateTime schedule
});




}
/// @nodoc
class _$ReservationRequestCopyWithImpl<$Res>
    implements $ReservationRequestCopyWith<$Res> {
  _$ReservationRequestCopyWithImpl(this._self, this._then);

  final ReservationRequest _self;
  final $Res Function(ReservationRequest) _then;

/// Create a copy of ReservationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? tableId = null,Object? menuItems = null,Object? schedule = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,tableId: null == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String,menuItems: null == menuItems ? _self.menuItems : menuItems // ignore: cast_nullable_to_non_nullable
as List<MenuItemRequest>,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ReservationRequest implements ReservationRequest {
   _ReservationRequest({required this.type, required this.tableId, required final  List<MenuItemRequest> menuItems, required this.schedule}): _menuItems = menuItems;
  factory _ReservationRequest.fromJson(Map<String, dynamic> json) => _$ReservationRequestFromJson(json);

@override final  String type;
@override final  String tableId;
 final  List<MenuItemRequest> _menuItems;
@override List<MenuItemRequest> get menuItems {
  if (_menuItems is EqualUnmodifiableListView) return _menuItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_menuItems);
}

@override final  DateTime schedule;

/// Create a copy of ReservationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReservationRequestCopyWith<_ReservationRequest> get copyWith => __$ReservationRequestCopyWithImpl<_ReservationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReservationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReservationRequest&&(identical(other.type, type) || other.type == type)&&(identical(other.tableId, tableId) || other.tableId == tableId)&&const DeepCollectionEquality().equals(other._menuItems, _menuItems)&&(identical(other.schedule, schedule) || other.schedule == schedule));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,tableId,const DeepCollectionEquality().hash(_menuItems),schedule);

@override
String toString() {
  return 'ReservationRequest(type: $type, tableId: $tableId, menuItems: $menuItems, schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class _$ReservationRequestCopyWith<$Res> implements $ReservationRequestCopyWith<$Res> {
  factory _$ReservationRequestCopyWith(_ReservationRequest value, $Res Function(_ReservationRequest) _then) = __$ReservationRequestCopyWithImpl;
@override @useResult
$Res call({
 String type, String tableId, List<MenuItemRequest> menuItems, DateTime schedule
});




}
/// @nodoc
class __$ReservationRequestCopyWithImpl<$Res>
    implements _$ReservationRequestCopyWith<$Res> {
  __$ReservationRequestCopyWithImpl(this._self, this._then);

  final _ReservationRequest _self;
  final $Res Function(_ReservationRequest) _then;

/// Create a copy of ReservationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? tableId = null,Object? menuItems = null,Object? schedule = null,}) {
  return _then(_ReservationRequest(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,tableId: null == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String,menuItems: null == menuItems ? _self._menuItems : menuItems // ignore: cast_nullable_to_non_nullable
as List<MenuItemRequest>,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
