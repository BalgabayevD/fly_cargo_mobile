// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'decline_order_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeclineOrderEntity {

 int get orderId; String get decideReason; String get decideDescription;
/// Create a copy of DeclineOrderEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeclineOrderEntityCopyWith<DeclineOrderEntity> get copyWith => _$DeclineOrderEntityCopyWithImpl<DeclineOrderEntity>(this as DeclineOrderEntity, _$identity);

  /// Serializes this DeclineOrderEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeclineOrderEntity&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.decideReason, decideReason) || other.decideReason == decideReason)&&(identical(other.decideDescription, decideDescription) || other.decideDescription == decideDescription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,decideReason,decideDescription);

@override
String toString() {
  return 'DeclineOrderEntity(orderId: $orderId, decideReason: $decideReason, decideDescription: $decideDescription)';
}


}

/// @nodoc
abstract mixin class $DeclineOrderEntityCopyWith<$Res>  {
  factory $DeclineOrderEntityCopyWith(DeclineOrderEntity value, $Res Function(DeclineOrderEntity) _then) = _$DeclineOrderEntityCopyWithImpl;
@useResult
$Res call({
 int orderId, String decideReason, String decideDescription
});




}
/// @nodoc
class _$DeclineOrderEntityCopyWithImpl<$Res>
    implements $DeclineOrderEntityCopyWith<$Res> {
  _$DeclineOrderEntityCopyWithImpl(this._self, this._then);

  final DeclineOrderEntity _self;
  final $Res Function(DeclineOrderEntity) _then;

/// Create a copy of DeclineOrderEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,Object? decideReason = null,Object? decideDescription = null,}) {
  return _then(_self.copyWith(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,decideReason: null == decideReason ? _self.decideReason : decideReason // ignore: cast_nullable_to_non_nullable
as String,decideDescription: null == decideDescription ? _self.decideDescription : decideDescription // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeclineOrderEntity].
extension DeclineOrderEntityPatterns on DeclineOrderEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeclineOrderEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeclineOrderEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeclineOrderEntity value)  $default,){
final _that = this;
switch (_that) {
case _DeclineOrderEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeclineOrderEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DeclineOrderEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int orderId,  String decideReason,  String decideDescription)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeclineOrderEntity() when $default != null:
return $default(_that.orderId,_that.decideReason,_that.decideDescription);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int orderId,  String decideReason,  String decideDescription)  $default,) {final _that = this;
switch (_that) {
case _DeclineOrderEntity():
return $default(_that.orderId,_that.decideReason,_that.decideDescription);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int orderId,  String decideReason,  String decideDescription)?  $default,) {final _that = this;
switch (_that) {
case _DeclineOrderEntity() when $default != null:
return $default(_that.orderId,_that.decideReason,_that.decideDescription);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeclineOrderEntity implements DeclineOrderEntity {
  const _DeclineOrderEntity({required this.orderId, required this.decideReason, required this.decideDescription});
  factory _DeclineOrderEntity.fromJson(Map<String, dynamic> json) => _$DeclineOrderEntityFromJson(json);

@override final  int orderId;
@override final  String decideReason;
@override final  String decideDescription;

/// Create a copy of DeclineOrderEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeclineOrderEntityCopyWith<_DeclineOrderEntity> get copyWith => __$DeclineOrderEntityCopyWithImpl<_DeclineOrderEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeclineOrderEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeclineOrderEntity&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.decideReason, decideReason) || other.decideReason == decideReason)&&(identical(other.decideDescription, decideDescription) || other.decideDescription == decideDescription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,decideReason,decideDescription);

@override
String toString() {
  return 'DeclineOrderEntity(orderId: $orderId, decideReason: $decideReason, decideDescription: $decideDescription)';
}


}

/// @nodoc
abstract mixin class _$DeclineOrderEntityCopyWith<$Res> implements $DeclineOrderEntityCopyWith<$Res> {
  factory _$DeclineOrderEntityCopyWith(_DeclineOrderEntity value, $Res Function(_DeclineOrderEntity) _then) = __$DeclineOrderEntityCopyWithImpl;
@override @useResult
$Res call({
 int orderId, String decideReason, String decideDescription
});




}
/// @nodoc
class __$DeclineOrderEntityCopyWithImpl<$Res>
    implements _$DeclineOrderEntityCopyWith<$Res> {
  __$DeclineOrderEntityCopyWithImpl(this._self, this._then);

  final _DeclineOrderEntity _self;
  final $Res Function(_DeclineOrderEntity) _then;

/// Create a copy of DeclineOrderEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? decideReason = null,Object? decideDescription = null,}) {
  return _then(_DeclineOrderEntity(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,decideReason: null == decideReason ? _self.decideReason : decideReason // ignore: cast_nullable_to_non_nullable
as String,decideDescription: null == decideDescription ? _self.decideDescription : decideDescription // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
