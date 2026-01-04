// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_code_result_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignCodeResultEntity {

 bool get success; String? get accessToken; String? get refreshToken; String? get userId;
/// Create a copy of SignCodeResultEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignCodeResultEntityCopyWith<SignCodeResultEntity> get copyWith => _$SignCodeResultEntityCopyWithImpl<SignCodeResultEntity>(this as SignCodeResultEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignCodeResultEntity&&(identical(other.success, success) || other.success == success)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,success,accessToken,refreshToken,userId);

@override
String toString() {
  return 'SignCodeResultEntity(success: $success, accessToken: $accessToken, refreshToken: $refreshToken, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $SignCodeResultEntityCopyWith<$Res>  {
  factory $SignCodeResultEntityCopyWith(SignCodeResultEntity value, $Res Function(SignCodeResultEntity) _then) = _$SignCodeResultEntityCopyWithImpl;
@useResult
$Res call({
 bool success, String? accessToken, String? refreshToken, String? userId
});




}
/// @nodoc
class _$SignCodeResultEntityCopyWithImpl<$Res>
    implements $SignCodeResultEntityCopyWith<$Res> {
  _$SignCodeResultEntityCopyWithImpl(this._self, this._then);

  final SignCodeResultEntity _self;
  final $Res Function(SignCodeResultEntity) _then;

/// Create a copy of SignCodeResultEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? accessToken = freezed,Object? refreshToken = freezed,Object? userId = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SignCodeResultEntity].
extension SignCodeResultEntityPatterns on SignCodeResultEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignCodeResultEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignCodeResultEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignCodeResultEntity value)  $default,){
final _that = this;
switch (_that) {
case _SignCodeResultEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignCodeResultEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SignCodeResultEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String? accessToken,  String? refreshToken,  String? userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignCodeResultEntity() when $default != null:
return $default(_that.success,_that.accessToken,_that.refreshToken,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String? accessToken,  String? refreshToken,  String? userId)  $default,) {final _that = this;
switch (_that) {
case _SignCodeResultEntity():
return $default(_that.success,_that.accessToken,_that.refreshToken,_that.userId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String? accessToken,  String? refreshToken,  String? userId)?  $default,) {final _that = this;
switch (_that) {
case _SignCodeResultEntity() when $default != null:
return $default(_that.success,_that.accessToken,_that.refreshToken,_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class _SignCodeResultEntity implements SignCodeResultEntity {
  const _SignCodeResultEntity({required this.success, this.accessToken, this.refreshToken, this.userId});
  

@override final  bool success;
@override final  String? accessToken;
@override final  String? refreshToken;
@override final  String? userId;

/// Create a copy of SignCodeResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignCodeResultEntityCopyWith<_SignCodeResultEntity> get copyWith => __$SignCodeResultEntityCopyWithImpl<_SignCodeResultEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignCodeResultEntity&&(identical(other.success, success) || other.success == success)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,success,accessToken,refreshToken,userId);

@override
String toString() {
  return 'SignCodeResultEntity(success: $success, accessToken: $accessToken, refreshToken: $refreshToken, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$SignCodeResultEntityCopyWith<$Res> implements $SignCodeResultEntityCopyWith<$Res> {
  factory _$SignCodeResultEntityCopyWith(_SignCodeResultEntity value, $Res Function(_SignCodeResultEntity) _then) = __$SignCodeResultEntityCopyWithImpl;
@override @useResult
$Res call({
 bool success, String? accessToken, String? refreshToken, String? userId
});




}
/// @nodoc
class __$SignCodeResultEntityCopyWithImpl<$Res>
    implements _$SignCodeResultEntityCopyWith<$Res> {
  __$SignCodeResultEntityCopyWithImpl(this._self, this._then);

  final _SignCodeResultEntity _self;
  final $Res Function(_SignCodeResultEntity) _then;

/// Create a copy of SignCodeResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? accessToken = freezed,Object? refreshToken = freezed,Object? userId = freezed,}) {
  return _then(_SignCodeResultEntity(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
