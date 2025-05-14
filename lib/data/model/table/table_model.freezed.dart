// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TableModel {

 String get id; String get tableNumber; int get capacity; TableStatus get status;
/// Create a copy of TableModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TableModelCopyWith<TableModel> get copyWith => _$TableModelCopyWithImpl<TableModel>(this as TableModel, _$identity);

  /// Serializes this TableModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tableNumber,capacity,status);

@override
String toString() {
  return 'TableModel(id: $id, tableNumber: $tableNumber, capacity: $capacity, status: $status)';
}


}

/// @nodoc
abstract mixin class $TableModelCopyWith<$Res>  {
  factory $TableModelCopyWith(TableModel value, $Res Function(TableModel) _then) = _$TableModelCopyWithImpl;
@useResult
$Res call({
 String id, String tableNumber, int capacity, TableStatus status
});




}
/// @nodoc
class _$TableModelCopyWithImpl<$Res>
    implements $TableModelCopyWith<$Res> {
  _$TableModelCopyWithImpl(this._self, this._then);

  final TableModel _self;
  final $Res Function(TableModel) _then;

/// Create a copy of TableModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tableNumber = null,Object? capacity = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tableNumber: null == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TableStatus,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TableModel implements TableModel {
   _TableModel({required this.id, required this.tableNumber, required this.capacity, required this.status});
  factory _TableModel.fromJson(Map<String, dynamic> json) => _$TableModelFromJson(json);

@override final  String id;
@override final  String tableNumber;
@override final  int capacity;
@override final  TableStatus status;

/// Create a copy of TableModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TableModelCopyWith<_TableModel> get copyWith => __$TableModelCopyWithImpl<_TableModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TableModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TableModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tableNumber,capacity,status);

@override
String toString() {
  return 'TableModel(id: $id, tableNumber: $tableNumber, capacity: $capacity, status: $status)';
}


}

/// @nodoc
abstract mixin class _$TableModelCopyWith<$Res> implements $TableModelCopyWith<$Res> {
  factory _$TableModelCopyWith(_TableModel value, $Res Function(_TableModel) _then) = __$TableModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String tableNumber, int capacity, TableStatus status
});




}
/// @nodoc
class __$TableModelCopyWithImpl<$Res>
    implements _$TableModelCopyWith<$Res> {
  __$TableModelCopyWithImpl(this._self, this._then);

  final _TableModel _self;
  final $Res Function(_TableModel) _then;

/// Create a copy of TableModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tableNumber = null,Object? capacity = null,Object? status = null,}) {
  return _then(_TableModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tableNumber: null == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TableStatus,
  ));
}


}

// dart format on
