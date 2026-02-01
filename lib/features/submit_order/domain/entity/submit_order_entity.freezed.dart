// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_order_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubmitOrderEntity {

 int get orderId; int get tariffId; bool get isDefect; List<String> get defectPhotos; double get weight;
/// Create a copy of SubmitOrderEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitOrderEntityCopyWith<SubmitOrderEntity> get copyWith => _$SubmitOrderEntityCopyWithImpl<SubmitOrderEntity>(this as SubmitOrderEntity, _$identity);

  /// Serializes this SubmitOrderEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitOrderEntity&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.tariffId, tariffId) || other.tariffId == tariffId)&&(identical(other.isDefect, isDefect) || other.isDefect == isDefect)&&const DeepCollectionEquality().equals(other.defectPhotos, defectPhotos)&&(identical(other.weight, weight) || other.weight == weight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,tariffId,isDefect,const DeepCollectionEquality().hash(defectPhotos),weight);

@override
String toString() {
  return 'SubmitOrderEntity(orderId: $orderId, tariffId: $tariffId, isDefect: $isDefect, defectPhotos: $defectPhotos, weight: $weight)';
}


}

/// @nodoc
abstract mixin class $SubmitOrderEntityCopyWith<$Res>  {
  factory $SubmitOrderEntityCopyWith(SubmitOrderEntity value, $Res Function(SubmitOrderEntity) _then) = _$SubmitOrderEntityCopyWithImpl;
@useResult
$Res call({
 int orderId, int tariffId, bool isDefect, List<String> defectPhotos, double weight
});




}
/// @nodoc
class _$SubmitOrderEntityCopyWithImpl<$Res>
    implements $SubmitOrderEntityCopyWith<$Res> {
  _$SubmitOrderEntityCopyWithImpl(this._self, this._then);

  final SubmitOrderEntity _self;
  final $Res Function(SubmitOrderEntity) _then;

/// Create a copy of SubmitOrderEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,Object? tariffId = null,Object? isDefect = null,Object? defectPhotos = null,Object? weight = null,}) {
  return _then(_self.copyWith(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,tariffId: null == tariffId ? _self.tariffId : tariffId // ignore: cast_nullable_to_non_nullable
as int,isDefect: null == isDefect ? _self.isDefect : isDefect // ignore: cast_nullable_to_non_nullable
as bool,defectPhotos: null == defectPhotos ? _self.defectPhotos : defectPhotos // ignore: cast_nullable_to_non_nullable
as List<String>,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SubmitOrderEntity].
extension SubmitOrderEntityPatterns on SubmitOrderEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmitOrderEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmitOrderEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmitOrderEntity value)  $default,){
final _that = this;
switch (_that) {
case _SubmitOrderEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmitOrderEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SubmitOrderEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int orderId,  int tariffId,  bool isDefect,  List<String> defectPhotos,  double weight)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmitOrderEntity() when $default != null:
return $default(_that.orderId,_that.tariffId,_that.isDefect,_that.defectPhotos,_that.weight);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int orderId,  int tariffId,  bool isDefect,  List<String> defectPhotos,  double weight)  $default,) {final _that = this;
switch (_that) {
case _SubmitOrderEntity():
return $default(_that.orderId,_that.tariffId,_that.isDefect,_that.defectPhotos,_that.weight);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int orderId,  int tariffId,  bool isDefect,  List<String> defectPhotos,  double weight)?  $default,) {final _that = this;
switch (_that) {
case _SubmitOrderEntity() when $default != null:
return $default(_that.orderId,_that.tariffId,_that.isDefect,_that.defectPhotos,_that.weight);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubmitOrderEntity implements SubmitOrderEntity {
  const _SubmitOrderEntity({required this.orderId, required this.tariffId, required this.isDefect, required final  List<String> defectPhotos, required this.weight}): _defectPhotos = defectPhotos;
  factory _SubmitOrderEntity.fromJson(Map<String, dynamic> json) => _$SubmitOrderEntityFromJson(json);

@override final  int orderId;
@override final  int tariffId;
@override final  bool isDefect;
 final  List<String> _defectPhotos;
@override List<String> get defectPhotos {
  if (_defectPhotos is EqualUnmodifiableListView) return _defectPhotos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_defectPhotos);
}

@override final  double weight;

/// Create a copy of SubmitOrderEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitOrderEntityCopyWith<_SubmitOrderEntity> get copyWith => __$SubmitOrderEntityCopyWithImpl<_SubmitOrderEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmitOrderEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitOrderEntity&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.tariffId, tariffId) || other.tariffId == tariffId)&&(identical(other.isDefect, isDefect) || other.isDefect == isDefect)&&const DeepCollectionEquality().equals(other._defectPhotos, _defectPhotos)&&(identical(other.weight, weight) || other.weight == weight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,tariffId,isDefect,const DeepCollectionEquality().hash(_defectPhotos),weight);

@override
String toString() {
  return 'SubmitOrderEntity(orderId: $orderId, tariffId: $tariffId, isDefect: $isDefect, defectPhotos: $defectPhotos, weight: $weight)';
}


}

/// @nodoc
abstract mixin class _$SubmitOrderEntityCopyWith<$Res> implements $SubmitOrderEntityCopyWith<$Res> {
  factory _$SubmitOrderEntityCopyWith(_SubmitOrderEntity value, $Res Function(_SubmitOrderEntity) _then) = __$SubmitOrderEntityCopyWithImpl;
@override @useResult
$Res call({
 int orderId, int tariffId, bool isDefect, List<String> defectPhotos, double weight
});




}
/// @nodoc
class __$SubmitOrderEntityCopyWithImpl<$Res>
    implements _$SubmitOrderEntityCopyWith<$Res> {
  __$SubmitOrderEntityCopyWithImpl(this._self, this._then);

  final _SubmitOrderEntity _self;
  final $Res Function(_SubmitOrderEntity) _then;

/// Create a copy of SubmitOrderEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? tariffId = null,Object? isDefect = null,Object? defectPhotos = null,Object? weight = null,}) {
  return _then(_SubmitOrderEntity(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,tariffId: null == tariffId ? _self.tariffId : tariffId // ignore: cast_nullable_to_non_nullable
as int,isDefect: null == isDefect ? _self.isDefect : isDefect // ignore: cast_nullable_to_non_nullable
as bool,defectPhotos: null == defectPhotos ? _self._defectPhotos : defectPhotos // ignore: cast_nullable_to_non_nullable
as List<String>,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
