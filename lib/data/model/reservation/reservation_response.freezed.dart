// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReservationResponse {

 String get id; List<Transaction> get transactions; List<BookingMenu> get bookingMenus; String get user; String get type; DateTime get schedule; String get status; TableModel get table; double get totalAmount; DateTime get createdAt;
/// Create a copy of ReservationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationResponseCopyWith<ReservationResponse> get copyWith => _$ReservationResponseCopyWithImpl<ReservationResponse>(this as ReservationResponse, _$identity);

  /// Serializes this ReservationResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReservationResponse&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.transactions, transactions)&&const DeepCollectionEquality().equals(other.bookingMenus, bookingMenus)&&(identical(other.user, user) || other.user == user)&&(identical(other.type, type) || other.type == type)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.status, status) || other.status == status)&&(identical(other.table, table) || other.table == table)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(transactions),const DeepCollectionEquality().hash(bookingMenus),user,type,schedule,status,table,totalAmount,createdAt);

@override
String toString() {
  return 'ReservationResponse(id: $id, transactions: $transactions, bookingMenus: $bookingMenus, user: $user, type: $type, schedule: $schedule, status: $status, table: $table, totalAmount: $totalAmount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ReservationResponseCopyWith<$Res>  {
  factory $ReservationResponseCopyWith(ReservationResponse value, $Res Function(ReservationResponse) _then) = _$ReservationResponseCopyWithImpl;
@useResult
$Res call({
 String id, List<Transaction> transactions, List<BookingMenu> bookingMenus, String user, String type, DateTime schedule, String status, TableModel table, double totalAmount, DateTime createdAt
});


$TableModelCopyWith<$Res> get table;

}
/// @nodoc
class _$ReservationResponseCopyWithImpl<$Res>
    implements $ReservationResponseCopyWith<$Res> {
  _$ReservationResponseCopyWithImpl(this._self, this._then);

  final ReservationResponse _self;
  final $Res Function(ReservationResponse) _then;

/// Create a copy of ReservationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? transactions = null,Object? bookingMenus = null,Object? user = null,Object? type = null,Object? schedule = null,Object? status = null,Object? table = null,Object? totalAmount = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<Transaction>,bookingMenus: null == bookingMenus ? _self.bookingMenus : bookingMenus // ignore: cast_nullable_to_non_nullable
as List<BookingMenu>,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,table: null == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as TableModel,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of ReservationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TableModelCopyWith<$Res> get table {
  
  return $TableModelCopyWith<$Res>(_self.table, (value) {
    return _then(_self.copyWith(table: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ReservationResponse implements ReservationResponse {
   _ReservationResponse({required this.id, required final  List<Transaction> transactions, required final  List<BookingMenu> bookingMenus, required this.user, required this.type, required this.schedule, required this.status, required this.table, required this.totalAmount, required this.createdAt}): _transactions = transactions,_bookingMenus = bookingMenus;
  factory _ReservationResponse.fromJson(Map<String, dynamic> json) => _$ReservationResponseFromJson(json);

@override final  String id;
 final  List<Transaction> _transactions;
@override List<Transaction> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

 final  List<BookingMenu> _bookingMenus;
@override List<BookingMenu> get bookingMenus {
  if (_bookingMenus is EqualUnmodifiableListView) return _bookingMenus;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bookingMenus);
}

@override final  String user;
@override final  String type;
@override final  DateTime schedule;
@override final  String status;
@override final  TableModel table;
@override final  double totalAmount;
@override final  DateTime createdAt;

/// Create a copy of ReservationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReservationResponseCopyWith<_ReservationResponse> get copyWith => __$ReservationResponseCopyWithImpl<_ReservationResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReservationResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReservationResponse&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&const DeepCollectionEquality().equals(other._bookingMenus, _bookingMenus)&&(identical(other.user, user) || other.user == user)&&(identical(other.type, type) || other.type == type)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.status, status) || other.status == status)&&(identical(other.table, table) || other.table == table)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_transactions),const DeepCollectionEquality().hash(_bookingMenus),user,type,schedule,status,table,totalAmount,createdAt);

@override
String toString() {
  return 'ReservationResponse(id: $id, transactions: $transactions, bookingMenus: $bookingMenus, user: $user, type: $type, schedule: $schedule, status: $status, table: $table, totalAmount: $totalAmount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ReservationResponseCopyWith<$Res> implements $ReservationResponseCopyWith<$Res> {
  factory _$ReservationResponseCopyWith(_ReservationResponse value, $Res Function(_ReservationResponse) _then) = __$ReservationResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, List<Transaction> transactions, List<BookingMenu> bookingMenus, String user, String type, DateTime schedule, String status, TableModel table, double totalAmount, DateTime createdAt
});


@override $TableModelCopyWith<$Res> get table;

}
/// @nodoc
class __$ReservationResponseCopyWithImpl<$Res>
    implements _$ReservationResponseCopyWith<$Res> {
  __$ReservationResponseCopyWithImpl(this._self, this._then);

  final _ReservationResponse _self;
  final $Res Function(_ReservationResponse) _then;

/// Create a copy of ReservationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? transactions = null,Object? bookingMenus = null,Object? user = null,Object? type = null,Object? schedule = null,Object? status = null,Object? table = null,Object? totalAmount = null,Object? createdAt = null,}) {
  return _then(_ReservationResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<Transaction>,bookingMenus: null == bookingMenus ? _self._bookingMenus : bookingMenus // ignore: cast_nullable_to_non_nullable
as List<BookingMenu>,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,table: null == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as TableModel,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of ReservationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TableModelCopyWith<$Res> get table {
  
  return $TableModelCopyWith<$Res>(_self.table, (value) {
    return _then(_self.copyWith(table: value));
  });
}
}

// dart format on
