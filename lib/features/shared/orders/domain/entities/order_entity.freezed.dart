// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderCityEntity {

 String get name; String get country; String get createdAt; String get updatedAt; int? get id; String? get deletedAt;
/// Create a copy of OrderCityEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCityEntityCopyWith<OrderCityEntity> get copyWith => _$OrderCityEntityCopyWithImpl<OrderCityEntity>(this as OrderCityEntity, _$identity);

  /// Serializes this OrderCityEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderCityEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,country,createdAt,updatedAt,id,deletedAt);

@override
String toString() {
  return 'OrderCityEntity(name: $name, country: $country, createdAt: $createdAt, updatedAt: $updatedAt, id: $id, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $OrderCityEntityCopyWith<$Res>  {
  factory $OrderCityEntityCopyWith(OrderCityEntity value, $Res Function(OrderCityEntity) _then) = _$OrderCityEntityCopyWithImpl;
@useResult
$Res call({
 String name, String country, String createdAt, String updatedAt, int? id, String? deletedAt
});




}
/// @nodoc
class _$OrderCityEntityCopyWithImpl<$Res>
    implements $OrderCityEntityCopyWith<$Res> {
  _$OrderCityEntityCopyWithImpl(this._self, this._then);

  final OrderCityEntity _self;
  final $Res Function(OrderCityEntity) _then;

/// Create a copy of OrderCityEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? country = null,Object? createdAt = null,Object? updatedAt = null,Object? id = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderCityEntity].
extension OrderCityEntityPatterns on OrderCityEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderCityEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderCityEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderCityEntity value)  $default,){
final _that = this;
switch (_that) {
case _OrderCityEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderCityEntity value)?  $default,){
final _that = this;
switch (_that) {
case _OrderCityEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String country,  String createdAt,  String updatedAt,  int? id,  String? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderCityEntity() when $default != null:
return $default(_that.name,_that.country,_that.createdAt,_that.updatedAt,_that.id,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String country,  String createdAt,  String updatedAt,  int? id,  String? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _OrderCityEntity():
return $default(_that.name,_that.country,_that.createdAt,_that.updatedAt,_that.id,_that.deletedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String country,  String createdAt,  String updatedAt,  int? id,  String? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _OrderCityEntity() when $default != null:
return $default(_that.name,_that.country,_that.createdAt,_that.updatedAt,_that.id,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderCityEntity implements OrderCityEntity {
  const _OrderCityEntity({required this.name, required this.country, required this.createdAt, required this.updatedAt, this.id, this.deletedAt});
  factory _OrderCityEntity.fromJson(Map<String, dynamic> json) => _$OrderCityEntityFromJson(json);

@override final  String name;
@override final  String country;
@override final  String createdAt;
@override final  String updatedAt;
@override final  int? id;
@override final  String? deletedAt;

/// Create a copy of OrderCityEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCityEntityCopyWith<_OrderCityEntity> get copyWith => __$OrderCityEntityCopyWithImpl<_OrderCityEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderCityEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderCityEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,country,createdAt,updatedAt,id,deletedAt);

@override
String toString() {
  return 'OrderCityEntity(name: $name, country: $country, createdAt: $createdAt, updatedAt: $updatedAt, id: $id, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$OrderCityEntityCopyWith<$Res> implements $OrderCityEntityCopyWith<$Res> {
  factory _$OrderCityEntityCopyWith(_OrderCityEntity value, $Res Function(_OrderCityEntity) _then) = __$OrderCityEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, String country, String createdAt, String updatedAt, int? id, String? deletedAt
});




}
/// @nodoc
class __$OrderCityEntityCopyWithImpl<$Res>
    implements _$OrderCityEntityCopyWith<$Res> {
  __$OrderCityEntityCopyWithImpl(this._self, this._then);

  final _OrderCityEntity _self;
  final $Res Function(_OrderCityEntity) _then;

/// Create a copy of OrderCityEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? country = null,Object? createdAt = null,Object? updatedAt = null,Object? id = freezed,Object? deletedAt = freezed,}) {
  return _then(_OrderCityEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OrderHistoryEntity {

 int? get id; String? get createdAt; String? get updatedAt; String? get deletedAt; int? get orderId; String? get status; String? get userId; String? get comment; String? get description; String? get parameters;
/// Create a copy of OrderHistoryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderHistoryEntityCopyWith<OrderHistoryEntity> get copyWith => _$OrderHistoryEntityCopyWithImpl<OrderHistoryEntity>(this as OrderHistoryEntity, _$identity);

  /// Serializes this OrderHistoryEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderHistoryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.status, status) || other.status == status)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.description, description) || other.description == description)&&(identical(other.parameters, parameters) || other.parameters == parameters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,deletedAt,orderId,status,userId,comment,description,parameters);

@override
String toString() {
  return 'OrderHistoryEntity(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, orderId: $orderId, status: $status, userId: $userId, comment: $comment, description: $description, parameters: $parameters)';
}


}

/// @nodoc
abstract mixin class $OrderHistoryEntityCopyWith<$Res>  {
  factory $OrderHistoryEntityCopyWith(OrderHistoryEntity value, $Res Function(OrderHistoryEntity) _then) = _$OrderHistoryEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String? createdAt, String? updatedAt, String? deletedAt, int? orderId, String? status, String? userId, String? comment, String? description, String? parameters
});




}
/// @nodoc
class _$OrderHistoryEntityCopyWithImpl<$Res>
    implements $OrderHistoryEntityCopyWith<$Res> {
  _$OrderHistoryEntityCopyWithImpl(this._self, this._then);

  final OrderHistoryEntity _self;
  final $Res Function(OrderHistoryEntity) _then;

/// Create a copy of OrderHistoryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? orderId = freezed,Object? status = freezed,Object? userId = freezed,Object? comment = freezed,Object? description = freezed,Object? parameters = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,parameters: freezed == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderHistoryEntity].
extension OrderHistoryEntityPatterns on OrderHistoryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderHistoryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderHistoryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderHistoryEntity value)  $default,){
final _that = this;
switch (_that) {
case _OrderHistoryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderHistoryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _OrderHistoryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? createdAt,  String? updatedAt,  String? deletedAt,  int? orderId,  String? status,  String? userId,  String? comment,  String? description,  String? parameters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderHistoryEntity() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.orderId,_that.status,_that.userId,_that.comment,_that.description,_that.parameters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? createdAt,  String? updatedAt,  String? deletedAt,  int? orderId,  String? status,  String? userId,  String? comment,  String? description,  String? parameters)  $default,) {final _that = this;
switch (_that) {
case _OrderHistoryEntity():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.orderId,_that.status,_that.userId,_that.comment,_that.description,_that.parameters);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? createdAt,  String? updatedAt,  String? deletedAt,  int? orderId,  String? status,  String? userId,  String? comment,  String? description,  String? parameters)?  $default,) {final _that = this;
switch (_that) {
case _OrderHistoryEntity() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.orderId,_that.status,_that.userId,_that.comment,_that.description,_that.parameters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderHistoryEntity implements OrderHistoryEntity {
  const _OrderHistoryEntity({this.id, this.createdAt, this.updatedAt, this.deletedAt, this.orderId, this.status, this.userId, this.comment, this.description, this.parameters});
  factory _OrderHistoryEntity.fromJson(Map<String, dynamic> json) => _$OrderHistoryEntityFromJson(json);

@override final  int? id;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  String? deletedAt;
@override final  int? orderId;
@override final  String? status;
@override final  String? userId;
@override final  String? comment;
@override final  String? description;
@override final  String? parameters;

/// Create a copy of OrderHistoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderHistoryEntityCopyWith<_OrderHistoryEntity> get copyWith => __$OrderHistoryEntityCopyWithImpl<_OrderHistoryEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderHistoryEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderHistoryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.status, status) || other.status == status)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.description, description) || other.description == description)&&(identical(other.parameters, parameters) || other.parameters == parameters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,deletedAt,orderId,status,userId,comment,description,parameters);

@override
String toString() {
  return 'OrderHistoryEntity(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, orderId: $orderId, status: $status, userId: $userId, comment: $comment, description: $description, parameters: $parameters)';
}


}

/// @nodoc
abstract mixin class _$OrderHistoryEntityCopyWith<$Res> implements $OrderHistoryEntityCopyWith<$Res> {
  factory _$OrderHistoryEntityCopyWith(_OrderHistoryEntity value, $Res Function(_OrderHistoryEntity) _then) = __$OrderHistoryEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? createdAt, String? updatedAt, String? deletedAt, int? orderId, String? status, String? userId, String? comment, String? description, String? parameters
});




}
/// @nodoc
class __$OrderHistoryEntityCopyWithImpl<$Res>
    implements _$OrderHistoryEntityCopyWith<$Res> {
  __$OrderHistoryEntityCopyWithImpl(this._self, this._then);

  final _OrderHistoryEntity _self;
  final $Res Function(_OrderHistoryEntity) _then;

/// Create a copy of OrderHistoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? orderId = freezed,Object? status = freezed,Object? userId = freezed,Object? comment = freezed,Object? description = freezed,Object? parameters = freezed,}) {
  return _then(_OrderHistoryEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,parameters: freezed == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OrderIdentificationEntity {

 int? get id; String? get createdAt; String? get updatedAt; int? get orderId; String? get target; String? get uuid;
/// Create a copy of OrderIdentificationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderIdentificationEntityCopyWith<OrderIdentificationEntity> get copyWith => _$OrderIdentificationEntityCopyWithImpl<OrderIdentificationEntity>(this as OrderIdentificationEntity, _$identity);

  /// Serializes this OrderIdentificationEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderIdentificationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.target, target) || other.target == target)&&(identical(other.uuid, uuid) || other.uuid == uuid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,orderId,target,uuid);

@override
String toString() {
  return 'OrderIdentificationEntity(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, orderId: $orderId, target: $target, uuid: $uuid)';
}


}

/// @nodoc
abstract mixin class $OrderIdentificationEntityCopyWith<$Res>  {
  factory $OrderIdentificationEntityCopyWith(OrderIdentificationEntity value, $Res Function(OrderIdentificationEntity) _then) = _$OrderIdentificationEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String? createdAt, String? updatedAt, int? orderId, String? target, String? uuid
});




}
/// @nodoc
class _$OrderIdentificationEntityCopyWithImpl<$Res>
    implements $OrderIdentificationEntityCopyWith<$Res> {
  _$OrderIdentificationEntityCopyWithImpl(this._self, this._then);

  final OrderIdentificationEntity _self;
  final $Res Function(OrderIdentificationEntity) _then;

/// Create a copy of OrderIdentificationEntity
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


/// Adds pattern-matching-related methods to [OrderIdentificationEntity].
extension OrderIdentificationEntityPatterns on OrderIdentificationEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderIdentificationEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderIdentificationEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderIdentificationEntity value)  $default,){
final _that = this;
switch (_that) {
case _OrderIdentificationEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderIdentificationEntity value)?  $default,){
final _that = this;
switch (_that) {
case _OrderIdentificationEntity() when $default != null:
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
case _OrderIdentificationEntity() when $default != null:
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
case _OrderIdentificationEntity():
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
case _OrderIdentificationEntity() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.orderId,_that.target,_that.uuid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderIdentificationEntity implements OrderIdentificationEntity {
  const _OrderIdentificationEntity({this.id, this.createdAt, this.updatedAt, this.orderId, this.target, this.uuid});
  factory _OrderIdentificationEntity.fromJson(Map<String, dynamic> json) => _$OrderIdentificationEntityFromJson(json);

@override final  int? id;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  int? orderId;
@override final  String? target;
@override final  String? uuid;

/// Create a copy of OrderIdentificationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderIdentificationEntityCopyWith<_OrderIdentificationEntity> get copyWith => __$OrderIdentificationEntityCopyWithImpl<_OrderIdentificationEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderIdentificationEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderIdentificationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.target, target) || other.target == target)&&(identical(other.uuid, uuid) || other.uuid == uuid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,orderId,target,uuid);

@override
String toString() {
  return 'OrderIdentificationEntity(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, orderId: $orderId, target: $target, uuid: $uuid)';
}


}

/// @nodoc
abstract mixin class _$OrderIdentificationEntityCopyWith<$Res> implements $OrderIdentificationEntityCopyWith<$Res> {
  factory _$OrderIdentificationEntityCopyWith(_OrderIdentificationEntity value, $Res Function(_OrderIdentificationEntity) _then) = __$OrderIdentificationEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? createdAt, String? updatedAt, int? orderId, String? target, String? uuid
});




}
/// @nodoc
class __$OrderIdentificationEntityCopyWithImpl<$Res>
    implements _$OrderIdentificationEntityCopyWith<$Res> {
  __$OrderIdentificationEntityCopyWithImpl(this._self, this._then);

  final _OrderIdentificationEntity _self;
  final $Res Function(_OrderIdentificationEntity) _then;

/// Create a copy of OrderIdentificationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? orderId = freezed,Object? target = freezed,Object? uuid = freezed,}) {
  return _then(_OrderIdentificationEntity(
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


/// @nodoc
mixin _$QrEntity {

 int? get id; String? get createdAt; String? get updatedAt; int? get orderId; String? get target; String? get uuid;
/// Create a copy of QrEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrEntityCopyWith<QrEntity> get copyWith => _$QrEntityCopyWithImpl<QrEntity>(this as QrEntity, _$identity);

  /// Serializes this QrEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QrEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.target, target) || other.target == target)&&(identical(other.uuid, uuid) || other.uuid == uuid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,orderId,target,uuid);

@override
String toString() {
  return 'QrEntity(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, orderId: $orderId, target: $target, uuid: $uuid)';
}


}

/// @nodoc
abstract mixin class $QrEntityCopyWith<$Res>  {
  factory $QrEntityCopyWith(QrEntity value, $Res Function(QrEntity) _then) = _$QrEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String? createdAt, String? updatedAt, int? orderId, String? target, String? uuid
});




}
/// @nodoc
class _$QrEntityCopyWithImpl<$Res>
    implements $QrEntityCopyWith<$Res> {
  _$QrEntityCopyWithImpl(this._self, this._then);

  final QrEntity _self;
  final $Res Function(QrEntity) _then;

/// Create a copy of QrEntity
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


/// Adds pattern-matching-related methods to [QrEntity].
extension QrEntityPatterns on QrEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QrEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QrEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QrEntity value)  $default,){
final _that = this;
switch (_that) {
case _QrEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QrEntity value)?  $default,){
final _that = this;
switch (_that) {
case _QrEntity() when $default != null:
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
case _QrEntity() when $default != null:
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
case _QrEntity():
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
case _QrEntity() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.orderId,_that.target,_that.uuid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QrEntity implements QrEntity {
  const _QrEntity({this.id, this.createdAt, this.updatedAt, this.orderId, this.target, this.uuid});
  factory _QrEntity.fromJson(Map<String, dynamic> json) => _$QrEntityFromJson(json);

@override final  int? id;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  int? orderId;
@override final  String? target;
@override final  String? uuid;

/// Create a copy of QrEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrEntityCopyWith<_QrEntity> get copyWith => __$QrEntityCopyWithImpl<_QrEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QrEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.target, target) || other.target == target)&&(identical(other.uuid, uuid) || other.uuid == uuid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,orderId,target,uuid);

@override
String toString() {
  return 'QrEntity(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, orderId: $orderId, target: $target, uuid: $uuid)';
}


}

/// @nodoc
abstract mixin class _$QrEntityCopyWith<$Res> implements $QrEntityCopyWith<$Res> {
  factory _$QrEntityCopyWith(_QrEntity value, $Res Function(_QrEntity) _then) = __$QrEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? createdAt, String? updatedAt, int? orderId, String? target, String? uuid
});




}
/// @nodoc
class __$QrEntityCopyWithImpl<$Res>
    implements _$QrEntityCopyWith<$Res> {
  __$QrEntityCopyWithImpl(this._self, this._then);

  final _QrEntity _self;
  final $Res Function(_QrEntity) _then;

/// Create a copy of QrEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? orderId = freezed,Object? target = freezed,Object? uuid = freezed,}) {
  return _then(_QrEntity(
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

/// @nodoc
mixin _$PriceCalculationEntity {

 String get createdAt; String get updatedAt; int? get id; String? get deletedAt; double? get length; double? get height; double? get width; double? get volumetricWeight; double? get weight; double? get invoiceWeight; double? get costPriceOfAirShipment; double? get totalCostOfAirCargoShipment; double? get courierExpensesAroundTheCityFromFixedSalary; double? get courierExpensesAroundTheCityUponReceiptIfGoods; double? get averageCourierFuelOerOrder; double? get carDepreciationExpense; double? get averageProductPackagingPerUnit; double? get additionalCostForFragileCargo; double? get tax; double? get bankCommission; double? get tariffCostInExpenses; double? get sellingPrice; double? get salesRevenue; double? get totalConsumptionPerOrder; double? get marginality; double? get netProfit; double? get orderProfitabilityPercentage; double? get plannedMarkup;
/// Create a copy of PriceCalculationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PriceCalculationEntityCopyWith<PriceCalculationEntity> get copyWith => _$PriceCalculationEntityCopyWithImpl<PriceCalculationEntity>(this as PriceCalculationEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PriceCalculationEntity&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.length, length) || other.length == length)&&(identical(other.height, height) || other.height == height)&&(identical(other.width, width) || other.width == width)&&(identical(other.volumetricWeight, volumetricWeight) || other.volumetricWeight == volumetricWeight)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.invoiceWeight, invoiceWeight) || other.invoiceWeight == invoiceWeight)&&(identical(other.costPriceOfAirShipment, costPriceOfAirShipment) || other.costPriceOfAirShipment == costPriceOfAirShipment)&&(identical(other.totalCostOfAirCargoShipment, totalCostOfAirCargoShipment) || other.totalCostOfAirCargoShipment == totalCostOfAirCargoShipment)&&(identical(other.courierExpensesAroundTheCityFromFixedSalary, courierExpensesAroundTheCityFromFixedSalary) || other.courierExpensesAroundTheCityFromFixedSalary == courierExpensesAroundTheCityFromFixedSalary)&&(identical(other.courierExpensesAroundTheCityUponReceiptIfGoods, courierExpensesAroundTheCityUponReceiptIfGoods) || other.courierExpensesAroundTheCityUponReceiptIfGoods == courierExpensesAroundTheCityUponReceiptIfGoods)&&(identical(other.averageCourierFuelOerOrder, averageCourierFuelOerOrder) || other.averageCourierFuelOerOrder == averageCourierFuelOerOrder)&&(identical(other.carDepreciationExpense, carDepreciationExpense) || other.carDepreciationExpense == carDepreciationExpense)&&(identical(other.averageProductPackagingPerUnit, averageProductPackagingPerUnit) || other.averageProductPackagingPerUnit == averageProductPackagingPerUnit)&&(identical(other.additionalCostForFragileCargo, additionalCostForFragileCargo) || other.additionalCostForFragileCargo == additionalCostForFragileCargo)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.bankCommission, bankCommission) || other.bankCommission == bankCommission)&&(identical(other.tariffCostInExpenses, tariffCostInExpenses) || other.tariffCostInExpenses == tariffCostInExpenses)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.salesRevenue, salesRevenue) || other.salesRevenue == salesRevenue)&&(identical(other.totalConsumptionPerOrder, totalConsumptionPerOrder) || other.totalConsumptionPerOrder == totalConsumptionPerOrder)&&(identical(other.marginality, marginality) || other.marginality == marginality)&&(identical(other.netProfit, netProfit) || other.netProfit == netProfit)&&(identical(other.orderProfitabilityPercentage, orderProfitabilityPercentage) || other.orderProfitabilityPercentage == orderProfitabilityPercentage)&&(identical(other.plannedMarkup, plannedMarkup) || other.plannedMarkup == plannedMarkup));
}


@override
int get hashCode => Object.hashAll([runtimeType,createdAt,updatedAt,id,deletedAt,length,height,width,volumetricWeight,weight,invoiceWeight,costPriceOfAirShipment,totalCostOfAirCargoShipment,courierExpensesAroundTheCityFromFixedSalary,courierExpensesAroundTheCityUponReceiptIfGoods,averageCourierFuelOerOrder,carDepreciationExpense,averageProductPackagingPerUnit,additionalCostForFragileCargo,tax,bankCommission,tariffCostInExpenses,sellingPrice,salesRevenue,totalConsumptionPerOrder,marginality,netProfit,orderProfitabilityPercentage,plannedMarkup]);

@override
String toString() {
  return 'PriceCalculationEntity(createdAt: $createdAt, updatedAt: $updatedAt, id: $id, deletedAt: $deletedAt, length: $length, height: $height, width: $width, volumetricWeight: $volumetricWeight, weight: $weight, invoiceWeight: $invoiceWeight, costPriceOfAirShipment: $costPriceOfAirShipment, totalCostOfAirCargoShipment: $totalCostOfAirCargoShipment, courierExpensesAroundTheCityFromFixedSalary: $courierExpensesAroundTheCityFromFixedSalary, courierExpensesAroundTheCityUponReceiptIfGoods: $courierExpensesAroundTheCityUponReceiptIfGoods, averageCourierFuelOerOrder: $averageCourierFuelOerOrder, carDepreciationExpense: $carDepreciationExpense, averageProductPackagingPerUnit: $averageProductPackagingPerUnit, additionalCostForFragileCargo: $additionalCostForFragileCargo, tax: $tax, bankCommission: $bankCommission, tariffCostInExpenses: $tariffCostInExpenses, sellingPrice: $sellingPrice, salesRevenue: $salesRevenue, totalConsumptionPerOrder: $totalConsumptionPerOrder, marginality: $marginality, netProfit: $netProfit, orderProfitabilityPercentage: $orderProfitabilityPercentage, plannedMarkup: $plannedMarkup)';
}


}

/// @nodoc
abstract mixin class $PriceCalculationEntityCopyWith<$Res>  {
  factory $PriceCalculationEntityCopyWith(PriceCalculationEntity value, $Res Function(PriceCalculationEntity) _then) = _$PriceCalculationEntityCopyWithImpl;
@useResult
$Res call({
 String createdAt, String updatedAt, int? id, String? deletedAt, double? length, double? height, double? width, double? volumetricWeight, double? weight, double? invoiceWeight, double? costPriceOfAirShipment, double? totalCostOfAirCargoShipment, double? courierExpensesAroundTheCityFromFixedSalary, double? courierExpensesAroundTheCityUponReceiptIfGoods, double? averageCourierFuelOerOrder, double? carDepreciationExpense, double? averageProductPackagingPerUnit, double? additionalCostForFragileCargo, double? tax, double? bankCommission, double? tariffCostInExpenses, double? sellingPrice, double? salesRevenue, double? totalConsumptionPerOrder, double? marginality, double? netProfit, double? orderProfitabilityPercentage, double? plannedMarkup
});




}
/// @nodoc
class _$PriceCalculationEntityCopyWithImpl<$Res>
    implements $PriceCalculationEntityCopyWith<$Res> {
  _$PriceCalculationEntityCopyWithImpl(this._self, this._then);

  final PriceCalculationEntity _self;
  final $Res Function(PriceCalculationEntity) _then;

/// Create a copy of PriceCalculationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = null,Object? updatedAt = null,Object? id = freezed,Object? deletedAt = freezed,Object? length = freezed,Object? height = freezed,Object? width = freezed,Object? volumetricWeight = freezed,Object? weight = freezed,Object? invoiceWeight = freezed,Object? costPriceOfAirShipment = freezed,Object? totalCostOfAirCargoShipment = freezed,Object? courierExpensesAroundTheCityFromFixedSalary = freezed,Object? courierExpensesAroundTheCityUponReceiptIfGoods = freezed,Object? averageCourierFuelOerOrder = freezed,Object? carDepreciationExpense = freezed,Object? averageProductPackagingPerUnit = freezed,Object? additionalCostForFragileCargo = freezed,Object? tax = freezed,Object? bankCommission = freezed,Object? tariffCostInExpenses = freezed,Object? sellingPrice = freezed,Object? salesRevenue = freezed,Object? totalConsumptionPerOrder = freezed,Object? marginality = freezed,Object? netProfit = freezed,Object? orderProfitabilityPercentage = freezed,Object? plannedMarkup = freezed,}) {
  return _then(_self.copyWith(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,volumetricWeight: freezed == volumetricWeight ? _self.volumetricWeight : volumetricWeight // ignore: cast_nullable_to_non_nullable
as double?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,invoiceWeight: freezed == invoiceWeight ? _self.invoiceWeight : invoiceWeight // ignore: cast_nullable_to_non_nullable
as double?,costPriceOfAirShipment: freezed == costPriceOfAirShipment ? _self.costPriceOfAirShipment : costPriceOfAirShipment // ignore: cast_nullable_to_non_nullable
as double?,totalCostOfAirCargoShipment: freezed == totalCostOfAirCargoShipment ? _self.totalCostOfAirCargoShipment : totalCostOfAirCargoShipment // ignore: cast_nullable_to_non_nullable
as double?,courierExpensesAroundTheCityFromFixedSalary: freezed == courierExpensesAroundTheCityFromFixedSalary ? _self.courierExpensesAroundTheCityFromFixedSalary : courierExpensesAroundTheCityFromFixedSalary // ignore: cast_nullable_to_non_nullable
as double?,courierExpensesAroundTheCityUponReceiptIfGoods: freezed == courierExpensesAroundTheCityUponReceiptIfGoods ? _self.courierExpensesAroundTheCityUponReceiptIfGoods : courierExpensesAroundTheCityUponReceiptIfGoods // ignore: cast_nullable_to_non_nullable
as double?,averageCourierFuelOerOrder: freezed == averageCourierFuelOerOrder ? _self.averageCourierFuelOerOrder : averageCourierFuelOerOrder // ignore: cast_nullable_to_non_nullable
as double?,carDepreciationExpense: freezed == carDepreciationExpense ? _self.carDepreciationExpense : carDepreciationExpense // ignore: cast_nullable_to_non_nullable
as double?,averageProductPackagingPerUnit: freezed == averageProductPackagingPerUnit ? _self.averageProductPackagingPerUnit : averageProductPackagingPerUnit // ignore: cast_nullable_to_non_nullable
as double?,additionalCostForFragileCargo: freezed == additionalCostForFragileCargo ? _self.additionalCostForFragileCargo : additionalCostForFragileCargo // ignore: cast_nullable_to_non_nullable
as double?,tax: freezed == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as double?,bankCommission: freezed == bankCommission ? _self.bankCommission : bankCommission // ignore: cast_nullable_to_non_nullable
as double?,tariffCostInExpenses: freezed == tariffCostInExpenses ? _self.tariffCostInExpenses : tariffCostInExpenses // ignore: cast_nullable_to_non_nullable
as double?,sellingPrice: freezed == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as double?,salesRevenue: freezed == salesRevenue ? _self.salesRevenue : salesRevenue // ignore: cast_nullable_to_non_nullable
as double?,totalConsumptionPerOrder: freezed == totalConsumptionPerOrder ? _self.totalConsumptionPerOrder : totalConsumptionPerOrder // ignore: cast_nullable_to_non_nullable
as double?,marginality: freezed == marginality ? _self.marginality : marginality // ignore: cast_nullable_to_non_nullable
as double?,netProfit: freezed == netProfit ? _self.netProfit : netProfit // ignore: cast_nullable_to_non_nullable
as double?,orderProfitabilityPercentage: freezed == orderProfitabilityPercentage ? _self.orderProfitabilityPercentage : orderProfitabilityPercentage // ignore: cast_nullable_to_non_nullable
as double?,plannedMarkup: freezed == plannedMarkup ? _self.plannedMarkup : plannedMarkup // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [PriceCalculationEntity].
extension PriceCalculationEntityPatterns on PriceCalculationEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PriceCalculationEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PriceCalculationEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PriceCalculationEntity value)  $default,){
final _that = this;
switch (_that) {
case _PriceCalculationEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PriceCalculationEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PriceCalculationEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String createdAt,  String updatedAt,  int? id,  String? deletedAt,  double? length,  double? height,  double? width,  double? volumetricWeight,  double? weight,  double? invoiceWeight,  double? costPriceOfAirShipment,  double? totalCostOfAirCargoShipment,  double? courierExpensesAroundTheCityFromFixedSalary,  double? courierExpensesAroundTheCityUponReceiptIfGoods,  double? averageCourierFuelOerOrder,  double? carDepreciationExpense,  double? averageProductPackagingPerUnit,  double? additionalCostForFragileCargo,  double? tax,  double? bankCommission,  double? tariffCostInExpenses,  double? sellingPrice,  double? salesRevenue,  double? totalConsumptionPerOrder,  double? marginality,  double? netProfit,  double? orderProfitabilityPercentage,  double? plannedMarkup)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PriceCalculationEntity() when $default != null:
return $default(_that.createdAt,_that.updatedAt,_that.id,_that.deletedAt,_that.length,_that.height,_that.width,_that.volumetricWeight,_that.weight,_that.invoiceWeight,_that.costPriceOfAirShipment,_that.totalCostOfAirCargoShipment,_that.courierExpensesAroundTheCityFromFixedSalary,_that.courierExpensesAroundTheCityUponReceiptIfGoods,_that.averageCourierFuelOerOrder,_that.carDepreciationExpense,_that.averageProductPackagingPerUnit,_that.additionalCostForFragileCargo,_that.tax,_that.bankCommission,_that.tariffCostInExpenses,_that.sellingPrice,_that.salesRevenue,_that.totalConsumptionPerOrder,_that.marginality,_that.netProfit,_that.orderProfitabilityPercentage,_that.plannedMarkup);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String createdAt,  String updatedAt,  int? id,  String? deletedAt,  double? length,  double? height,  double? width,  double? volumetricWeight,  double? weight,  double? invoiceWeight,  double? costPriceOfAirShipment,  double? totalCostOfAirCargoShipment,  double? courierExpensesAroundTheCityFromFixedSalary,  double? courierExpensesAroundTheCityUponReceiptIfGoods,  double? averageCourierFuelOerOrder,  double? carDepreciationExpense,  double? averageProductPackagingPerUnit,  double? additionalCostForFragileCargo,  double? tax,  double? bankCommission,  double? tariffCostInExpenses,  double? sellingPrice,  double? salesRevenue,  double? totalConsumptionPerOrder,  double? marginality,  double? netProfit,  double? orderProfitabilityPercentage,  double? plannedMarkup)  $default,) {final _that = this;
switch (_that) {
case _PriceCalculationEntity():
return $default(_that.createdAt,_that.updatedAt,_that.id,_that.deletedAt,_that.length,_that.height,_that.width,_that.volumetricWeight,_that.weight,_that.invoiceWeight,_that.costPriceOfAirShipment,_that.totalCostOfAirCargoShipment,_that.courierExpensesAroundTheCityFromFixedSalary,_that.courierExpensesAroundTheCityUponReceiptIfGoods,_that.averageCourierFuelOerOrder,_that.carDepreciationExpense,_that.averageProductPackagingPerUnit,_that.additionalCostForFragileCargo,_that.tax,_that.bankCommission,_that.tariffCostInExpenses,_that.sellingPrice,_that.salesRevenue,_that.totalConsumptionPerOrder,_that.marginality,_that.netProfit,_that.orderProfitabilityPercentage,_that.plannedMarkup);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String createdAt,  String updatedAt,  int? id,  String? deletedAt,  double? length,  double? height,  double? width,  double? volumetricWeight,  double? weight,  double? invoiceWeight,  double? costPriceOfAirShipment,  double? totalCostOfAirCargoShipment,  double? courierExpensesAroundTheCityFromFixedSalary,  double? courierExpensesAroundTheCityUponReceiptIfGoods,  double? averageCourierFuelOerOrder,  double? carDepreciationExpense,  double? averageProductPackagingPerUnit,  double? additionalCostForFragileCargo,  double? tax,  double? bankCommission,  double? tariffCostInExpenses,  double? sellingPrice,  double? salesRevenue,  double? totalConsumptionPerOrder,  double? marginality,  double? netProfit,  double? orderProfitabilityPercentage,  double? plannedMarkup)?  $default,) {final _that = this;
switch (_that) {
case _PriceCalculationEntity() when $default != null:
return $default(_that.createdAt,_that.updatedAt,_that.id,_that.deletedAt,_that.length,_that.height,_that.width,_that.volumetricWeight,_that.weight,_that.invoiceWeight,_that.costPriceOfAirShipment,_that.totalCostOfAirCargoShipment,_that.courierExpensesAroundTheCityFromFixedSalary,_that.courierExpensesAroundTheCityUponReceiptIfGoods,_that.averageCourierFuelOerOrder,_that.carDepreciationExpense,_that.averageProductPackagingPerUnit,_that.additionalCostForFragileCargo,_that.tax,_that.bankCommission,_that.tariffCostInExpenses,_that.sellingPrice,_that.salesRevenue,_that.totalConsumptionPerOrder,_that.marginality,_that.netProfit,_that.orderProfitabilityPercentage,_that.plannedMarkup);case _:
  return null;

}
}

}

/// @nodoc


class _PriceCalculationEntity implements PriceCalculationEntity {
  const _PriceCalculationEntity({required this.createdAt, required this.updatedAt, this.id, this.deletedAt, this.length, this.height, this.width, this.volumetricWeight, this.weight, this.invoiceWeight, this.costPriceOfAirShipment, this.totalCostOfAirCargoShipment, this.courierExpensesAroundTheCityFromFixedSalary, this.courierExpensesAroundTheCityUponReceiptIfGoods, this.averageCourierFuelOerOrder, this.carDepreciationExpense, this.averageProductPackagingPerUnit, this.additionalCostForFragileCargo, this.tax, this.bankCommission, this.tariffCostInExpenses, this.sellingPrice, this.salesRevenue, this.totalConsumptionPerOrder, this.marginality, this.netProfit, this.orderProfitabilityPercentage, this.plannedMarkup});
  

@override final  String createdAt;
@override final  String updatedAt;
@override final  int? id;
@override final  String? deletedAt;
@override final  double? length;
@override final  double? height;
@override final  double? width;
@override final  double? volumetricWeight;
@override final  double? weight;
@override final  double? invoiceWeight;
@override final  double? costPriceOfAirShipment;
@override final  double? totalCostOfAirCargoShipment;
@override final  double? courierExpensesAroundTheCityFromFixedSalary;
@override final  double? courierExpensesAroundTheCityUponReceiptIfGoods;
@override final  double? averageCourierFuelOerOrder;
@override final  double? carDepreciationExpense;
@override final  double? averageProductPackagingPerUnit;
@override final  double? additionalCostForFragileCargo;
@override final  double? tax;
@override final  double? bankCommission;
@override final  double? tariffCostInExpenses;
@override final  double? sellingPrice;
@override final  double? salesRevenue;
@override final  double? totalConsumptionPerOrder;
@override final  double? marginality;
@override final  double? netProfit;
@override final  double? orderProfitabilityPercentage;
@override final  double? plannedMarkup;

/// Create a copy of PriceCalculationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PriceCalculationEntityCopyWith<_PriceCalculationEntity> get copyWith => __$PriceCalculationEntityCopyWithImpl<_PriceCalculationEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PriceCalculationEntity&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.length, length) || other.length == length)&&(identical(other.height, height) || other.height == height)&&(identical(other.width, width) || other.width == width)&&(identical(other.volumetricWeight, volumetricWeight) || other.volumetricWeight == volumetricWeight)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.invoiceWeight, invoiceWeight) || other.invoiceWeight == invoiceWeight)&&(identical(other.costPriceOfAirShipment, costPriceOfAirShipment) || other.costPriceOfAirShipment == costPriceOfAirShipment)&&(identical(other.totalCostOfAirCargoShipment, totalCostOfAirCargoShipment) || other.totalCostOfAirCargoShipment == totalCostOfAirCargoShipment)&&(identical(other.courierExpensesAroundTheCityFromFixedSalary, courierExpensesAroundTheCityFromFixedSalary) || other.courierExpensesAroundTheCityFromFixedSalary == courierExpensesAroundTheCityFromFixedSalary)&&(identical(other.courierExpensesAroundTheCityUponReceiptIfGoods, courierExpensesAroundTheCityUponReceiptIfGoods) || other.courierExpensesAroundTheCityUponReceiptIfGoods == courierExpensesAroundTheCityUponReceiptIfGoods)&&(identical(other.averageCourierFuelOerOrder, averageCourierFuelOerOrder) || other.averageCourierFuelOerOrder == averageCourierFuelOerOrder)&&(identical(other.carDepreciationExpense, carDepreciationExpense) || other.carDepreciationExpense == carDepreciationExpense)&&(identical(other.averageProductPackagingPerUnit, averageProductPackagingPerUnit) || other.averageProductPackagingPerUnit == averageProductPackagingPerUnit)&&(identical(other.additionalCostForFragileCargo, additionalCostForFragileCargo) || other.additionalCostForFragileCargo == additionalCostForFragileCargo)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.bankCommission, bankCommission) || other.bankCommission == bankCommission)&&(identical(other.tariffCostInExpenses, tariffCostInExpenses) || other.tariffCostInExpenses == tariffCostInExpenses)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.salesRevenue, salesRevenue) || other.salesRevenue == salesRevenue)&&(identical(other.totalConsumptionPerOrder, totalConsumptionPerOrder) || other.totalConsumptionPerOrder == totalConsumptionPerOrder)&&(identical(other.marginality, marginality) || other.marginality == marginality)&&(identical(other.netProfit, netProfit) || other.netProfit == netProfit)&&(identical(other.orderProfitabilityPercentage, orderProfitabilityPercentage) || other.orderProfitabilityPercentage == orderProfitabilityPercentage)&&(identical(other.plannedMarkup, plannedMarkup) || other.plannedMarkup == plannedMarkup));
}


@override
int get hashCode => Object.hashAll([runtimeType,createdAt,updatedAt,id,deletedAt,length,height,width,volumetricWeight,weight,invoiceWeight,costPriceOfAirShipment,totalCostOfAirCargoShipment,courierExpensesAroundTheCityFromFixedSalary,courierExpensesAroundTheCityUponReceiptIfGoods,averageCourierFuelOerOrder,carDepreciationExpense,averageProductPackagingPerUnit,additionalCostForFragileCargo,tax,bankCommission,tariffCostInExpenses,sellingPrice,salesRevenue,totalConsumptionPerOrder,marginality,netProfit,orderProfitabilityPercentage,plannedMarkup]);

@override
String toString() {
  return 'PriceCalculationEntity(createdAt: $createdAt, updatedAt: $updatedAt, id: $id, deletedAt: $deletedAt, length: $length, height: $height, width: $width, volumetricWeight: $volumetricWeight, weight: $weight, invoiceWeight: $invoiceWeight, costPriceOfAirShipment: $costPriceOfAirShipment, totalCostOfAirCargoShipment: $totalCostOfAirCargoShipment, courierExpensesAroundTheCityFromFixedSalary: $courierExpensesAroundTheCityFromFixedSalary, courierExpensesAroundTheCityUponReceiptIfGoods: $courierExpensesAroundTheCityUponReceiptIfGoods, averageCourierFuelOerOrder: $averageCourierFuelOerOrder, carDepreciationExpense: $carDepreciationExpense, averageProductPackagingPerUnit: $averageProductPackagingPerUnit, additionalCostForFragileCargo: $additionalCostForFragileCargo, tax: $tax, bankCommission: $bankCommission, tariffCostInExpenses: $tariffCostInExpenses, sellingPrice: $sellingPrice, salesRevenue: $salesRevenue, totalConsumptionPerOrder: $totalConsumptionPerOrder, marginality: $marginality, netProfit: $netProfit, orderProfitabilityPercentage: $orderProfitabilityPercentage, plannedMarkup: $plannedMarkup)';
}


}

/// @nodoc
abstract mixin class _$PriceCalculationEntityCopyWith<$Res> implements $PriceCalculationEntityCopyWith<$Res> {
  factory _$PriceCalculationEntityCopyWith(_PriceCalculationEntity value, $Res Function(_PriceCalculationEntity) _then) = __$PriceCalculationEntityCopyWithImpl;
@override @useResult
$Res call({
 String createdAt, String updatedAt, int? id, String? deletedAt, double? length, double? height, double? width, double? volumetricWeight, double? weight, double? invoiceWeight, double? costPriceOfAirShipment, double? totalCostOfAirCargoShipment, double? courierExpensesAroundTheCityFromFixedSalary, double? courierExpensesAroundTheCityUponReceiptIfGoods, double? averageCourierFuelOerOrder, double? carDepreciationExpense, double? averageProductPackagingPerUnit, double? additionalCostForFragileCargo, double? tax, double? bankCommission, double? tariffCostInExpenses, double? sellingPrice, double? salesRevenue, double? totalConsumptionPerOrder, double? marginality, double? netProfit, double? orderProfitabilityPercentage, double? plannedMarkup
});




}
/// @nodoc
class __$PriceCalculationEntityCopyWithImpl<$Res>
    implements _$PriceCalculationEntityCopyWith<$Res> {
  __$PriceCalculationEntityCopyWithImpl(this._self, this._then);

  final _PriceCalculationEntity _self;
  final $Res Function(_PriceCalculationEntity) _then;

/// Create a copy of PriceCalculationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = null,Object? updatedAt = null,Object? id = freezed,Object? deletedAt = freezed,Object? length = freezed,Object? height = freezed,Object? width = freezed,Object? volumetricWeight = freezed,Object? weight = freezed,Object? invoiceWeight = freezed,Object? costPriceOfAirShipment = freezed,Object? totalCostOfAirCargoShipment = freezed,Object? courierExpensesAroundTheCityFromFixedSalary = freezed,Object? courierExpensesAroundTheCityUponReceiptIfGoods = freezed,Object? averageCourierFuelOerOrder = freezed,Object? carDepreciationExpense = freezed,Object? averageProductPackagingPerUnit = freezed,Object? additionalCostForFragileCargo = freezed,Object? tax = freezed,Object? bankCommission = freezed,Object? tariffCostInExpenses = freezed,Object? sellingPrice = freezed,Object? salesRevenue = freezed,Object? totalConsumptionPerOrder = freezed,Object? marginality = freezed,Object? netProfit = freezed,Object? orderProfitabilityPercentage = freezed,Object? plannedMarkup = freezed,}) {
  return _then(_PriceCalculationEntity(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,volumetricWeight: freezed == volumetricWeight ? _self.volumetricWeight : volumetricWeight // ignore: cast_nullable_to_non_nullable
as double?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,invoiceWeight: freezed == invoiceWeight ? _self.invoiceWeight : invoiceWeight // ignore: cast_nullable_to_non_nullable
as double?,costPriceOfAirShipment: freezed == costPriceOfAirShipment ? _self.costPriceOfAirShipment : costPriceOfAirShipment // ignore: cast_nullable_to_non_nullable
as double?,totalCostOfAirCargoShipment: freezed == totalCostOfAirCargoShipment ? _self.totalCostOfAirCargoShipment : totalCostOfAirCargoShipment // ignore: cast_nullable_to_non_nullable
as double?,courierExpensesAroundTheCityFromFixedSalary: freezed == courierExpensesAroundTheCityFromFixedSalary ? _self.courierExpensesAroundTheCityFromFixedSalary : courierExpensesAroundTheCityFromFixedSalary // ignore: cast_nullable_to_non_nullable
as double?,courierExpensesAroundTheCityUponReceiptIfGoods: freezed == courierExpensesAroundTheCityUponReceiptIfGoods ? _self.courierExpensesAroundTheCityUponReceiptIfGoods : courierExpensesAroundTheCityUponReceiptIfGoods // ignore: cast_nullable_to_non_nullable
as double?,averageCourierFuelOerOrder: freezed == averageCourierFuelOerOrder ? _self.averageCourierFuelOerOrder : averageCourierFuelOerOrder // ignore: cast_nullable_to_non_nullable
as double?,carDepreciationExpense: freezed == carDepreciationExpense ? _self.carDepreciationExpense : carDepreciationExpense // ignore: cast_nullable_to_non_nullable
as double?,averageProductPackagingPerUnit: freezed == averageProductPackagingPerUnit ? _self.averageProductPackagingPerUnit : averageProductPackagingPerUnit // ignore: cast_nullable_to_non_nullable
as double?,additionalCostForFragileCargo: freezed == additionalCostForFragileCargo ? _self.additionalCostForFragileCargo : additionalCostForFragileCargo // ignore: cast_nullable_to_non_nullable
as double?,tax: freezed == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as double?,bankCommission: freezed == bankCommission ? _self.bankCommission : bankCommission // ignore: cast_nullable_to_non_nullable
as double?,tariffCostInExpenses: freezed == tariffCostInExpenses ? _self.tariffCostInExpenses : tariffCostInExpenses // ignore: cast_nullable_to_non_nullable
as double?,sellingPrice: freezed == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as double?,salesRevenue: freezed == salesRevenue ? _self.salesRevenue : salesRevenue // ignore: cast_nullable_to_non_nullable
as double?,totalConsumptionPerOrder: freezed == totalConsumptionPerOrder ? _self.totalConsumptionPerOrder : totalConsumptionPerOrder // ignore: cast_nullable_to_non_nullable
as double?,marginality: freezed == marginality ? _self.marginality : marginality // ignore: cast_nullable_to_non_nullable
as double?,netProfit: freezed == netProfit ? _self.netProfit : netProfit // ignore: cast_nullable_to_non_nullable
as double?,orderProfitabilityPercentage: freezed == orderProfitabilityPercentage ? _self.orderProfitabilityPercentage : orderProfitabilityPercentage // ignore: cast_nullable_to_non_nullable
as double?,plannedMarkup: freezed == plannedMarkup ? _self.plannedMarkup : plannedMarkup // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$OrderTariffEntity {

 String get createdAt; String get updatedAt; bool get isActive; String get name; String get description; String get image; int? get id; String? get deletedAt; int? get icon; int? get sortIndex; List<String>? get fields; int? get tariffCategoryId; double? get length; double? get height; double? get width; double? get volumetricWeight; double? get weight; double? get invoiceWeight; double? get costPriceOfAirShipment; int? get packageId; double? get additionalCostForFragileCargo;
/// Create a copy of OrderTariffEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderTariffEntityCopyWith<OrderTariffEntity> get copyWith => _$OrderTariffEntityCopyWithImpl<OrderTariffEntity>(this as OrderTariffEntity, _$identity);

  /// Serializes this OrderTariffEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderTariffEntity&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.id, id) || other.id == id)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.sortIndex, sortIndex) || other.sortIndex == sortIndex)&&const DeepCollectionEquality().equals(other.fields, fields)&&(identical(other.tariffCategoryId, tariffCategoryId) || other.tariffCategoryId == tariffCategoryId)&&(identical(other.length, length) || other.length == length)&&(identical(other.height, height) || other.height == height)&&(identical(other.width, width) || other.width == width)&&(identical(other.volumetricWeight, volumetricWeight) || other.volumetricWeight == volumetricWeight)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.invoiceWeight, invoiceWeight) || other.invoiceWeight == invoiceWeight)&&(identical(other.costPriceOfAirShipment, costPriceOfAirShipment) || other.costPriceOfAirShipment == costPriceOfAirShipment)&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.additionalCostForFragileCargo, additionalCostForFragileCargo) || other.additionalCostForFragileCargo == additionalCostForFragileCargo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,createdAt,updatedAt,isActive,name,description,image,id,deletedAt,icon,sortIndex,const DeepCollectionEquality().hash(fields),tariffCategoryId,length,height,width,volumetricWeight,weight,invoiceWeight,costPriceOfAirShipment,packageId,additionalCostForFragileCargo]);

@override
String toString() {
  return 'OrderTariffEntity(createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, name: $name, description: $description, image: $image, id: $id, deletedAt: $deletedAt, icon: $icon, sortIndex: $sortIndex, fields: $fields, tariffCategoryId: $tariffCategoryId, length: $length, height: $height, width: $width, volumetricWeight: $volumetricWeight, weight: $weight, invoiceWeight: $invoiceWeight, costPriceOfAirShipment: $costPriceOfAirShipment, packageId: $packageId, additionalCostForFragileCargo: $additionalCostForFragileCargo)';
}


}

/// @nodoc
abstract mixin class $OrderTariffEntityCopyWith<$Res>  {
  factory $OrderTariffEntityCopyWith(OrderTariffEntity value, $Res Function(OrderTariffEntity) _then) = _$OrderTariffEntityCopyWithImpl;
@useResult
$Res call({
 String createdAt, String updatedAt, bool isActive, String name, String description, String image, int? id, String? deletedAt, int? icon, int? sortIndex, List<String>? fields, int? tariffCategoryId, double? length, double? height, double? width, double? volumetricWeight, double? weight, double? invoiceWeight, double? costPriceOfAirShipment, int? packageId, double? additionalCostForFragileCargo
});




}
/// @nodoc
class _$OrderTariffEntityCopyWithImpl<$Res>
    implements $OrderTariffEntityCopyWith<$Res> {
  _$OrderTariffEntityCopyWithImpl(this._self, this._then);

  final OrderTariffEntity _self;
  final $Res Function(OrderTariffEntity) _then;

/// Create a copy of OrderTariffEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = null,Object? updatedAt = null,Object? isActive = null,Object? name = null,Object? description = null,Object? image = null,Object? id = freezed,Object? deletedAt = freezed,Object? icon = freezed,Object? sortIndex = freezed,Object? fields = freezed,Object? tariffCategoryId = freezed,Object? length = freezed,Object? height = freezed,Object? width = freezed,Object? volumetricWeight = freezed,Object? weight = freezed,Object? invoiceWeight = freezed,Object? costPriceOfAirShipment = freezed,Object? packageId = freezed,Object? additionalCostForFragileCargo = freezed,}) {
  return _then(_self.copyWith(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as int?,sortIndex: freezed == sortIndex ? _self.sortIndex : sortIndex // ignore: cast_nullable_to_non_nullable
as int?,fields: freezed == fields ? _self.fields : fields // ignore: cast_nullable_to_non_nullable
as List<String>?,tariffCategoryId: freezed == tariffCategoryId ? _self.tariffCategoryId : tariffCategoryId // ignore: cast_nullable_to_non_nullable
as int?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,volumetricWeight: freezed == volumetricWeight ? _self.volumetricWeight : volumetricWeight // ignore: cast_nullable_to_non_nullable
as double?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,invoiceWeight: freezed == invoiceWeight ? _self.invoiceWeight : invoiceWeight // ignore: cast_nullable_to_non_nullable
as double?,costPriceOfAirShipment: freezed == costPriceOfAirShipment ? _self.costPriceOfAirShipment : costPriceOfAirShipment // ignore: cast_nullable_to_non_nullable
as double?,packageId: freezed == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as int?,additionalCostForFragileCargo: freezed == additionalCostForFragileCargo ? _self.additionalCostForFragileCargo : additionalCostForFragileCargo // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderTariffEntity].
extension OrderTariffEntityPatterns on OrderTariffEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderTariffEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderTariffEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderTariffEntity value)  $default,){
final _that = this;
switch (_that) {
case _OrderTariffEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderTariffEntity value)?  $default,){
final _that = this;
switch (_that) {
case _OrderTariffEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String createdAt,  String updatedAt,  bool isActive,  String name,  String description,  String image,  int? id,  String? deletedAt,  int? icon,  int? sortIndex,  List<String>? fields,  int? tariffCategoryId,  double? length,  double? height,  double? width,  double? volumetricWeight,  double? weight,  double? invoiceWeight,  double? costPriceOfAirShipment,  int? packageId,  double? additionalCostForFragileCargo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderTariffEntity() when $default != null:
return $default(_that.createdAt,_that.updatedAt,_that.isActive,_that.name,_that.description,_that.image,_that.id,_that.deletedAt,_that.icon,_that.sortIndex,_that.fields,_that.tariffCategoryId,_that.length,_that.height,_that.width,_that.volumetricWeight,_that.weight,_that.invoiceWeight,_that.costPriceOfAirShipment,_that.packageId,_that.additionalCostForFragileCargo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String createdAt,  String updatedAt,  bool isActive,  String name,  String description,  String image,  int? id,  String? deletedAt,  int? icon,  int? sortIndex,  List<String>? fields,  int? tariffCategoryId,  double? length,  double? height,  double? width,  double? volumetricWeight,  double? weight,  double? invoiceWeight,  double? costPriceOfAirShipment,  int? packageId,  double? additionalCostForFragileCargo)  $default,) {final _that = this;
switch (_that) {
case _OrderTariffEntity():
return $default(_that.createdAt,_that.updatedAt,_that.isActive,_that.name,_that.description,_that.image,_that.id,_that.deletedAt,_that.icon,_that.sortIndex,_that.fields,_that.tariffCategoryId,_that.length,_that.height,_that.width,_that.volumetricWeight,_that.weight,_that.invoiceWeight,_that.costPriceOfAirShipment,_that.packageId,_that.additionalCostForFragileCargo);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String createdAt,  String updatedAt,  bool isActive,  String name,  String description,  String image,  int? id,  String? deletedAt,  int? icon,  int? sortIndex,  List<String>? fields,  int? tariffCategoryId,  double? length,  double? height,  double? width,  double? volumetricWeight,  double? weight,  double? invoiceWeight,  double? costPriceOfAirShipment,  int? packageId,  double? additionalCostForFragileCargo)?  $default,) {final _that = this;
switch (_that) {
case _OrderTariffEntity() when $default != null:
return $default(_that.createdAt,_that.updatedAt,_that.isActive,_that.name,_that.description,_that.image,_that.id,_that.deletedAt,_that.icon,_that.sortIndex,_that.fields,_that.tariffCategoryId,_that.length,_that.height,_that.width,_that.volumetricWeight,_that.weight,_that.invoiceWeight,_that.costPriceOfAirShipment,_that.packageId,_that.additionalCostForFragileCargo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderTariffEntity implements OrderTariffEntity {
  const _OrderTariffEntity({required this.createdAt, required this.updatedAt, required this.isActive, required this.name, required this.description, required this.image, this.id, this.deletedAt, this.icon, this.sortIndex, final  List<String>? fields, this.tariffCategoryId, this.length, this.height, this.width, this.volumetricWeight, this.weight, this.invoiceWeight, this.costPriceOfAirShipment, this.packageId, this.additionalCostForFragileCargo}): _fields = fields;
  factory _OrderTariffEntity.fromJson(Map<String, dynamic> json) => _$OrderTariffEntityFromJson(json);

@override final  String createdAt;
@override final  String updatedAt;
@override final  bool isActive;
@override final  String name;
@override final  String description;
@override final  String image;
@override final  int? id;
@override final  String? deletedAt;
@override final  int? icon;
@override final  int? sortIndex;
 final  List<String>? _fields;
@override List<String>? get fields {
  final value = _fields;
  if (value == null) return null;
  if (_fields is EqualUnmodifiableListView) return _fields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? tariffCategoryId;
@override final  double? length;
@override final  double? height;
@override final  double? width;
@override final  double? volumetricWeight;
@override final  double? weight;
@override final  double? invoiceWeight;
@override final  double? costPriceOfAirShipment;
@override final  int? packageId;
@override final  double? additionalCostForFragileCargo;

/// Create a copy of OrderTariffEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderTariffEntityCopyWith<_OrderTariffEntity> get copyWith => __$OrderTariffEntityCopyWithImpl<_OrderTariffEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderTariffEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderTariffEntity&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.id, id) || other.id == id)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.sortIndex, sortIndex) || other.sortIndex == sortIndex)&&const DeepCollectionEquality().equals(other._fields, _fields)&&(identical(other.tariffCategoryId, tariffCategoryId) || other.tariffCategoryId == tariffCategoryId)&&(identical(other.length, length) || other.length == length)&&(identical(other.height, height) || other.height == height)&&(identical(other.width, width) || other.width == width)&&(identical(other.volumetricWeight, volumetricWeight) || other.volumetricWeight == volumetricWeight)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.invoiceWeight, invoiceWeight) || other.invoiceWeight == invoiceWeight)&&(identical(other.costPriceOfAirShipment, costPriceOfAirShipment) || other.costPriceOfAirShipment == costPriceOfAirShipment)&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.additionalCostForFragileCargo, additionalCostForFragileCargo) || other.additionalCostForFragileCargo == additionalCostForFragileCargo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,createdAt,updatedAt,isActive,name,description,image,id,deletedAt,icon,sortIndex,const DeepCollectionEquality().hash(_fields),tariffCategoryId,length,height,width,volumetricWeight,weight,invoiceWeight,costPriceOfAirShipment,packageId,additionalCostForFragileCargo]);

@override
String toString() {
  return 'OrderTariffEntity(createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, name: $name, description: $description, image: $image, id: $id, deletedAt: $deletedAt, icon: $icon, sortIndex: $sortIndex, fields: $fields, tariffCategoryId: $tariffCategoryId, length: $length, height: $height, width: $width, volumetricWeight: $volumetricWeight, weight: $weight, invoiceWeight: $invoiceWeight, costPriceOfAirShipment: $costPriceOfAirShipment, packageId: $packageId, additionalCostForFragileCargo: $additionalCostForFragileCargo)';
}


}

/// @nodoc
abstract mixin class _$OrderTariffEntityCopyWith<$Res> implements $OrderTariffEntityCopyWith<$Res> {
  factory _$OrderTariffEntityCopyWith(_OrderTariffEntity value, $Res Function(_OrderTariffEntity) _then) = __$OrderTariffEntityCopyWithImpl;
@override @useResult
$Res call({
 String createdAt, String updatedAt, bool isActive, String name, String description, String image, int? id, String? deletedAt, int? icon, int? sortIndex, List<String>? fields, int? tariffCategoryId, double? length, double? height, double? width, double? volumetricWeight, double? weight, double? invoiceWeight, double? costPriceOfAirShipment, int? packageId, double? additionalCostForFragileCargo
});




}
/// @nodoc
class __$OrderTariffEntityCopyWithImpl<$Res>
    implements _$OrderTariffEntityCopyWith<$Res> {
  __$OrderTariffEntityCopyWithImpl(this._self, this._then);

  final _OrderTariffEntity _self;
  final $Res Function(_OrderTariffEntity) _then;

/// Create a copy of OrderTariffEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = null,Object? updatedAt = null,Object? isActive = null,Object? name = null,Object? description = null,Object? image = null,Object? id = freezed,Object? deletedAt = freezed,Object? icon = freezed,Object? sortIndex = freezed,Object? fields = freezed,Object? tariffCategoryId = freezed,Object? length = freezed,Object? height = freezed,Object? width = freezed,Object? volumetricWeight = freezed,Object? weight = freezed,Object? invoiceWeight = freezed,Object? costPriceOfAirShipment = freezed,Object? packageId = freezed,Object? additionalCostForFragileCargo = freezed,}) {
  return _then(_OrderTariffEntity(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as int?,sortIndex: freezed == sortIndex ? _self.sortIndex : sortIndex // ignore: cast_nullable_to_non_nullable
as int?,fields: freezed == fields ? _self._fields : fields // ignore: cast_nullable_to_non_nullable
as List<String>?,tariffCategoryId: freezed == tariffCategoryId ? _self.tariffCategoryId : tariffCategoryId // ignore: cast_nullable_to_non_nullable
as int?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,volumetricWeight: freezed == volumetricWeight ? _self.volumetricWeight : volumetricWeight // ignore: cast_nullable_to_non_nullable
as double?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,invoiceWeight: freezed == invoiceWeight ? _self.invoiceWeight : invoiceWeight // ignore: cast_nullable_to_non_nullable
as double?,costPriceOfAirShipment: freezed == costPriceOfAirShipment ? _self.costPriceOfAirShipment : costPriceOfAirShipment // ignore: cast_nullable_to_non_nullable
as double?,packageId: freezed == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as int?,additionalCostForFragileCargo: freezed == additionalCostForFragileCargo ? _self.additionalCostForFragileCargo : additionalCostForFragileCargo // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$OrderEntity {

 int get id; String get createdAt; String get updatedAt; int get fromCityId; double get fromLatitude; double get fromLongitude; String get fromAddress; int get toCityId; double get toLatitude; double get toLongitude; String get toAddress; int get tariffId; bool get isFragile; bool get isDefect; double get volumetricWeight; double get weight; double get width; double get length; double get height; int get calculationId; String get status; bool get isPaid; String? get deletedAt; String get fromApartment; String? get fromEntrance; String get fromFloor; String? get fromPhone; String? get fromName; String get toApartment; String? get toEntrance; String get toFloor; String? get toPhone; String? get toName; double get price; double get paidAmount; double get payAmount; bool get isCanCancel; int get cancelType;// 1 - бесплатно, 2 платно
 double get cancelAmount; OrderTariffEntity? get tariff; String? get sendTime; String? get courierArriveTime; int? get orderAccumulatorId; String get comment; String get description; String get category; List<String> get photos; List<String> get contentPhotos; List<String>? get defectPhotos; String get decideReason; String get decideDescription; OrderCityEntity? get fromCity; OrderCityEntity? get toCity; List<QrEntity>? get qrs; List<OrderIdentificationEntity> get identifications; List<OrderHistoryEntity> get histories;
/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderEntityCopyWith<OrderEntity> get copyWith => _$OrderEntityCopyWithImpl<OrderEntity>(this as OrderEntity, _$identity);

  /// Serializes this OrderEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.fromCityId, fromCityId) || other.fromCityId == fromCityId)&&(identical(other.fromLatitude, fromLatitude) || other.fromLatitude == fromLatitude)&&(identical(other.fromLongitude, fromLongitude) || other.fromLongitude == fromLongitude)&&(identical(other.fromAddress, fromAddress) || other.fromAddress == fromAddress)&&(identical(other.toCityId, toCityId) || other.toCityId == toCityId)&&(identical(other.toLatitude, toLatitude) || other.toLatitude == toLatitude)&&(identical(other.toLongitude, toLongitude) || other.toLongitude == toLongitude)&&(identical(other.toAddress, toAddress) || other.toAddress == toAddress)&&(identical(other.tariffId, tariffId) || other.tariffId == tariffId)&&(identical(other.isFragile, isFragile) || other.isFragile == isFragile)&&(identical(other.isDefect, isDefect) || other.isDefect == isDefect)&&(identical(other.volumetricWeight, volumetricWeight) || other.volumetricWeight == volumetricWeight)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.width, width) || other.width == width)&&(identical(other.length, length) || other.length == length)&&(identical(other.height, height) || other.height == height)&&(identical(other.calculationId, calculationId) || other.calculationId == calculationId)&&(identical(other.status, status) || other.status == status)&&(identical(other.isPaid, isPaid) || other.isPaid == isPaid)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.fromApartment, fromApartment) || other.fromApartment == fromApartment)&&(identical(other.fromEntrance, fromEntrance) || other.fromEntrance == fromEntrance)&&(identical(other.fromFloor, fromFloor) || other.fromFloor == fromFloor)&&(identical(other.fromPhone, fromPhone) || other.fromPhone == fromPhone)&&(identical(other.fromName, fromName) || other.fromName == fromName)&&(identical(other.toApartment, toApartment) || other.toApartment == toApartment)&&(identical(other.toEntrance, toEntrance) || other.toEntrance == toEntrance)&&(identical(other.toFloor, toFloor) || other.toFloor == toFloor)&&(identical(other.toPhone, toPhone) || other.toPhone == toPhone)&&(identical(other.toName, toName) || other.toName == toName)&&(identical(other.price, price) || other.price == price)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.payAmount, payAmount) || other.payAmount == payAmount)&&(identical(other.isCanCancel, isCanCancel) || other.isCanCancel == isCanCancel)&&(identical(other.cancelType, cancelType) || other.cancelType == cancelType)&&(identical(other.cancelAmount, cancelAmount) || other.cancelAmount == cancelAmount)&&(identical(other.tariff, tariff) || other.tariff == tariff)&&(identical(other.sendTime, sendTime) || other.sendTime == sendTime)&&(identical(other.courierArriveTime, courierArriveTime) || other.courierArriveTime == courierArriveTime)&&(identical(other.orderAccumulatorId, orderAccumulatorId) || other.orderAccumulatorId == orderAccumulatorId)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.photos, photos)&&const DeepCollectionEquality().equals(other.contentPhotos, contentPhotos)&&const DeepCollectionEquality().equals(other.defectPhotos, defectPhotos)&&(identical(other.decideReason, decideReason) || other.decideReason == decideReason)&&(identical(other.decideDescription, decideDescription) || other.decideDescription == decideDescription)&&(identical(other.fromCity, fromCity) || other.fromCity == fromCity)&&(identical(other.toCity, toCity) || other.toCity == toCity)&&const DeepCollectionEquality().equals(other.qrs, qrs)&&const DeepCollectionEquality().equals(other.identifications, identifications)&&const DeepCollectionEquality().equals(other.histories, histories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,createdAt,updatedAt,fromCityId,fromLatitude,fromLongitude,fromAddress,toCityId,toLatitude,toLongitude,toAddress,tariffId,isFragile,isDefect,volumetricWeight,weight,width,length,height,calculationId,status,isPaid,deletedAt,fromApartment,fromEntrance,fromFloor,fromPhone,fromName,toApartment,toEntrance,toFloor,toPhone,toName,price,paidAmount,payAmount,isCanCancel,cancelType,cancelAmount,tariff,sendTime,courierArriveTime,orderAccumulatorId,comment,description,category,const DeepCollectionEquality().hash(photos),const DeepCollectionEquality().hash(contentPhotos),const DeepCollectionEquality().hash(defectPhotos),decideReason,decideDescription,fromCity,toCity,const DeepCollectionEquality().hash(qrs),const DeepCollectionEquality().hash(identifications),const DeepCollectionEquality().hash(histories)]);

@override
String toString() {
  return 'OrderEntity(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, fromCityId: $fromCityId, fromLatitude: $fromLatitude, fromLongitude: $fromLongitude, fromAddress: $fromAddress, toCityId: $toCityId, toLatitude: $toLatitude, toLongitude: $toLongitude, toAddress: $toAddress, tariffId: $tariffId, isFragile: $isFragile, isDefect: $isDefect, volumetricWeight: $volumetricWeight, weight: $weight, width: $width, length: $length, height: $height, calculationId: $calculationId, status: $status, isPaid: $isPaid, deletedAt: $deletedAt, fromApartment: $fromApartment, fromEntrance: $fromEntrance, fromFloor: $fromFloor, fromPhone: $fromPhone, fromName: $fromName, toApartment: $toApartment, toEntrance: $toEntrance, toFloor: $toFloor, toPhone: $toPhone, toName: $toName, price: $price, paidAmount: $paidAmount, payAmount: $payAmount, isCanCancel: $isCanCancel, cancelType: $cancelType, cancelAmount: $cancelAmount, tariff: $tariff, sendTime: $sendTime, courierArriveTime: $courierArriveTime, orderAccumulatorId: $orderAccumulatorId, comment: $comment, description: $description, category: $category, photos: $photos, contentPhotos: $contentPhotos, defectPhotos: $defectPhotos, decideReason: $decideReason, decideDescription: $decideDescription, fromCity: $fromCity, toCity: $toCity, qrs: $qrs, identifications: $identifications, histories: $histories)';
}


}

/// @nodoc
abstract mixin class $OrderEntityCopyWith<$Res>  {
  factory $OrderEntityCopyWith(OrderEntity value, $Res Function(OrderEntity) _then) = _$OrderEntityCopyWithImpl;
@useResult
$Res call({
 int id, String createdAt, String updatedAt, int fromCityId, double fromLatitude, double fromLongitude, String fromAddress, int toCityId, double toLatitude, double toLongitude, String toAddress, int tariffId, bool isFragile, bool isDefect, double volumetricWeight, double weight, double width, double length, double height, int calculationId, String status, bool isPaid, String? deletedAt, String fromApartment, String? fromEntrance, String fromFloor, String? fromPhone, String? fromName, String toApartment, String? toEntrance, String toFloor, String? toPhone, String? toName, double price, double paidAmount, double payAmount, bool isCanCancel, int cancelType, double cancelAmount, OrderTariffEntity? tariff, String? sendTime, String? courierArriveTime, int? orderAccumulatorId, String comment, String description, String category, List<String> photos, List<String> contentPhotos, List<String>? defectPhotos, String decideReason, String decideDescription, OrderCityEntity? fromCity, OrderCityEntity? toCity, List<QrEntity>? qrs, List<OrderIdentificationEntity> identifications, List<OrderHistoryEntity> histories
});


$OrderTariffEntityCopyWith<$Res>? get tariff;$OrderCityEntityCopyWith<$Res>? get fromCity;$OrderCityEntityCopyWith<$Res>? get toCity;

}
/// @nodoc
class _$OrderEntityCopyWithImpl<$Res>
    implements $OrderEntityCopyWith<$Res> {
  _$OrderEntityCopyWithImpl(this._self, this._then);

  final OrderEntity _self;
  final $Res Function(OrderEntity) _then;

/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? fromCityId = null,Object? fromLatitude = null,Object? fromLongitude = null,Object? fromAddress = null,Object? toCityId = null,Object? toLatitude = null,Object? toLongitude = null,Object? toAddress = null,Object? tariffId = null,Object? isFragile = null,Object? isDefect = null,Object? volumetricWeight = null,Object? weight = null,Object? width = null,Object? length = null,Object? height = null,Object? calculationId = null,Object? status = null,Object? isPaid = null,Object? deletedAt = freezed,Object? fromApartment = null,Object? fromEntrance = freezed,Object? fromFloor = null,Object? fromPhone = freezed,Object? fromName = freezed,Object? toApartment = null,Object? toEntrance = freezed,Object? toFloor = null,Object? toPhone = freezed,Object? toName = freezed,Object? price = null,Object? paidAmount = null,Object? payAmount = null,Object? isCanCancel = null,Object? cancelType = null,Object? cancelAmount = null,Object? tariff = freezed,Object? sendTime = freezed,Object? courierArriveTime = freezed,Object? orderAccumulatorId = freezed,Object? comment = null,Object? description = null,Object? category = null,Object? photos = null,Object? contentPhotos = null,Object? defectPhotos = freezed,Object? decideReason = null,Object? decideDescription = null,Object? fromCity = freezed,Object? toCity = freezed,Object? qrs = freezed,Object? identifications = null,Object? histories = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,fromCityId: null == fromCityId ? _self.fromCityId : fromCityId // ignore: cast_nullable_to_non_nullable
as int,fromLatitude: null == fromLatitude ? _self.fromLatitude : fromLatitude // ignore: cast_nullable_to_non_nullable
as double,fromLongitude: null == fromLongitude ? _self.fromLongitude : fromLongitude // ignore: cast_nullable_to_non_nullable
as double,fromAddress: null == fromAddress ? _self.fromAddress : fromAddress // ignore: cast_nullable_to_non_nullable
as String,toCityId: null == toCityId ? _self.toCityId : toCityId // ignore: cast_nullable_to_non_nullable
as int,toLatitude: null == toLatitude ? _self.toLatitude : toLatitude // ignore: cast_nullable_to_non_nullable
as double,toLongitude: null == toLongitude ? _self.toLongitude : toLongitude // ignore: cast_nullable_to_non_nullable
as double,toAddress: null == toAddress ? _self.toAddress : toAddress // ignore: cast_nullable_to_non_nullable
as String,tariffId: null == tariffId ? _self.tariffId : tariffId // ignore: cast_nullable_to_non_nullable
as int,isFragile: null == isFragile ? _self.isFragile : isFragile // ignore: cast_nullable_to_non_nullable
as bool,isDefect: null == isDefect ? _self.isDefect : isDefect // ignore: cast_nullable_to_non_nullable
as bool,volumetricWeight: null == volumetricWeight ? _self.volumetricWeight : volumetricWeight // ignore: cast_nullable_to_non_nullable
as double,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,calculationId: null == calculationId ? _self.calculationId : calculationId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isPaid: null == isPaid ? _self.isPaid : isPaid // ignore: cast_nullable_to_non_nullable
as bool,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,fromApartment: null == fromApartment ? _self.fromApartment : fromApartment // ignore: cast_nullable_to_non_nullable
as String,fromEntrance: freezed == fromEntrance ? _self.fromEntrance : fromEntrance // ignore: cast_nullable_to_non_nullable
as String?,fromFloor: null == fromFloor ? _self.fromFloor : fromFloor // ignore: cast_nullable_to_non_nullable
as String,fromPhone: freezed == fromPhone ? _self.fromPhone : fromPhone // ignore: cast_nullable_to_non_nullable
as String?,fromName: freezed == fromName ? _self.fromName : fromName // ignore: cast_nullable_to_non_nullable
as String?,toApartment: null == toApartment ? _self.toApartment : toApartment // ignore: cast_nullable_to_non_nullable
as String,toEntrance: freezed == toEntrance ? _self.toEntrance : toEntrance // ignore: cast_nullable_to_non_nullable
as String?,toFloor: null == toFloor ? _self.toFloor : toFloor // ignore: cast_nullable_to_non_nullable
as String,toPhone: freezed == toPhone ? _self.toPhone : toPhone // ignore: cast_nullable_to_non_nullable
as String?,toName: freezed == toName ? _self.toName : toName // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,payAmount: null == payAmount ? _self.payAmount : payAmount // ignore: cast_nullable_to_non_nullable
as double,isCanCancel: null == isCanCancel ? _self.isCanCancel : isCanCancel // ignore: cast_nullable_to_non_nullable
as bool,cancelType: null == cancelType ? _self.cancelType : cancelType // ignore: cast_nullable_to_non_nullable
as int,cancelAmount: null == cancelAmount ? _self.cancelAmount : cancelAmount // ignore: cast_nullable_to_non_nullable
as double,tariff: freezed == tariff ? _self.tariff : tariff // ignore: cast_nullable_to_non_nullable
as OrderTariffEntity?,sendTime: freezed == sendTime ? _self.sendTime : sendTime // ignore: cast_nullable_to_non_nullable
as String?,courierArriveTime: freezed == courierArriveTime ? _self.courierArriveTime : courierArriveTime // ignore: cast_nullable_to_non_nullable
as String?,orderAccumulatorId: freezed == orderAccumulatorId ? _self.orderAccumulatorId : orderAccumulatorId // ignore: cast_nullable_to_non_nullable
as int?,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,contentPhotos: null == contentPhotos ? _self.contentPhotos : contentPhotos // ignore: cast_nullable_to_non_nullable
as List<String>,defectPhotos: freezed == defectPhotos ? _self.defectPhotos : defectPhotos // ignore: cast_nullable_to_non_nullable
as List<String>?,decideReason: null == decideReason ? _self.decideReason : decideReason // ignore: cast_nullable_to_non_nullable
as String,decideDescription: null == decideDescription ? _self.decideDescription : decideDescription // ignore: cast_nullable_to_non_nullable
as String,fromCity: freezed == fromCity ? _self.fromCity : fromCity // ignore: cast_nullable_to_non_nullable
as OrderCityEntity?,toCity: freezed == toCity ? _self.toCity : toCity // ignore: cast_nullable_to_non_nullable
as OrderCityEntity?,qrs: freezed == qrs ? _self.qrs : qrs // ignore: cast_nullable_to_non_nullable
as List<QrEntity>?,identifications: null == identifications ? _self.identifications : identifications // ignore: cast_nullable_to_non_nullable
as List<OrderIdentificationEntity>,histories: null == histories ? _self.histories : histories // ignore: cast_nullable_to_non_nullable
as List<OrderHistoryEntity>,
  ));
}
/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderTariffEntityCopyWith<$Res>? get tariff {
    if (_self.tariff == null) {
    return null;
  }

  return $OrderTariffEntityCopyWith<$Res>(_self.tariff!, (value) {
    return _then(_self.copyWith(tariff: value));
  });
}/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCityEntityCopyWith<$Res>? get fromCity {
    if (_self.fromCity == null) {
    return null;
  }

  return $OrderCityEntityCopyWith<$Res>(_self.fromCity!, (value) {
    return _then(_self.copyWith(fromCity: value));
  });
}/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCityEntityCopyWith<$Res>? get toCity {
    if (_self.toCity == null) {
    return null;
  }

  return $OrderCityEntityCopyWith<$Res>(_self.toCity!, (value) {
    return _then(_self.copyWith(toCity: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderEntity].
extension OrderEntityPatterns on OrderEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderEntity value)  $default,){
final _that = this;
switch (_that) {
case _OrderEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderEntity value)?  $default,){
final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String createdAt,  String updatedAt,  int fromCityId,  double fromLatitude,  double fromLongitude,  String fromAddress,  int toCityId,  double toLatitude,  double toLongitude,  String toAddress,  int tariffId,  bool isFragile,  bool isDefect,  double volumetricWeight,  double weight,  double width,  double length,  double height,  int calculationId,  String status,  bool isPaid,  String? deletedAt,  String fromApartment,  String? fromEntrance,  String fromFloor,  String? fromPhone,  String? fromName,  String toApartment,  String? toEntrance,  String toFloor,  String? toPhone,  String? toName,  double price,  double paidAmount,  double payAmount,  bool isCanCancel,  int cancelType,  double cancelAmount,  OrderTariffEntity? tariff,  String? sendTime,  String? courierArriveTime,  int? orderAccumulatorId,  String comment,  String description,  String category,  List<String> photos,  List<String> contentPhotos,  List<String>? defectPhotos,  String decideReason,  String decideDescription,  OrderCityEntity? fromCity,  OrderCityEntity? toCity,  List<QrEntity>? qrs,  List<OrderIdentificationEntity> identifications,  List<OrderHistoryEntity> histories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.fromCityId,_that.fromLatitude,_that.fromLongitude,_that.fromAddress,_that.toCityId,_that.toLatitude,_that.toLongitude,_that.toAddress,_that.tariffId,_that.isFragile,_that.isDefect,_that.volumetricWeight,_that.weight,_that.width,_that.length,_that.height,_that.calculationId,_that.status,_that.isPaid,_that.deletedAt,_that.fromApartment,_that.fromEntrance,_that.fromFloor,_that.fromPhone,_that.fromName,_that.toApartment,_that.toEntrance,_that.toFloor,_that.toPhone,_that.toName,_that.price,_that.paidAmount,_that.payAmount,_that.isCanCancel,_that.cancelType,_that.cancelAmount,_that.tariff,_that.sendTime,_that.courierArriveTime,_that.orderAccumulatorId,_that.comment,_that.description,_that.category,_that.photos,_that.contentPhotos,_that.defectPhotos,_that.decideReason,_that.decideDescription,_that.fromCity,_that.toCity,_that.qrs,_that.identifications,_that.histories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String createdAt,  String updatedAt,  int fromCityId,  double fromLatitude,  double fromLongitude,  String fromAddress,  int toCityId,  double toLatitude,  double toLongitude,  String toAddress,  int tariffId,  bool isFragile,  bool isDefect,  double volumetricWeight,  double weight,  double width,  double length,  double height,  int calculationId,  String status,  bool isPaid,  String? deletedAt,  String fromApartment,  String? fromEntrance,  String fromFloor,  String? fromPhone,  String? fromName,  String toApartment,  String? toEntrance,  String toFloor,  String? toPhone,  String? toName,  double price,  double paidAmount,  double payAmount,  bool isCanCancel,  int cancelType,  double cancelAmount,  OrderTariffEntity? tariff,  String? sendTime,  String? courierArriveTime,  int? orderAccumulatorId,  String comment,  String description,  String category,  List<String> photos,  List<String> contentPhotos,  List<String>? defectPhotos,  String decideReason,  String decideDescription,  OrderCityEntity? fromCity,  OrderCityEntity? toCity,  List<QrEntity>? qrs,  List<OrderIdentificationEntity> identifications,  List<OrderHistoryEntity> histories)  $default,) {final _that = this;
switch (_that) {
case _OrderEntity():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.fromCityId,_that.fromLatitude,_that.fromLongitude,_that.fromAddress,_that.toCityId,_that.toLatitude,_that.toLongitude,_that.toAddress,_that.tariffId,_that.isFragile,_that.isDefect,_that.volumetricWeight,_that.weight,_that.width,_that.length,_that.height,_that.calculationId,_that.status,_that.isPaid,_that.deletedAt,_that.fromApartment,_that.fromEntrance,_that.fromFloor,_that.fromPhone,_that.fromName,_that.toApartment,_that.toEntrance,_that.toFloor,_that.toPhone,_that.toName,_that.price,_that.paidAmount,_that.payAmount,_that.isCanCancel,_that.cancelType,_that.cancelAmount,_that.tariff,_that.sendTime,_that.courierArriveTime,_that.orderAccumulatorId,_that.comment,_that.description,_that.category,_that.photos,_that.contentPhotos,_that.defectPhotos,_that.decideReason,_that.decideDescription,_that.fromCity,_that.toCity,_that.qrs,_that.identifications,_that.histories);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String createdAt,  String updatedAt,  int fromCityId,  double fromLatitude,  double fromLongitude,  String fromAddress,  int toCityId,  double toLatitude,  double toLongitude,  String toAddress,  int tariffId,  bool isFragile,  bool isDefect,  double volumetricWeight,  double weight,  double width,  double length,  double height,  int calculationId,  String status,  bool isPaid,  String? deletedAt,  String fromApartment,  String? fromEntrance,  String fromFloor,  String? fromPhone,  String? fromName,  String toApartment,  String? toEntrance,  String toFloor,  String? toPhone,  String? toName,  double price,  double paidAmount,  double payAmount,  bool isCanCancel,  int cancelType,  double cancelAmount,  OrderTariffEntity? tariff,  String? sendTime,  String? courierArriveTime,  int? orderAccumulatorId,  String comment,  String description,  String category,  List<String> photos,  List<String> contentPhotos,  List<String>? defectPhotos,  String decideReason,  String decideDescription,  OrderCityEntity? fromCity,  OrderCityEntity? toCity,  List<QrEntity>? qrs,  List<OrderIdentificationEntity> identifications,  List<OrderHistoryEntity> histories)?  $default,) {final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.fromCityId,_that.fromLatitude,_that.fromLongitude,_that.fromAddress,_that.toCityId,_that.toLatitude,_that.toLongitude,_that.toAddress,_that.tariffId,_that.isFragile,_that.isDefect,_that.volumetricWeight,_that.weight,_that.width,_that.length,_that.height,_that.calculationId,_that.status,_that.isPaid,_that.deletedAt,_that.fromApartment,_that.fromEntrance,_that.fromFloor,_that.fromPhone,_that.fromName,_that.toApartment,_that.toEntrance,_that.toFloor,_that.toPhone,_that.toName,_that.price,_that.paidAmount,_that.payAmount,_that.isCanCancel,_that.cancelType,_that.cancelAmount,_that.tariff,_that.sendTime,_that.courierArriveTime,_that.orderAccumulatorId,_that.comment,_that.description,_that.category,_that.photos,_that.contentPhotos,_that.defectPhotos,_that.decideReason,_that.decideDescription,_that.fromCity,_that.toCity,_that.qrs,_that.identifications,_that.histories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderEntity implements OrderEntity {
  const _OrderEntity({required this.id, required this.createdAt, required this.updatedAt, required this.fromCityId, required this.fromLatitude, required this.fromLongitude, required this.fromAddress, required this.toCityId, required this.toLatitude, required this.toLongitude, required this.toAddress, required this.tariffId, required this.isFragile, required this.isDefect, required this.volumetricWeight, required this.weight, required this.width, required this.length, required this.height, required this.calculationId, required this.status, this.isPaid = false, this.deletedAt, this.fromApartment = '', this.fromEntrance, this.fromFloor = '', this.fromPhone, this.fromName, this.toApartment = '', this.toEntrance, this.toFloor = '', this.toPhone, this.toName, this.price = 0.0, this.paidAmount = 0.0, this.payAmount = 0.0, this.isCanCancel = false, this.cancelType = 0, this.cancelAmount = 0.0, this.tariff, this.sendTime, this.courierArriveTime, this.orderAccumulatorId, this.comment = '', this.description = '', this.category = '', final  List<String> photos = const [], final  List<String> contentPhotos = const [], final  List<String>? defectPhotos = const [], this.decideReason = '', this.decideDescription = '', this.fromCity, this.toCity, final  List<QrEntity>? qrs = const [], final  List<OrderIdentificationEntity> identifications = const [], final  List<OrderHistoryEntity> histories = const []}): _photos = photos,_contentPhotos = contentPhotos,_defectPhotos = defectPhotos,_qrs = qrs,_identifications = identifications,_histories = histories;
  factory _OrderEntity.fromJson(Map<String, dynamic> json) => _$OrderEntityFromJson(json);

@override final  int id;
@override final  String createdAt;
@override final  String updatedAt;
@override final  int fromCityId;
@override final  double fromLatitude;
@override final  double fromLongitude;
@override final  String fromAddress;
@override final  int toCityId;
@override final  double toLatitude;
@override final  double toLongitude;
@override final  String toAddress;
@override final  int tariffId;
@override final  bool isFragile;
@override final  bool isDefect;
@override final  double volumetricWeight;
@override final  double weight;
@override final  double width;
@override final  double length;
@override final  double height;
@override final  int calculationId;
@override final  String status;
@override@JsonKey() final  bool isPaid;
@override final  String? deletedAt;
@override@JsonKey() final  String fromApartment;
@override final  String? fromEntrance;
@override@JsonKey() final  String fromFloor;
@override final  String? fromPhone;
@override final  String? fromName;
@override@JsonKey() final  String toApartment;
@override final  String? toEntrance;
@override@JsonKey() final  String toFloor;
@override final  String? toPhone;
@override final  String? toName;
@override@JsonKey() final  double price;
@override@JsonKey() final  double paidAmount;
@override@JsonKey() final  double payAmount;
@override@JsonKey() final  bool isCanCancel;
@override@JsonKey() final  int cancelType;
// 1 - бесплатно, 2 платно
@override@JsonKey() final  double cancelAmount;
@override final  OrderTariffEntity? tariff;
@override final  String? sendTime;
@override final  String? courierArriveTime;
@override final  int? orderAccumulatorId;
@override@JsonKey() final  String comment;
@override@JsonKey() final  String description;
@override@JsonKey() final  String category;
 final  List<String> _photos;
@override@JsonKey() List<String> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

 final  List<String> _contentPhotos;
@override@JsonKey() List<String> get contentPhotos {
  if (_contentPhotos is EqualUnmodifiableListView) return _contentPhotos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contentPhotos);
}

 final  List<String>? _defectPhotos;
@override@JsonKey() List<String>? get defectPhotos {
  final value = _defectPhotos;
  if (value == null) return null;
  if (_defectPhotos is EqualUnmodifiableListView) return _defectPhotos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  String decideReason;
@override@JsonKey() final  String decideDescription;
@override final  OrderCityEntity? fromCity;
@override final  OrderCityEntity? toCity;
 final  List<QrEntity>? _qrs;
@override@JsonKey() List<QrEntity>? get qrs {
  final value = _qrs;
  if (value == null) return null;
  if (_qrs is EqualUnmodifiableListView) return _qrs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<OrderIdentificationEntity> _identifications;
@override@JsonKey() List<OrderIdentificationEntity> get identifications {
  if (_identifications is EqualUnmodifiableListView) return _identifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_identifications);
}

 final  List<OrderHistoryEntity> _histories;
@override@JsonKey() List<OrderHistoryEntity> get histories {
  if (_histories is EqualUnmodifiableListView) return _histories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_histories);
}


/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderEntityCopyWith<_OrderEntity> get copyWith => __$OrderEntityCopyWithImpl<_OrderEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.fromCityId, fromCityId) || other.fromCityId == fromCityId)&&(identical(other.fromLatitude, fromLatitude) || other.fromLatitude == fromLatitude)&&(identical(other.fromLongitude, fromLongitude) || other.fromLongitude == fromLongitude)&&(identical(other.fromAddress, fromAddress) || other.fromAddress == fromAddress)&&(identical(other.toCityId, toCityId) || other.toCityId == toCityId)&&(identical(other.toLatitude, toLatitude) || other.toLatitude == toLatitude)&&(identical(other.toLongitude, toLongitude) || other.toLongitude == toLongitude)&&(identical(other.toAddress, toAddress) || other.toAddress == toAddress)&&(identical(other.tariffId, tariffId) || other.tariffId == tariffId)&&(identical(other.isFragile, isFragile) || other.isFragile == isFragile)&&(identical(other.isDefect, isDefect) || other.isDefect == isDefect)&&(identical(other.volumetricWeight, volumetricWeight) || other.volumetricWeight == volumetricWeight)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.width, width) || other.width == width)&&(identical(other.length, length) || other.length == length)&&(identical(other.height, height) || other.height == height)&&(identical(other.calculationId, calculationId) || other.calculationId == calculationId)&&(identical(other.status, status) || other.status == status)&&(identical(other.isPaid, isPaid) || other.isPaid == isPaid)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.fromApartment, fromApartment) || other.fromApartment == fromApartment)&&(identical(other.fromEntrance, fromEntrance) || other.fromEntrance == fromEntrance)&&(identical(other.fromFloor, fromFloor) || other.fromFloor == fromFloor)&&(identical(other.fromPhone, fromPhone) || other.fromPhone == fromPhone)&&(identical(other.fromName, fromName) || other.fromName == fromName)&&(identical(other.toApartment, toApartment) || other.toApartment == toApartment)&&(identical(other.toEntrance, toEntrance) || other.toEntrance == toEntrance)&&(identical(other.toFloor, toFloor) || other.toFloor == toFloor)&&(identical(other.toPhone, toPhone) || other.toPhone == toPhone)&&(identical(other.toName, toName) || other.toName == toName)&&(identical(other.price, price) || other.price == price)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.payAmount, payAmount) || other.payAmount == payAmount)&&(identical(other.isCanCancel, isCanCancel) || other.isCanCancel == isCanCancel)&&(identical(other.cancelType, cancelType) || other.cancelType == cancelType)&&(identical(other.cancelAmount, cancelAmount) || other.cancelAmount == cancelAmount)&&(identical(other.tariff, tariff) || other.tariff == tariff)&&(identical(other.sendTime, sendTime) || other.sendTime == sendTime)&&(identical(other.courierArriveTime, courierArriveTime) || other.courierArriveTime == courierArriveTime)&&(identical(other.orderAccumulatorId, orderAccumulatorId) || other.orderAccumulatorId == orderAccumulatorId)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._photos, _photos)&&const DeepCollectionEquality().equals(other._contentPhotos, _contentPhotos)&&const DeepCollectionEquality().equals(other._defectPhotos, _defectPhotos)&&(identical(other.decideReason, decideReason) || other.decideReason == decideReason)&&(identical(other.decideDescription, decideDescription) || other.decideDescription == decideDescription)&&(identical(other.fromCity, fromCity) || other.fromCity == fromCity)&&(identical(other.toCity, toCity) || other.toCity == toCity)&&const DeepCollectionEquality().equals(other._qrs, _qrs)&&const DeepCollectionEquality().equals(other._identifications, _identifications)&&const DeepCollectionEquality().equals(other._histories, _histories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,createdAt,updatedAt,fromCityId,fromLatitude,fromLongitude,fromAddress,toCityId,toLatitude,toLongitude,toAddress,tariffId,isFragile,isDefect,volumetricWeight,weight,width,length,height,calculationId,status,isPaid,deletedAt,fromApartment,fromEntrance,fromFloor,fromPhone,fromName,toApartment,toEntrance,toFloor,toPhone,toName,price,paidAmount,payAmount,isCanCancel,cancelType,cancelAmount,tariff,sendTime,courierArriveTime,orderAccumulatorId,comment,description,category,const DeepCollectionEquality().hash(_photos),const DeepCollectionEquality().hash(_contentPhotos),const DeepCollectionEquality().hash(_defectPhotos),decideReason,decideDescription,fromCity,toCity,const DeepCollectionEquality().hash(_qrs),const DeepCollectionEquality().hash(_identifications),const DeepCollectionEquality().hash(_histories)]);

