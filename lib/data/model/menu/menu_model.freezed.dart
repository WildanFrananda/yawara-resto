// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuModel {

 String get id; String get name; String? get description;@JsonKey(fromJson: _priceFromJson) double get price; CategoryModel get category; bool? get isTopWeek; String? get status; String get imageUrl;
/// Create a copy of MenuModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuModelCopyWith<MenuModel> get copyWith => _$MenuModelCopyWithImpl<MenuModel>(this as MenuModel, _$identity);

  /// Serializes this MenuModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.category, category) || other.category == category)&&(identical(other.isTopWeek, isTopWeek) || other.isTopWeek == isTopWeek)&&(identical(other.status, status) || other.status == status)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,category,isTopWeek,status,imageUrl);

@override
String toString() {
  return 'MenuModel(id: $id, name: $name, description: $description, price: $price, category: $category, isTopWeek: $isTopWeek, status: $status, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $MenuModelCopyWith<$Res>  {
  factory $MenuModelCopyWith(MenuModel value, $Res Function(MenuModel) _then) = _$MenuModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description,@JsonKey(fromJson: _priceFromJson) double price, CategoryModel category, bool? isTopWeek, String? status, String imageUrl
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class _$MenuModelCopyWithImpl<$Res>
    implements $MenuModelCopyWith<$Res> {
  _$MenuModelCopyWithImpl(this._self, this._then);

  final MenuModel _self;
  final $Res Function(MenuModel) _then;

/// Create a copy of MenuModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? price = null,Object? category = null,Object? isTopWeek = freezed,Object? status = freezed,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,isTopWeek: freezed == isTopWeek ? _self.isTopWeek : isTopWeek // ignore: cast_nullable_to_non_nullable
as bool?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of MenuModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _MenuModel implements MenuModel {
   _MenuModel({required this.id, required this.name, this.description, @JsonKey(fromJson: _priceFromJson) required this.price, required this.category, this.isTopWeek, this.status, required this.imageUrl});
  factory _MenuModel.fromJson(Map<String, dynamic> json) => _$MenuModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override@JsonKey(fromJson: _priceFromJson) final  double price;
@override final  CategoryModel category;
@override final  bool? isTopWeek;
@override final  String? status;
@override final  String imageUrl;

/// Create a copy of MenuModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuModelCopyWith<_MenuModel> get copyWith => __$MenuModelCopyWithImpl<_MenuModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.category, category) || other.category == category)&&(identical(other.isTopWeek, isTopWeek) || other.isTopWeek == isTopWeek)&&(identical(other.status, status) || other.status == status)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,category,isTopWeek,status,imageUrl);

@override
String toString() {
  return 'MenuModel(id: $id, name: $name, description: $description, price: $price, category: $category, isTopWeek: $isTopWeek, status: $status, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$MenuModelCopyWith<$Res> implements $MenuModelCopyWith<$Res> {
  factory _$MenuModelCopyWith(_MenuModel value, $Res Function(_MenuModel) _then) = __$MenuModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description,@JsonKey(fromJson: _priceFromJson) double price, CategoryModel category, bool? isTopWeek, String? status, String imageUrl
});


@override $CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$MenuModelCopyWithImpl<$Res>
    implements _$MenuModelCopyWith<$Res> {
  __$MenuModelCopyWithImpl(this._self, this._then);

  final _MenuModel _self;
  final $Res Function(_MenuModel) _then;

/// Create a copy of MenuModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? price = null,Object? category = null,Object? isTopWeek = freezed,Object? status = freezed,Object? imageUrl = null,}) {
  return _then(_MenuModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,isTopWeek: freezed == isTopWeek ? _self.isTopWeek : isTopWeek // ignore: cast_nullable_to_non_nullable
as bool?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of MenuModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on
