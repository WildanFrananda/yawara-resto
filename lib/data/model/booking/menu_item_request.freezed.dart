// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_item_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuItemRequest {

 String get menuId; int get quantity;
/// Create a copy of MenuItemRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuItemRequestCopyWith<MenuItemRequest> get copyWith => _$MenuItemRequestCopyWithImpl<MenuItemRequest>(this as MenuItemRequest, _$identity);

  /// Serializes this MenuItemRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuItemRequest&&(identical(other.menuId, menuId) || other.menuId == menuId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuId,quantity);

@override
String toString() {
  return 'MenuItemRequest(menuId: $menuId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $MenuItemRequestCopyWith<$Res>  {
  factory $MenuItemRequestCopyWith(MenuItemRequest value, $Res Function(MenuItemRequest) _then) = _$MenuItemRequestCopyWithImpl;
@useResult
$Res call({
 String menuId, int quantity
});




}
/// @nodoc
class _$MenuItemRequestCopyWithImpl<$Res>
    implements $MenuItemRequestCopyWith<$Res> {
  _$MenuItemRequestCopyWithImpl(this._self, this._then);

  final MenuItemRequest _self;
  final $Res Function(MenuItemRequest) _then;

/// Create a copy of MenuItemRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? menuId = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
menuId: null == menuId ? _self.menuId : menuId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MenuItemRequest implements MenuItemRequest {
  const _MenuItemRequest({required this.menuId, required this.quantity});
  factory _MenuItemRequest.fromJson(Map<String, dynamic> json) => _$MenuItemRequestFromJson(json);

@override final  String menuId;
@override final  int quantity;

/// Create a copy of MenuItemRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuItemRequestCopyWith<_MenuItemRequest> get copyWith => __$MenuItemRequestCopyWithImpl<_MenuItemRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuItemRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuItemRequest&&(identical(other.menuId, menuId) || other.menuId == menuId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuId,quantity);

@override
String toString() {
  return 'MenuItemRequest(menuId: $menuId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$MenuItemRequestCopyWith<$Res> implements $MenuItemRequestCopyWith<$Res> {
  factory _$MenuItemRequestCopyWith(_MenuItemRequest value, $Res Function(_MenuItemRequest) _then) = __$MenuItemRequestCopyWithImpl;
@override @useResult
$Res call({
 String menuId, int quantity
});




}
/// @nodoc
class __$MenuItemRequestCopyWithImpl<$Res>
    implements _$MenuItemRequestCopyWith<$Res> {
  __$MenuItemRequestCopyWithImpl(this._self, this._then);

  final _MenuItemRequest _self;
  final $Res Function(_MenuItemRequest) _then;

/// Create a copy of MenuItemRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? menuId = null,Object? quantity = null,}) {
  return _then(_MenuItemRequest(
menuId: null == menuId ? _self.menuId : menuId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