@override
String toString() {
  return 'OrderEntity(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, fromCityId: $fromCityId, fromLatitude: $fromLatitude, fromLongitude: $fromLongitude, fromAddress: $fromAddress, toCityId: $toCityId, toLatitude: $toLatitude, toLongitude: $toLongitude, toAddress: $toAddress, tariffId: $tariffId, isFragile: $isFragile, isDefect: $isDefect, volumetricWeight: $volumetricWeight, weight: $weight, width: $width, length: $length, height: $height, calculationId: $calculationId, status: $status, isPaid: $isPaid, deletedAt: $deletedAt, fromApartment: $fromApartment, fromEntrance: $fromEntrance, fromFloor: $fromFloor, fromPhone: $fromPhone, fromName: $fromName, toApartment: $toApartment, toEntrance: $toEntrance, toFloor: $toFloor, toPhone: $toPhone, toName: $toName, price: $price, paidAmount: $paidAmount, payAmount: $payAmount, isCanCancel: $isCanCancel, cancelType: $cancelType, cancelAmount: $cancelAmount, tariff: $tariff, sendTime: $sendTime, courierArriveTime: $courierArriveTime, orderAccumulatorId: $orderAccumulatorId, comment: $comment, description: $description, category: $category, photos: $photos, contentPhotos: $contentPhotos, defectPhotos: $defectPhotos, decideReason: $decideReason, decideDescription: $decideDescription, fromCity: $fromCity, toCity: $toCity, qrs: $qrs, identifications: $identifications, histories: $histories)';
}


}

