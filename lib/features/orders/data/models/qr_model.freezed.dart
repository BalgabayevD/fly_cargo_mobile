// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QrModel {

 int? get id; String? get createdAt; String? get updatedAt; int? get orderId; String? get target; String? get uuid;
/// Create a copy of QrModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrModelCopyWith<QrModel> get copyWith => _$QrModelCopyWithImpl<QrModel>(this as QrModel, _$identity);

  /// Serializes this QrModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QrModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.target, target) || other.target == target)&&(identical(other.uuid, uuid) || other.uuid == uuid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,orderId,target,uuid);

@override
String toString() {
  return 'QrModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, orderId: $orderId, target: $target, uuid: $uuid)';
}


}

/// @nodoc
abstract mixin class $QrModelCopyWith<$Res>  {
  factory $QrModelCopyWith(QrModel value, $Res Function(QrModel) _then) = _$QrModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? createdAt, String? updatedAt, int? orderId, String? target, String? uuid
});




}
/// @nodoc
class _$QrModelCopyWithImpl<$Res>
    implements $QrModelCopyWith<$Res> {
  _$QrModelCopyWithImpl(this._self, this._then);

  final QrModel _self;
  final $Res Function(QrModel) _then;

/// Create a copy of QrModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? orderId = freezed,Object? target = freezed,Object? uuid = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int?,target: freezed == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String?,uuid: freezed == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [QrModel].
extension QrModelPatterns on QrModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QrModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QrModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QrModel value)  $default,){
final _that = this;
switch (_that) {
case _QrModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QrModel value)?  $default,){
final _that = this;
switch (_that) {
case _QrModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? createdAt,  String? updatedAt,  int? orderId,  String? target,  String? uuid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QrModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.orderId,_that.target,_that.uuid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? createdAt,  String? updatedAt,  int? orderId,  String? target,  String? uuid)  $default,) {final _that = this;
switch (_that) {
case _QrModel():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.orderId,_that.target,_that.uuid);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? createdAt,  String? updatedAt,  int? orderId,  String? target,  String? uuid)?  $default,) {final _that = this;
switch (_that) {
case _QrModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.orderId,_that.target,_that.uuid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QrModel implements QrModel {
  const _QrModel({this.id, this.createdAt, this.updatedAt, this.orderId, this.target, this.uuid});
  factory _QrModel.fromJson(Map<String, dynamic> json) => _$QrModelFromJson(json);

@override final  int? id;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  int? orderId;
@override final  String? target;
@override final  String? uuid;

/// Create a copy of QrModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrModelCopyWith<_QrModel> get copyWith => __$QrModelCopyWithImpl<_QrModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QrModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.target, target) || other.target == target)&&(identical(other.uuid, uuid) || other.uuid == uuid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,orderId,target,uuid);

@override
String toString() {
  return 'QrModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, orderId: $orderId, target: $target, uuid: $uuid)';
}


}

/// @nodoc
abstract mixin class _$QrModelCopyWith<$Res> implements $QrModelCopyWith<$Res> {
  factory _$QrModelCopyWith(_QrModel value, $Res Function(_QrModel) _then) = __$QrModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? createdAt, String? updatedAt, int? orderId, String? target, String? uuid
});




}
/// @nodoc
class __$QrModelCopyWithImpl<$Res>
    implements _$QrModelCopyWith<$Res> {
  __$QrModelCopyWithImpl(this._self, this._then);

  final _QrModel _self;
  final $Res Function(_QrModel) _then;

/// Create a copy of QrModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? orderId = freezed,Object? target = freezed,Object? uuid = freezed,}) {
  return _then(_QrModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int?,target: freezed == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String?,uuid: freezed == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
