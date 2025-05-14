// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingResponse {

 String get id; List<Transaction> get transactions; List<BookingMenu> get bookingMenus; String get user; String get type; DateTime get schedule; String get location; String get status; String get chefLocation; MenuModel get menu; double get totalAmount; DateTime get createdAt;
/// Create a copy of BookingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingResponseCopyWith<BookingResponse> get copyWith => _$BookingResponseCopyWithImpl<BookingResponse>(this as BookingResponse, _$identity);

  /// Serializes this BookingResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingResponse&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.transactions, transactions)&&const DeepCollectionEquality().equals(other.bookingMenus, bookingMenus)&&(identical(other.user, user) || other.user == user)&&(identical(other.type, type) || other.type == type)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.chefLocation, chefLocation) || other.chefLocation == chefLocation)&&(identical(other.menu, menu) || other.menu == menu)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(transactions),const DeepCollectionEquality().hash(bookingMenus),user,type,schedule,location,status,chefLocation,menu,totalAmount,createdAt);

@override
String toString() {
  return 'BookingResponse(id: $id, transactions: $transactions, bookingMenus: $bookingMenus, user: $user, type: $type, schedule: $schedule, location: $location, status: $status, chefLocation: $chefLocation, menu: $menu, totalAmount: $totalAmount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BookingResponseCopyWith<$Res>  {
  factory $BookingResponseCopyWith(BookingResponse value, $Res Function(BookingResponse) _then) = _$BookingResponseCopyWithImpl;
@useResult
$Res call({
 String id, List<Transaction> transactions, List<BookingMenu> bookingMenus, String user, String type, DateTime schedule, String location, String status, String chefLocation, MenuModel menu, double totalAmount, DateTime createdAt
});


$MenuModelCopyWith<$Res> get menu;

}
/// @nodoc
class _$BookingResponseCopyWithImpl<$Res>
    implements $BookingResponseCopyWith<$Res> {
  _$BookingResponseCopyWithImpl(this._self, this._then);

  final BookingResponse _self;
  final $Res Function(BookingResponse) _then;

/// Create a copy of BookingResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? transactions = null,Object? bookingMenus = null,Object? user = null,Object? type = null,Object? schedule = null,Object? location = null,Object? status = null,Object? chefLocation = null,Object? menu = null,Object? totalAmount = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<Transaction>,bookingMenus: null == bookingMenus ? _self.bookingMenus : bookingMenus // ignore: cast_nullable_to_non_nullable
as List<BookingMenu>,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as DateTime,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,chefLocation: null == chefLocation ? _self.chefLocation : chefLocation // ignore: cast_nullable_to_non_nullable
as String,menu: null == menu ? _self.menu : menu // ignore: cast_nullable_to_non_nullable
as MenuModel,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of BookingResponse
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

class _BookingResponse implements BookingResponse {
   _BookingResponse({required this.id, required final  List<Transaction> transactions, required final  List<BookingMenu> bookingMenus, required this.user, required this.type, required this.schedule, required this.location, required this.status, required this.chefLocation, required this.menu, required this.totalAmount, required this.createdAt}): _transactions = transactions,_bookingMenus = bookingMenus;
  factory _BookingResponse.fromJson(Map<String, dynamic> json) => _$BookingResponseFromJson(json);

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
@override final  String location;
@override final  String status;
@override final  String chefLocation;
@override final  MenuModel menu;
@override final  double totalAmount;
@override final  DateTime createdAt;

/// Create a copy of BookingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingResponseCopyWith<_BookingResponse> get copyWith => __$BookingResponseCopyWithImpl<_BookingResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingResponse&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&const DeepCollectionEquality().equals(other._bookingMenus, _bookingMenus)&&(identical(other.user, user) || other.user == user)&&(identical(other.type, type) || other.type == type)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.chefLocation, chefLocation) || other.chefLocation == chefLocation)&&(identical(other.menu, menu) || other.menu == menu)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_transactions),const DeepCollectionEquality().hash(_bookingMenus),user,type,schedule,location,status,chefLocation,menu,totalAmount,createdAt);

@override
String toString() {
  return 'BookingResponse(id: $id, transactions: $transactions, bookingMenus: $bookingMenus, user: $user, type: $type, schedule: $schedule, location: $location, status: $status, chefLocation: $chefLocation, menu: $menu, totalAmount: $totalAmount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BookingResponseCopyWith<$Res> implements $BookingResponseCopyWith<$Res> {
  factory _$BookingResponseCopyWith(_BookingResponse value, $Res Function(_BookingResponse) _then) = __$BookingResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, List<Transaction> transactions, List<BookingMenu> bookingMenus, String user, String type, DateTime schedule, String location, String status, String chefLocation, MenuModel menu, double totalAmount, DateTime createdAt
});


@override $MenuModelCopyWith<$Res> get menu;

}
/// @nodoc
class __$BookingResponseCopyWithImpl<$Res>
    implements _$BookingResponseCopyWith<$Res> {
  __$BookingResponseCopyWithImpl(this._self, this._then);

  final _BookingResponse _self;
  final $Res Function(_BookingResponse) _then;

/// Create a copy of BookingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? transactions = null,Object? bookingMenus = null,Object? user = null,Object? type = null,Object? schedule = null,Object? location = null,Object? status = null,Object? chefLocation = null,Object? menu = null,Object? totalAmount = null,Object? createdAt = null,}) {
  return _then(_BookingResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<Transaction>,bookingMenus: null == bookingMenus ? _self._bookingMenus : bookingMenus // ignore: cast_nullable_to_non_nullable
as List<BookingMenu>,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as DateTime,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,chefLocation: null == chefLocation ? _self.chefLocation : chefLocation // ignore: cast_nullable_to_non_nullable
as String,menu: null == menu ? _self.menu : menu // ignore: cast_nullable_to_non_nullable
as MenuModel,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of BookingResponse
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