/// @nodoc
abstract mixin class _$OrderEntityCopyWith<$Res> implements $OrderEntityCopyWith<$Res> {
  factory _$OrderEntityCopyWith(_OrderEntity value, $Res Function(_OrderEntity) _then) = __$OrderEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String createdAt, String updatedAt, int fromCityId, double fromLatitude, double fromLongitude, String fromAddress, int toCityId, double toLatitude, double toLongitude, String toAddress, int tariffId, bool isFragile, bool isDefect, double volumetricWeight, double weight, double width, double length, double height, int calculationId, String status, bool isPaid, String? deletedAt, String fromApartment, String? fromEntrance, String fromFloor, String? fromPhone, String? fromName, String toApartment, String? toEntrance, String toFloor, String? toPhone, String? toName, double price, double paidAmount, double payAmount, bool isCanCancel, int cancelType, double cancelAmount, OrderTariffEntity? tariff, String? sendTime, String? courierArriveTime, int? orderAccumulatorId, String comment, String description, String category, List<String> photos, List<String> contentPhotos, List<String>? defectPhotos, String decideReason, String decideDescription, OrderCityEntity? fromCity, OrderCityEntity? toCity, List<QrEntity>? qrs, List<OrderIdentificationEntity> identifications, List<OrderHistoryEntity> histories
});


