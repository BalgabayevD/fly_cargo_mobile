// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_query_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddressQueryEntity {

 String get title;
/// Create a copy of AddressQueryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressQueryEntityCopyWith<AddressQueryEntity> get copyWith => _$AddressQueryEntityCopyWithImpl<AddressQueryEntity>(this as AddressQueryEntity, _$identity);

  /// Serializes this AddressQueryEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressQueryEntity&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title);

@override
String toString() {
  return 'AddressQueryEntity(title: $title)';
}


}

/// @nodoc
abstract mixin class $AddressQueryEntityCopyWith<$Res>  {
  factory $AddressQueryEntityCopyWith(AddressQueryEntity value, $Res Function(AddressQueryEntity) _then) = _$AddressQueryEntityCopyWithImpl;
@useResult
$Res call({
 String title
});




}
/// @nodoc
class _$AddressQueryEntityCopyWithImpl<$Res>
    implements $AddressQueryEntityCopyWith<$Res> {
  _$AddressQueryEntityCopyWithImpl(this._self, this._then);

  final AddressQueryEntity _self;
  final $Res Function(AddressQueryEntity) _then;

/// Create a copy of AddressQueryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AddressQueryEntity].
extension AddressQueryEntityPatterns on AddressQueryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddressQueryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddressQueryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddressQueryEntity value)  $default,){
final _that = this;
switch (_that) {
case _AddressQueryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddressQueryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AddressQueryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddressQueryEntity() when $default != null:
return $default(_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title)  $default,) {final _that = this;
switch (_that) {
case _AddressQueryEntity():
return $default(_that.title);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title)?  $default,) {final _that = this;
switch (_that) {
case _AddressQueryEntity() when $default != null:
return $default(_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddressQueryEntity implements AddressQueryEntity {
  const _AddressQueryEntity({required this.title});
  factory _AddressQueryEntity.fromJson(Map<String, dynamic> json) => _$AddressQueryEntityFromJson(json);

@override final  String title;

/// Create a copy of AddressQueryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressQueryEntityCopyWith<_AddressQueryEntity> get copyWith => __$AddressQueryEntityCopyWithImpl<_AddressQueryEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressQueryEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressQueryEntity&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title);

@override
String toString() {
  return 'AddressQueryEntity(title: $title)';
}


}

/// @nodoc
abstract mixin class _$AddressQueryEntityCopyWith<$Res> implements $AddressQueryEntityCopyWith<$Res> {
  factory _$AddressQueryEntityCopyWith(_AddressQueryEntity value, $Res Function(_AddressQueryEntity) _then) = __$AddressQueryEntityCopyWithImpl;
@override @useResult
$Res call({
 String title
});




}
/// @nodoc
class __$AddressQueryEntityCopyWithImpl<$Res>
    implements _$AddressQueryEntityCopyWith<$Res> {
  __$AddressQueryEntityCopyWithImpl(this._self, this._then);

  final _AddressQueryEntity _self;
  final $Res Function(_AddressQueryEntity) _then;

/// Create a copy of AddressQueryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,}) {
  return _then(_AddressQueryEntity(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
