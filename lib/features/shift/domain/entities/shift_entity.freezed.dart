// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShiftEntity {

 bool get isActive; String? get openedAt; String? get closedAt;
/// Create a copy of ShiftEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftEntityCopyWith<ShiftEntity> get copyWith => _$ShiftEntityCopyWithImpl<ShiftEntity>(this as ShiftEntity, _$identity);

  /// Serializes this ShiftEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShiftEntity&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.openedAt, openedAt) || other.openedAt == openedAt)&&(identical(other.closedAt, closedAt) || other.closedAt == closedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isActive,openedAt,closedAt);

@override
String toString() {
  return 'ShiftEntity(isActive: $isActive, openedAt: $openedAt, closedAt: $closedAt)';
}


}

/// @nodoc
abstract mixin class $ShiftEntityCopyWith<$Res>  {
  factory $ShiftEntityCopyWith(ShiftEntity value, $Res Function(ShiftEntity) _then) = _$ShiftEntityCopyWithImpl;
@useResult
$Res call({
 bool isActive, String? openedAt, String? closedAt
});




}
/// @nodoc
class _$ShiftEntityCopyWithImpl<$Res>
    implements $ShiftEntityCopyWith<$Res> {
  _$ShiftEntityCopyWithImpl(this._self, this._then);

  final ShiftEntity _self;
  final $Res Function(ShiftEntity) _then;

/// Create a copy of ShiftEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isActive = null,Object? openedAt = freezed,Object? closedAt = freezed,}) {
  return _then(_self.copyWith(
isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,openedAt: freezed == openedAt ? _self.openedAt : openedAt // ignore: cast_nullable_to_non_nullable
as String?,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShiftEntity].
extension ShiftEntityPatterns on ShiftEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShiftEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShiftEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShiftEntity value)  $default,){
final _that = this;
switch (_that) {
case _ShiftEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShiftEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ShiftEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isActive,  String? openedAt,  String? closedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShiftEntity() when $default != null:
return $default(_that.isActive,_that.openedAt,_that.closedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isActive,  String? openedAt,  String? closedAt)  $default,) {final _that = this;
switch (_that) {
case _ShiftEntity():
return $default(_that.isActive,_that.openedAt,_that.closedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isActive,  String? openedAt,  String? closedAt)?  $default,) {final _that = this;
switch (_that) {
case _ShiftEntity() when $default != null:
return $default(_that.isActive,_that.openedAt,_that.closedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShiftEntity implements ShiftEntity {
  const _ShiftEntity({required this.isActive, this.openedAt, this.closedAt});
  factory _ShiftEntity.fromJson(Map<String, dynamic> json) => _$ShiftEntityFromJson(json);

@override final  bool isActive;
@override final  String? openedAt;
@override final  String? closedAt;

/// Create a copy of ShiftEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftEntityCopyWith<_ShiftEntity> get copyWith => __$ShiftEntityCopyWithImpl<_ShiftEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShiftEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShiftEntity&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.openedAt, openedAt) || other.openedAt == openedAt)&&(identical(other.closedAt, closedAt) || other.closedAt == closedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isActive,openedAt,closedAt);

@override
String toString() {
  return 'ShiftEntity(isActive: $isActive, openedAt: $openedAt, closedAt: $closedAt)';
}


}

/// @nodoc
abstract mixin class _$ShiftEntityCopyWith<$Res> implements $ShiftEntityCopyWith<$Res> {
  factory _$ShiftEntityCopyWith(_ShiftEntity value, $Res Function(_ShiftEntity) _then) = __$ShiftEntityCopyWithImpl;
@override @useResult
$Res call({
 bool isActive, String? openedAt, String? closedAt
});




}
/// @nodoc
class __$ShiftEntityCopyWithImpl<$Res>
    implements _$ShiftEntityCopyWith<$Res> {
  __$ShiftEntityCopyWithImpl(this._self, this._then);

  final _ShiftEntity _self;
  final $Res Function(_ShiftEntity) _then;

/// Create a copy of ShiftEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isActive = null,Object? openedAt = freezed,Object? closedAt = freezed,}) {
  return _then(_ShiftEntity(
isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,openedAt: freezed == openedAt ? _self.openedAt : openedAt // ignore: cast_nullable_to_non_nullable
as String?,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