@override $OrderTariffEntityCopyWith<$Res>? get tariff;@override $OrderCityEntityCopyWith<$Res>? get fromCity;@override $OrderCityEntityCopyWith<$Res>? get toCity;

}
/// @nodoc
class __$OrderEntityCopyWithImpl<$Res>
    implements _$OrderEntityCopyWith<$Res> {
  __$OrderEntityCopyWithImpl(this._self, this._then);

  final _OrderEntity _self;
  final $Res Function(_OrderEntity) _then;

/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? fromCityId = null,Object? fromLatitude = null,Object? fromLongitude = null,Object? fromAddress = null,Object? toCityId = null,Object? toLatitude = null,Object? toLongitude = null,Object? toAddress = null,Object? tariffId = null,Object? isFragile = null,Object? isDefect = null,Object? volumetricWeight = null,Object? weight = null,Object? width = null,Object? length = null,Object? height = null,Object? calculationId = null,Object? status = null,Object? isPaid = null,Object? deletedAt = freezed,Object? fromApartment = null,Object? fromEntrance = freezed,Object? fromFloor = null,Object? fromPhone = freezed,Object? fromName = freezed,Object? toApartment = null,Object? toEntrance = freezed,Object? toFloor = null,Object? toPhone = freezed,Object? toName = freezed,Object? price = null,Object? paidAmount = null,Object? payAmount = null,Object? isCanCancel = null,Object? cancelType = null,Object? cancelAmount = null,Object? tariff = freezed,Object? sendTime = freezed,Object? courierArriveTime = freezed,Object? orderAccumulatorId = freezed,Object? comment = null,Object? description = null,Object? category = null,Object? photos = null,Object? contentPhotos = null,Object? defectPhotos = freezed,Object? decideReason = null,Object? decideDescription = null,Object? fromCity = freezed,Object? toCity = freezed,Object? qrs = freezed,Object? identifications = null,Object? histories = null,}) {
  return _then(_OrderEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,fromCityId: null == fromCityId ? _self.fromCityId : fromCityId // ignore: cast_nullable_to_non_nullable
as int,fromLatitude: null == fromLatitude ? _self.fromLatitude : fromLatitude // ignore: cast_nullable_to_non_nullable
as double,fromLongitude: null == fromLongitude ? _self.fromLongitude : fromLongitude // ignore: cast_nullable_to_non_nullable
as double,fromAddress: null == fromAddress ? _self.fromAddress : fromAddress // ignore: cast_nullable_to_non_nullable
as String,toCityId: null == toCityId ? _self.toCityId : toCityId // ignore: cast_nullable_to_non_nullable
as int,toLatitude: null == toLatitude ? _self.toLatitude : toLatitude // ignore: cast_nullable_to_non_nullable
as double,toLongitude: null == toLongitude ? _self.toLongitude : toLongitude // ignore: cast_nullable_to_non_nullable
as double,toAddress: null == toAddress ? _self.toAddress : toAddress // ignore: cast_nullable_to_non_nullable
as String,tariffId: null == tariffId ? _self.tariffId : tariffId // ignore: cast_nullable_to_non_nullable
as int,isFragile: null == isFragile ? _self.isFragile : isFragile // ignore: cast_nullable_to_non_nullable
as bool,isDefect: null == isDefect ? _self.isDefect : isDefect // ignore: cast_nullable_to_non_nullable
as bool,volumetricWeight: null == volumetricWeight ? _self.volumetricWeight : volumetricWeight // ignore: cast_nullable_to_non_nullable
as double,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,calculationId: null == calculationId ? _self.calculationId : calculationId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isPaid: null == isPaid ? _self.isPaid : isPaid // ignore: cast_nullable_to_non_nullable
as bool,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,fromApartment: null == fromApartment ? _self.fromApartment : fromApartment // ignore: cast_nullable_to_non_nullable
as String,fromEntrance: freezed == fromEntrance ? _self.fromEntrance : fromEntrance // ignore: cast_nullable_to_non_nullable
as String?,fromFloor: null == fromFloor ? _self.fromFloor : fromFloor // ignore: cast_nullable_to_non_nullable
as String,fromPhone: freezed == fromPhone ? _self.fromPhone : fromPhone // ignore: cast_nullable_to_non_nullable
as String?,fromName: freezed == fromName ? _self.fromName : fromName // ignore: cast_nullable_to_non_nullable
as String?,toApartment: null == toApartment ? _self.toApartment : toApartment // ignore: cast_nullable_to_non_nullable
as String,toEntrance: freezed == toEntrance ? _self.toEntrance : toEntrance // ignore: cast_nullable_to_non_nullable
as String?,toFloor: null == toFloor ? _self.toFloor : toFloor // ignore: cast_nullable_to_non_nullable
as String,toPhone: freezed == toPhone ? _self.toPhone : toPhone // ignore: cast_nullable_to_non_nullable
as String?,toName: freezed == toName ? _self.toName : toName // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,payAmount: null == payAmount ? _self.payAmount : payAmount // ignore: cast_nullable_to_non_nullable
as double,isCanCancel: null == isCanCancel ? _self.isCanCancel : isCanCancel // ignore: cast_nullable_to_non_nullable
as bool,cancelType: null == cancelType ? _self.cancelType : cancelType // ignore: cast_nullable_to_non_nullable
as int,cancelAmount: null == cancelAmount ? _self.cancelAmount : cancelAmount // ignore: cast_nullable_to_non_nullable
as double,tariff: freezed == tariff ? _self.tariff : tariff // ignore: cast_nullable_to_non_nullable
as OrderTariffEntity?,sendTime: freezed == sendTime ? _self.sendTime : sendTime // ignore: cast_nullable_to_non_nullable
as String?,courierArriveTime: freezed == courierArriveTime ? _self.courierArriveTime : courierArriveTime // ignore: cast_nullable_to_non_nullable
as String?,orderAccumulatorId: freezed == orderAccumulatorId ? _self.orderAccumulatorId : orderAccumulatorId // ignore: cast_nullable_to_non_nullable
as int?,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,contentPhotos: null == contentPhotos ? _self._contentPhotos : contentPhotos // ignore: cast_nullable_to_non_nullable
as List<String>,defectPhotos: freezed == defectPhotos ? _self._defectPhotos : defectPhotos // ignore: cast_nullable_to_non_nullable
as List<String>?,decideReason: null == decideReason ? _self.decideReason : decideReason // ignore: cast_nullable_to_non_nullable
as String,decideDescription: null == decideDescription ? _self.decideDescription : decideDescription // ignore: cast_nullable_to_non_nullable
as String,fromCity: freezed == fromCity ? _self.fromCity : fromCity // ignore: cast_nullable_to_non_nullable
as OrderCityEntity?,toCity: freezed == toCity ? _self.toCity : toCity // ignore: cast_nullable_to_non_nullable
as OrderCityEntity?,qrs: freezed == qrs ? _self._qrs : qrs // ignore: cast_nullable_to_non_nullable
as List<QrEntity>?,identifications: null == identifications ? _self._identifications : identifications // ignore: cast_nullable_to_non_nullable
as List<OrderIdentificationEntity>,histories: null == histories ? _self._histories : histories // ignore: cast_nullable_to_non_nullable
as List<OrderHistoryEntity>,
  ));
}

