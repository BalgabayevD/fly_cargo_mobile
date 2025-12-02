// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tariff_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TariffCategoryModel {

 int? get id; String get createdAt; String get updatedAt; String? get deletedAt; String get name; String get key;@JsonKey(name: 'sort_index') int? get sortIndex; bool get active; List<TariffModel>? get tariffs;
/// Create a copy of TariffCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TariffCategoryModelCopyWith<TariffCategoryModel> get copyWith => _$TariffCategoryModelCopyWithImpl<TariffCategoryModel>(this as TariffCategoryModel, _$identity);

  /// Serializes this TariffCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TariffCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.key, key) || other.key == key)&&(identical(other.sortIndex, sortIndex) || other.sortIndex == sortIndex)&&(identical(other.active, active) || other.active == active)&&const DeepCollectionEquality().equals(other.tariffs, tariffs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,deletedAt,name,key,sortIndex,active,const DeepCollectionEquality().hash(tariffs));

@override
String toString() {
  return 'TariffCategoryModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, name: $name, key: $key, sortIndex: $sortIndex, active: $active, tariffs: $tariffs)';
}


}

/// @nodoc
abstract mixin class $TariffCategoryModelCopyWith<$Res>  {
  factory $TariffCategoryModelCopyWith(TariffCategoryModel value, $Res Function(TariffCategoryModel) _then) = _$TariffCategoryModelCopyWithImpl;
@useResult
$Res call({
 int? id, String createdAt, String updatedAt, String? deletedAt, String name, String key,@JsonKey(name: 'sort_index') int? sortIndex, bool active, List<TariffModel>? tariffs
});




}
/// @nodoc
class _$TariffCategoryModelCopyWithImpl<$Res>
    implements $TariffCategoryModelCopyWith<$Res> {
  _$TariffCategoryModelCopyWithImpl(this._self, this._then);

  final TariffCategoryModel _self;
  final $Res Function(TariffCategoryModel) _then;

/// Create a copy of TariffCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? name = null,Object? key = null,Object? sortIndex = freezed,Object? active = null,Object? tariffs = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,sortIndex: freezed == sortIndex ? _self.sortIndex : sortIndex // ignore: cast_nullable_to_non_nullable
as int?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,tariffs: freezed == tariffs ? _self.tariffs : tariffs // ignore: cast_nullable_to_non_nullable
as List<TariffModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TariffCategoryModel].
extension TariffCategoryModelPatterns on TariffCategoryModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TariffCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TariffCategoryModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TariffCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _TariffCategoryModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TariffCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _TariffCategoryModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String createdAt,  String updatedAt,  String? deletedAt,  String name,  String key, @JsonKey(name: 'sort_index')  int? sortIndex,  bool active,  List<TariffModel>? tariffs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TariffCategoryModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.name,_that.key,_that.sortIndex,_that.active,_that.tariffs);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String createdAt,  String updatedAt,  String? deletedAt,  String name,  String key, @JsonKey(name: 'sort_index')  int? sortIndex,  bool active,  List<TariffModel>? tariffs)  $default,) {final _that = this;
switch (_that) {
case _TariffCategoryModel():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.name,_that.key,_that.sortIndex,_that.active,_that.tariffs);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String createdAt,  String updatedAt,  String? deletedAt,  String name,  String key, @JsonKey(name: 'sort_index')  int? sortIndex,  bool active,  List<TariffModel>? tariffs)?  $default,) {final _that = this;
switch (_that) {
case _TariffCategoryModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.name,_that.key,_that.sortIndex,_that.active,_that.tariffs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TariffCategoryModel implements TariffCategoryModel {
  const _TariffCategoryModel({this.id, required this.createdAt, required this.updatedAt, this.deletedAt, required this.name, required this.key, @JsonKey(name: 'sort_index') this.sortIndex, required this.active, final  List<TariffModel>? tariffs}): _tariffs = tariffs;
  factory _TariffCategoryModel.fromJson(Map<String, dynamic> json) => _$TariffCategoryModelFromJson(json);

@override final  int? id;
@override final  String createdAt;
@override final  String updatedAt;
@override final  String? deletedAt;
@override final  String name;
@override final  String key;
@override@JsonKey(name: 'sort_index') final  int? sortIndex;
@override final  bool active;
 final  List<TariffModel>? _tariffs;
@override List<TariffModel>? get tariffs {
  final value = _tariffs;
  if (value == null) return null;
  if (_tariffs is EqualUnmodifiableListView) return _tariffs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TariffCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TariffCategoryModelCopyWith<_TariffCategoryModel> get copyWith => __$TariffCategoryModelCopyWithImpl<_TariffCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TariffCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TariffCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.key, key) || other.key == key)&&(identical(other.sortIndex, sortIndex) || other.sortIndex == sortIndex)&&(identical(other.active, active) || other.active == active)&&const DeepCollectionEquality().equals(other._tariffs, _tariffs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,deletedAt,name,key,sortIndex,active,const DeepCollectionEquality().hash(_tariffs));

@override
String toString() {
  return 'TariffCategoryModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, name: $name, key: $key, sortIndex: $sortIndex, active: $active, tariffs: $tariffs)';
}


}

/// @nodoc
abstract mixin class _$TariffCategoryModelCopyWith<$Res> implements $TariffCategoryModelCopyWith<$Res> {
  factory _$TariffCategoryModelCopyWith(_TariffCategoryModel value, $Res Function(_TariffCategoryModel) _then) = __$TariffCategoryModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String createdAt, String updatedAt, String? deletedAt, String name, String key,@JsonKey(name: 'sort_index') int? sortIndex, bool active, List<TariffModel>? tariffs
});




}
/// @nodoc
class __$TariffCategoryModelCopyWithImpl<$Res>
    implements _$TariffCategoryModelCopyWith<$Res> {
  __$TariffCategoryModelCopyWithImpl(this._self, this._then);

  final _TariffCategoryModel _self;
  final $Res Function(_TariffCategoryModel) _then;

/// Create a copy of TariffCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? name = null,Object? key = null,Object? sortIndex = freezed,Object? active = null,Object? tariffs = freezed,}) {
  return _then(_TariffCategoryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,sortIndex: freezed == sortIndex ? _self.sortIndex : sortIndex // ignore: cast_nullable_to_non_nullable
as int?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,tariffs: freezed == tariffs ? _self._tariffs : tariffs // ignore: cast_nullable_to_non_nullable
as List<TariffModel>?,
  ));
}


}

// dart format on
