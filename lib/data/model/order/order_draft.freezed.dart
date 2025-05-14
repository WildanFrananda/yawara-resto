// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderDraft {

@HiveField(0) String get id;@HiveField(1) List<MenuItemRequest> get items;@HiveField(2) String get location;@HiveField(3) DateTime get schedule;@HiveField(4) DateTime get savedAt;@HiveField(5) int get retryCount;
/// Create a copy of OrderDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDraftCopyWith<OrderDraft> get copyWith => _$OrderDraftCopyWithImpl<OrderDraft>(this as OrderDraft, _$identity);

  /// Serializes this OrderDraft to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDraft&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.location, location) || other.location == location)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.savedAt, savedAt) || other.savedAt == savedAt)&&(identical(other.retryCount, retryCount) || other.retryCount == retryCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(items),location,schedule,savedAt,retryCount);

@override
String toString() {
  return 'OrderDraft(id: $id, items: $items, location: $location, schedule: $schedule, savedAt: $savedAt, retryCount: $retryCount)';
}


}

/// @nodoc
abstract mixin class $OrderDraftCopyWith<$Res>  {
  factory $OrderDraftCopyWith(OrderDraft value, $Res Function(OrderDraft) _then) = _$OrderDraftCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String id,@HiveField(1) List<MenuItemRequest> items,@HiveField(2) String location,@HiveField(3) DateTime schedule,@HiveField(4) DateTime savedAt,@HiveField(5) int retryCount
});




}
/// @nodoc
class _$OrderDraftCopyWithImpl<$Res>
    implements $OrderDraftCopyWith<$Res> {
  _$OrderDraftCopyWithImpl(this._self, this._then);

  final OrderDraft _self;
  final $Res Function(OrderDraft) _then;

/// Create a copy of OrderDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? items = null,Object? location = null,Object? schedule = null,Object? savedAt = null,Object? retryCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<MenuItemRequest>,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as DateTime,savedAt: null == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime,retryCount: null == retryCount ? _self.retryCount : retryCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _OrderDraft implements OrderDraft {
   _OrderDraft({@HiveField(0) required this.id, @HiveField(1) required final  List<MenuItemRequest> items, @HiveField(2) required this.location, @HiveField(3) required this.schedule, @HiveField(4) required this.savedAt, @HiveField(5) this.retryCount = 0}): _items = items;
  factory _OrderDraft.fromJson(Map<String, dynamic> json) => _$OrderDraftFromJson(json);

@override@HiveField(0) final  String id;
 final  List<MenuItemRequest> _items;
@override@HiveField(1) List<MenuItemRequest> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@HiveField(2) final  String location;
@override@HiveField(3) final  DateTime schedule;
@override@HiveField(4) final  DateTime savedAt;
@override@JsonKey()@HiveField(5) final  int retryCount;

/// Create a copy of OrderDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDraftCopyWith<_OrderDraft> get copyWith => __$OrderDraftCopyWithImpl<_OrderDraft>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderDraftToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDraft&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.location, location) || other.location == location)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.savedAt, savedAt) || other.savedAt == savedAt)&&(identical(other.retryCount, retryCount) || other.retryCount == retryCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_items),location,schedule,savedAt,retryCount);

@override
String toString() {
  return 'OrderDraft(id: $id, items: $items, location: $location, schedule: $schedule, savedAt: $savedAt, retryCount: $retryCount)';
}


}

/// @nodoc
abstract mixin class _$OrderDraftCopyWith<$Res> implements $OrderDraftCopyWith<$Res> {
  factory _$OrderDraftCopyWith(_OrderDraft value, $Res Function(_OrderDraft) _then) = __$OrderDraftCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String id,@HiveField(1) List<MenuItemRequest> items,@HiveField(2) String location,@HiveField(3) DateTime schedule,@HiveField(4) DateTime savedAt,@HiveField(5) int retryCount
});




}
/// @nodoc
class __$OrderDraftCopyWithImpl<$Res>
    implements _$OrderDraftCopyWith<$Res> {
  __$OrderDraftCopyWithImpl(this._self, this._then);

  final _OrderDraft _self;
  final $Res Function(_OrderDraft) _then;

/// Create a copy of OrderDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? items = null,Object? location = null,Object? schedule = null,Object? savedAt = null,Object? retryCount = null,}) {
  return _then(_OrderDraft(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MenuItemRequest>,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as DateTime,savedAt: null == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime,retryCount: null == retryCount ? _self.retryCount : retryCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