/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderTariffEntityCopyWith<$Res>? get tariff {
    if (_self.tariff == null) {
    return null;
  }

  return $OrderTariffEntityCopyWith<$Res>(_self.tariff!, (value) {
    return _then(_self.copyWith(tariff: value));
  });
}/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCityEntityCopyWith<$Res>? get fromCity {
    if (_self.fromCity == null) {
    return null;
  }

  return $OrderCityEntityCopyWith<$Res>(_self.fromCity!, (value) {
    return _then(_self.copyWith(fromCity: value));
  });
}/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCityEntityCopyWith<$Res>? get toCity {
    if (_self.toCity == null) {
    return null;
  }

  return $OrderCityEntityCopyWith<$Res>(_self.toCity!, (value) {
    return _then(_self.copyWith(toCity: value));
  });
}
}


/// @nodoc
mixin _$OrderResultEntity {

 int get orderId; String get status; String get message;
/// Create a copy of OrderResultEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderResultEntityCopyWith<OrderResultEntity> get copyWith => _$OrderResultEntityCopyWithImpl<OrderResultEntity>(this as OrderResultEntity, _$identity);

  /// Serializes this OrderResultEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderResultEntity&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,status,message);

@override
String toString() {
  return 'OrderResultEntity(orderId: $orderId, status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class $OrderResultEntityCopyWith<$Res>  {
  factory $OrderResultEntityCopyWith(OrderResultEntity value, $Res Function(OrderResultEntity) _then) = _$OrderResultEntityCopyWithImpl;
@useResult
$Res call({
 int orderId, String status, String message
});




}
/// @nodoc
class _$OrderResultEntityCopyWithImpl<$Res>
    implements $OrderResultEntityCopyWith<$Res> {
  _$OrderResultEntityCopyWithImpl(this._self, this._then);

  final OrderResultEntity _self;
  final $Res Function(OrderResultEntity) _then;

/// Create a copy of OrderResultEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,Object? status = null,Object? message = null,}) {
  return _then(_self.copyWith(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderResultEntity].
extension OrderResultEntityPatterns on OrderResultEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderResultEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderResultEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderResultEntity value)  $default,){
final _that = this;
switch (_that) {
case _OrderResultEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderResultEntity value)?  $default,){
final _that = this;
switch (_that) {
case _OrderResultEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int orderId,  String status,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderResultEntity() when $default != null:
return $default(_that.orderId,_that.status,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int orderId,  String status,  String message)  $default,) {final _that = this;
switch (_that) {
case _OrderResultEntity():
return $default(_that.orderId,_that.status,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int orderId,  String status,  String message)?  $default,) {final _that = this;
switch (_that) {
case _OrderResultEntity() when $default != null:
return $default(_that.orderId,_that.status,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderResultEntity implements OrderResultEntity {
  const _OrderResultEntity({required this.orderId, required this.status, required this.message});
  factory _OrderResultEntity.fromJson(Map<String, dynamic> json) => _$OrderResultEntityFromJson(json);

@override final  int orderId;
@override final  String status;
@override final  String message;

/// Create a copy of OrderResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderResultEntityCopyWith<_OrderResultEntity> get copyWith => __$OrderResultEntityCopyWithImpl<_OrderResultEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderResultEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderResultEntity&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,status,message);

@override
String toString() {
  return 'OrderResultEntity(orderId: $orderId, status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class _$OrderResultEntityCopyWith<$Res> implements $OrderResultEntityCopyWith<$Res> {
  factory _$OrderResultEntityCopyWith(_OrderResultEntity value, $Res Function(_OrderResultEntity) _then) = __$OrderResultEntityCopyWithImpl;
@override @useResult
$Res call({
 int orderId, String status, String message
});




}
/// @nodoc
class __$OrderResultEntityCopyWithImpl<$Res>
    implements _$OrderResultEntityCopyWith<$Res> {
  __$OrderResultEntityCopyWithImpl(this._self, this._then);

  final _OrderResultEntity _self;
  final $Res Function(_OrderResultEntity) _then;

/// Create a copy of OrderResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? status = null,Object? message = null,}) {
  return _then(_OrderResultEntity(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
