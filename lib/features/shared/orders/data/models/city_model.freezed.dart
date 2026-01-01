// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CityModel {

 String get name; String get country; String get createdAt; String get updatedAt; int? get id; String? get deletedAt; List<dynamic>? get RoutesFrom; List<dynamic>? get RoutesTo;
/// Create a copy of CityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CityModelCopyWith<CityModel> get copyWith => _$CityModelCopyWithImpl<CityModel>(this as CityModel, _$identity);

  /// Serializes this CityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CityModel&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&const DeepCollectionEquality().equals(other.RoutesFrom, RoutesFrom)&&const DeepCollectionEquality().equals(other.RoutesTo, RoutesTo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,country,createdAt,updatedAt,id,deletedAt,const DeepCollectionEquality().hash(RoutesFrom),const DeepCollectionEquality().hash(RoutesTo));

@override
String toString() {
  return 'CityModel(name: $name, country: $country, createdAt: $createdAt, updatedAt: $updatedAt, id: $id, deletedAt: $deletedAt, RoutesFrom: $RoutesFrom, RoutesTo: $RoutesTo)';
}


}

/// @nodoc
abstract mixin class $CityModelCopyWith<$Res>  {
  factory $CityModelCopyWith(CityModel value, $Res Function(CityModel) _then) = _$CityModelCopyWithImpl;
@useResult
$Res call({
 String name, String country, String createdAt, String updatedAt, int? id, String? deletedAt, List<dynamic>? RoutesFrom, List<dynamic>? RoutesTo
});




}
/// @nodoc
class _$CityModelCopyWithImpl<$Res>
    implements $CityModelCopyWith<$Res> {
  _$CityModelCopyWithImpl(this._self, this._then);

  final CityModel _self;
  final $Res Function(CityModel) _then;

/// Create a copy of CityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? country = null,Object? createdAt = null,Object? updatedAt = null,Object? id = freezed,Object? deletedAt = freezed,Object? RoutesFrom = freezed,Object? RoutesTo = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,RoutesFrom: freezed == RoutesFrom ? _self.RoutesFrom : RoutesFrom // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,RoutesTo: freezed == RoutesTo ? _self.RoutesTo : RoutesTo // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CityModel].
extension CityModelPatterns on CityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CityModel value)  $default,){
final _that = this;
switch (_that) {
case _CityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CityModel value)?  $default,){
final _that = this;
switch (_that) {
case _CityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String country,  String createdAt,  String updatedAt,  int? id,  String? deletedAt,  List<dynamic>? RoutesFrom,  List<dynamic>? RoutesTo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CityModel() when $default != null:
return $default(_that.name,_that.country,_that.createdAt,_that.updatedAt,_that.id,_that.deletedAt,_that.RoutesFrom,_that.RoutesTo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String country,  String createdAt,  String updatedAt,  int? id,  String? deletedAt,  List<dynamic>? RoutesFrom,  List<dynamic>? RoutesTo)  $default,) {final _that = this;
switch (_that) {
case _CityModel():
return $default(_that.name,_that.country,_that.createdAt,_that.updatedAt,_that.id,_that.deletedAt,_that.RoutesFrom,_that.RoutesTo);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String country,  String createdAt,  String updatedAt,  int? id,  String? deletedAt,  List<dynamic>? RoutesFrom,  List<dynamic>? RoutesTo)?  $default,) {final _that = this;
switch (_that) {
case _CityModel() when $default != null:
return $default(_that.name,_that.country,_that.createdAt,_that.updatedAt,_that.id,_that.deletedAt,_that.RoutesFrom,_that.RoutesTo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CityModel implements CityModel {
  const _CityModel({required this.name, required this.country, required this.createdAt, required this.updatedAt, this.id, this.deletedAt, final  List<dynamic>? RoutesFrom, final  List<dynamic>? RoutesTo}): _RoutesFrom = RoutesFrom,_RoutesTo = RoutesTo;
  factory _CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);

@override final  String name;
@override final  String country;
@override final  String createdAt;
@override final  String updatedAt;
@override final  int? id;
@override final  String? deletedAt;
 final  List<dynamic>? _RoutesFrom;
@override List<dynamic>? get RoutesFrom {
  final value = _RoutesFrom;
  if (value == null) return null;
  if (_RoutesFrom is EqualUnmodifiableListView) return _RoutesFrom;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _RoutesTo;
@override List<dynamic>? get RoutesTo {
  final value = _RoutesTo;
  if (value == null) return null;
  if (_RoutesTo is EqualUnmodifiableListView) return _RoutesTo;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CityModelCopyWith<_CityModel> get copyWith => __$CityModelCopyWithImpl<_CityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CityModel&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&const DeepCollectionEquality().equals(other._RoutesFrom, _RoutesFrom)&&const DeepCollectionEquality().equals(other._RoutesTo, _RoutesTo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,country,createdAt,updatedAt,id,deletedAt,const DeepCollectionEquality().hash(_RoutesFrom),const DeepCollectionEquality().hash(_RoutesTo));

@override
String toString() {
  return 'CityModel(name: $name, country: $country, createdAt: $createdAt, updatedAt: $updatedAt, id: $id, deletedAt: $deletedAt, RoutesFrom: $RoutesFrom, RoutesTo: $RoutesTo)';
}


}

/// @nodoc
abstract mixin class _$CityModelCopyWith<$Res> implements $CityModelCopyWith<$Res> {
  factory _$CityModelCopyWith(_CityModel value, $Res Function(_CityModel) _then) = __$CityModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String country, String createdAt, String updatedAt, int? id, String? deletedAt, List<dynamic>? RoutesFrom, List<dynamic>? RoutesTo
});




}
/// @nodoc
class __$CityModelCopyWithImpl<$Res>
    implements _$CityModelCopyWith<$Res> {
  __$CityModelCopyWithImpl(this._self, this._then);

  final _CityModel _self;
  final $Res Function(_CityModel) _then;

/// Create a copy of CityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? country = null,Object? createdAt = null,Object? updatedAt = null,Object? id = freezed,Object? deletedAt = freezed,Object? RoutesFrom = freezed,Object? RoutesTo = freezed,}) {
  return _then(_CityModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,RoutesFrom: freezed == RoutesFrom ? _self._RoutesFrom : RoutesFrom // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,RoutesTo: freezed == RoutesTo ? _self._RoutesTo : RoutesTo // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}


}

// dart format on
