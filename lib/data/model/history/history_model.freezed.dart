// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryModel {

@HiveField(0) String get id;@HiveField(1) String get type;@HiveField(2) DateTime get schedule;@HiveField(3) String? get location;@HiveField(4) String get status;@HiveField(5) double get totalAmount;
/// Create a copy of HistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryModelCopyWith<HistoryModel> get copyWith => _$HistoryModelCopyWithImpl<HistoryModel>(this as HistoryModel, _$identity);

  /// Serializes this HistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,schedule,location,status,totalAmount);

@override
String toString() {
  return 'HistoryModel(id: $id, type: $type, schedule: $schedule, location: $location, status: $status, totalAmount: $totalAmount)';
}


}

/// @nodoc
abstract mixin class $HistoryModelCopyWith<$Res>  {
  factory $HistoryModelCopyWith(HistoryModel value, $Res Function(HistoryModel) _then) = _$HistoryModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String type,@HiveField(2) DateTime schedule,@HiveField(3) String? location,@HiveField(4) String status,@HiveField(5) double totalAmount
});




}
/// @nodoc
class _$HistoryModelCopyWithImpl<$Res>
    implements $HistoryModelCopyWith<$Res> {
  _$HistoryModelCopyWithImpl(this._self, this._then);

  final HistoryModel _self;
  final $Res Function(HistoryModel) _then;

/// Create a copy of HistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? schedule = null,Object? location = freezed,Object? status = null,Object? totalAmount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as DateTime,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _HistoryModel implements HistoryModel {
   _HistoryModel({@HiveField(0) required this.id, @HiveField(1) required this.type, @HiveField(2) required this.schedule, @HiveField(3) this.location, @HiveField(4) required this.status, @HiveField(5) required this.totalAmount});
  factory _HistoryModel.fromJson(Map<String, dynamic> json) => _$HistoryModelFromJson(json);

@override@HiveField(0) final  String id;
@override@HiveField(1) final  String type;
@override@HiveField(2) final  DateTime schedule;
@override@HiveField(3) final  String? location;
@override@HiveField(4) final  String status;
@override@HiveField(5) final  double totalAmount;

/// Create a copy of HistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryModelCopyWith<_HistoryModel> get copyWith => __$HistoryModelCopyWithImpl<_HistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,schedule,location,status,totalAmount);

@override
String toString() {
  return 'HistoryModel(id: $id, type: $type, schedule: $schedule, location: $location, status: $status, totalAmount: $totalAmount)';
}


}

/// @nodoc
abstract mixin class _$HistoryModelCopyWith<$Res> implements $HistoryModelCopyWith<$Res> {
  factory _$HistoryModelCopyWith(_HistoryModel value, $Res Function(_HistoryModel) _then) = __$HistoryModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String type,@HiveField(2) DateTime schedule,@HiveField(3) String? location,@HiveField(4) String status,@HiveField(5) double totalAmount
});




}
/// @nodoc
class __$HistoryModelCopyWithImpl<$Res>
    implements _$HistoryModelCopyWith<$Res> {
  __$HistoryModelCopyWithImpl(this._self, this._then);

  final _HistoryModel _self;
  final $Res Function(_HistoryModel) _then;

/// Create a copy of HistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? schedule = null,Object? location = freezed,Object? status = null,Object? totalAmount = null,}) {
  return _then(_HistoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as DateTime,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
