// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderHistoryModel {

 int? get id; String? get createdAt; String? get updatedAt; int? get orderId; String? get status; String? get userId; String? get comment;
/// Create a copy of OrderHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderHistoryModelCopyWith<OrderHistoryModel> get copyWith => _$OrderHistoryModelCopyWithImpl<OrderHistoryModel>(this as OrderHistoryModel, _$identity);

  /// Serializes this OrderHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.status, status) || other.status == status)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,orderId,status,userId,comment);

@override
String toString() {
  return 'OrderHistoryModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, orderId: $orderId, status: $status, userId: $userId, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $OrderHistoryModelCopyWith<$Res>  {
  factory $OrderHistoryModelCopyWith(OrderHistoryModel value, $Res Function(OrderHistoryModel) _then) = _$OrderHistoryModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? createdAt, String? updatedAt, int? orderId, String? status, String? userId, String? comment
});




}
/// @nodoc
class _$OrderHistoryModelCopyWithImpl<$Res>
    implements $OrderHistoryModelCopyWith<$Res> {
  _$OrderHistoryModelCopyWithImpl(this._self, this._then);

  final OrderHistoryModel _self;
  final $Res Function(OrderHistoryModel) _then;

/// Create a copy of OrderHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? orderId = freezed,Object? status = freezed,Object? userId = freezed,Object? comment = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderHistoryModel].
extension OrderHistoryModelPatterns on OrderHistoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderHistoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderHistoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderHistoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? createdAt,  String? updatedAt,  int? orderId,  String? status,  String? userId,  String? comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderHistoryModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.orderId,_that.status,_that.userId,_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? createdAt,  String? updatedAt,  int? orderId,  String? status,  String? userId,  String? comment)  $default,) {final _that = this;
switch (_that) {
case _OrderHistoryModel():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.orderId,_that.status,_that.userId,_that.comment);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? createdAt,  String? updatedAt,  int? orderId,  String? status,  String? userId,  String? comment)?  $default,) {final _that = this;
switch (_that) {
case _OrderHistoryModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.orderId,_that.status,_that.userId,_that.comment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderHistoryModel implements OrderHistoryModel {
  const _OrderHistoryModel({this.id, this.createdAt, this.updatedAt, this.orderId, this.status, this.userId, this.comment});
  factory _OrderHistoryModel.fromJson(Map<String, dynamic> json) => _$OrderHistoryModelFromJson(json);

@override final  int? id;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  int? orderId;
@override final  String? status;
@override final  String? userId;
@override final  String? comment;

/// Create a copy of OrderHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderHistoryModelCopyWith<_OrderHistoryModel> get copyWith => __$OrderHistoryModelCopyWithImpl<_OrderHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.status, status) || other.status == status)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,orderId,status,userId,comment);

@override
String toString() {
  return 'OrderHistoryModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, orderId: $orderId, status: $status, userId: $userId, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$OrderHistoryModelCopyWith<$Res> implements $OrderHistoryModelCopyWith<$Res> {
  factory _$OrderHistoryModelCopyWith(_OrderHistoryModel value, $Res Function(_OrderHistoryModel) _then) = __$OrderHistoryModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? createdAt, String? updatedAt, int? orderId, String? status, String? userId, String? comment
});




}
/// @nodoc
class __$OrderHistoryModelCopyWithImpl<$Res>
    implements _$OrderHistoryModelCopyWith<$Res> {
  __$OrderHistoryModelCopyWithImpl(this._self, this._then);

  final _OrderHistoryModel _self;
  final $Res Function(_OrderHistoryModel) _then;

/// Create a copy of OrderHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? orderId = freezed,Object? status = freezed,Object? userId = freezed,Object? comment = freezed,}) {
  return _then(_OrderHistoryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
