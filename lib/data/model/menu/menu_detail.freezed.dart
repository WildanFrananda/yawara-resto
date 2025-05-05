// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuDetail {

 String get id; String get name; String? get description; double get price; String? get category; bool? get isTopWeek; String? get status; String get imageUrl;
/// Create a copy of MenuDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuDetailCopyWith<MenuDetail> get copyWith => _$MenuDetailCopyWithImpl<MenuDetail>(this as MenuDetail, _$identity);

  /// Serializes this MenuDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.category, category) || other.category == category)&&(identical(other.isTopWeek, isTopWeek) || other.isTopWeek == isTopWeek)&&(identical(other.status, status) || other.status == status)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,category,isTopWeek,status,imageUrl);

@override
String toString() {
  return 'MenuDetail(id: $id, name: $name, description: $description, price: $price, category: $category, isTopWeek: $isTopWeek, status: $status, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $MenuDetailCopyWith<$Res>  {
  factory $MenuDetailCopyWith(MenuDetail value, $Res Function(MenuDetail) _then) = _$MenuDetailCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, double price, String? category, bool? isTopWeek, String? status, String imageUrl
});




}
/// @nodoc
class _$MenuDetailCopyWithImpl<$Res>
    implements $MenuDetailCopyWith<$Res> {
  _$MenuDetailCopyWithImpl(this._self, this._then);

  final MenuDetail _self;
  final $Res Function(MenuDetail) _then;

/// Create a copy of MenuDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? price = null,Object? category = freezed,Object? isTopWeek = freezed,Object? status = freezed,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,isTopWeek: freezed == isTopWeek ? _self.isTopWeek : isTopWeek // ignore: cast_nullable_to_non_nullable
as bool?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MenuDetail implements MenuDetail {
   _MenuDetail({required this.id, required this.name, this.description, required this.price, this.category, this.isTopWeek, this.status, required this.imageUrl});
  factory _MenuDetail.fromJson(Map<String, dynamic> json) => _$MenuDetailFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  double price;
@override final  String? category;
@override final  bool? isTopWeek;
@override final  String? status;
@override final  String imageUrl;

/// Create a copy of MenuDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuDetailCopyWith<_MenuDetail> get copyWith => __$MenuDetailCopyWithImpl<_MenuDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.category, category) || other.category == category)&&(identical(other.isTopWeek, isTopWeek) || other.isTopWeek == isTopWeek)&&(identical(other.status, status) || other.status == status)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,category,isTopWeek,status,imageUrl);

@override
String toString() {
  return 'MenuDetail(id: $id, name: $name, description: $description, price: $price, category: $category, isTopWeek: $isTopWeek, status: $status, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$MenuDetailCopyWith<$Res> implements $MenuDetailCopyWith<$Res> {
  factory _$MenuDetailCopyWith(_MenuDetail value, $Res Function(_MenuDetail) _then) = __$MenuDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, double price, String? category, bool? isTopWeek, String? status, String imageUrl
});




}
/// @nodoc
class __$MenuDetailCopyWithImpl<$Res>
    implements _$MenuDetailCopyWith<$Res> {
  __$MenuDetailCopyWithImpl(this._self, this._then);

  final _MenuDetail _self;
  final $Res Function(_MenuDetail) _then;

/// Create a copy of MenuDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? price = null,Object? category = freezed,Object? isTopWeek = freezed,Object? status = freezed,Object? imageUrl = null,}) {
  return _then(_MenuDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,isTopWeek: freezed == isTopWeek ? _self.isTopWeek : isTopWeek // ignore: cast_nullable_to_non_nullable
as bool?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
