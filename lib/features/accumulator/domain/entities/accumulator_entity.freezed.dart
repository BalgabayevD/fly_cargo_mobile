// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accumulator_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccumulatorEntity {

 int get id; String get createdAt; String get updatedAt; int get fromCityId; int get toCityId; String get status; String get identification; String? get deletedAt; String? get pickUpTime; String? get receiveTime; OrderCityEntity? get fromCity; OrderCityEntity? get toCity; List<OrderEntity> get orders;
/// Create a copy of AccumulatorEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccumulatorEntityCopyWith<AccumulatorEntity> get copyWith => _$AccumulatorEntityCopyWithImpl<AccumulatorEntity>(this as AccumulatorEntity, _$identity);

  /// Serializes this AccumulatorEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccumulatorEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.fromCityId, fromCityId) || other.fromCityId == fromCityId)&&(identical(other.toCityId, toCityId) || other.toCityId == toCityId)&&(identical(other.status, status) || other.status == status)&&(identical(other.identification, identification) || other.identification == identification)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.pickUpTime, pickUpTime) || other.pickUpTime == pickUpTime)&&(identical(other.receiveTime, receiveTime) || other.receiveTime == receiveTime)&&(identical(other.fromCity, fromCity) || other.fromCity == fromCity)&&(identical(other.toCity, toCity) || other.toCity == toCity)&&const DeepCollectionEquality().equals(other.orders, orders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,fromCityId,toCityId,status,identification,deletedAt,pickUpTime,receiveTime,fromCity,toCity,const DeepCollectionEquality().hash(orders));

@override
String toString() {
  return 'AccumulatorEntity(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, fromCityId: $fromCityId, toCityId: $toCityId, status: $status, identification: $identification, deletedAt: $deletedAt, pickUpTime: $pickUpTime, receiveTime: $receiveTime, fromCity: $fromCity, toCity: $toCity, orders: $orders)';
}


}

/// @nodoc
abstract mixin class $AccumulatorEntityCopyWith<$Res>  {
  factory $AccumulatorEntityCopyWith(AccumulatorEntity value, $Res Function(AccumulatorEntity) _then) = _$AccumulatorEntityCopyWithImpl;
@useResult
$Res call({
 int id, String createdAt, String updatedAt, int fromCityId, int toCityId, String status, String identification, String? deletedAt, String? pickUpTime, String? receiveTime, OrderCityEntity? fromCity, OrderCityEntity? toCity, List<OrderEntity> orders
});


$OrderCityEntityCopyWith<$Res>? get fromCity;$OrderCityEntityCopyWith<$Res>? get toCity;

}
/// @nodoc
class _$AccumulatorEntityCopyWithImpl<$Res>
    implements $AccumulatorEntityCopyWith<$Res> {
  _$AccumulatorEntityCopyWithImpl(this._self, this._then);

  final AccumulatorEntity _self;
  final $Res Function(AccumulatorEntity) _then;

/// Create a copy of AccumulatorEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? fromCityId = null,Object? toCityId = null,Object? status = null,Object? identification = null,Object? deletedAt = freezed,Object? pickUpTime = freezed,Object? receiveTime = freezed,Object? fromCity = freezed,Object? toCity = freezed,Object? orders = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,fromCityId: null == fromCityId ? _self.fromCityId : fromCityId // ignore: cast_nullable_to_non_nullable
as int,toCityId: null == toCityId ? _self.toCityId : toCityId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,identification: null == identification ? _self.identification : identification // ignore: cast_nullable_to_non_nullable
as String,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,pickUpTime: freezed == pickUpTime ? _self.pickUpTime : pickUpTime // ignore: cast_nullable_to_non_nullable
as String?,receiveTime: freezed == receiveTime ? _self.receiveTime : receiveTime // ignore: cast_nullable_to_non_nullable
as String?,fromCity: freezed == fromCity ? _self.fromCity : fromCity // ignore: cast_nullable_to_non_nullable
as OrderCityEntity?,toCity: freezed == toCity ? _self.toCity : toCity // ignore: cast_nullable_to_non_nullable
as OrderCityEntity?,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderEntity>,
  ));
}
/// Create a copy of AccumulatorEntity
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
}/// Create a copy of AccumulatorEntity
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


/// Adds pattern-matching-related methods to [AccumulatorEntity].
extension AccumulatorEntityPatterns on AccumulatorEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccumulatorEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccumulatorEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccumulatorEntity value)  $default,){
final _that = this;
switch (_that) {
case _AccumulatorEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccumulatorEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AccumulatorEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String createdAt,  String updatedAt,  int fromCityId,  int toCityId,  String status,  String identification,  String? deletedAt,  String? pickUpTime,  String? receiveTime,  OrderCityEntity? fromCity,  OrderCityEntity? toCity,  List<OrderEntity> orders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccumulatorEntity() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.fromCityId,_that.toCityId,_that.status,_that.identification,_that.deletedAt,_that.pickUpTime,_that.receiveTime,_that.fromCity,_that.toCity,_that.orders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String createdAt,  String updatedAt,  int fromCityId,  int toCityId,  String status,  String identification,  String? deletedAt,  String? pickUpTime,  String? receiveTime,  OrderCityEntity? fromCity,  OrderCityEntity? toCity,  List<OrderEntity> orders)  $default,) {final _that = this;
switch (_that) {
case _AccumulatorEntity():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.fromCityId,_that.toCityId,_that.status,_that.identification,_that.deletedAt,_that.pickUpTime,_that.receiveTime,_that.fromCity,_that.toCity,_that.orders);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String createdAt,  String updatedAt,  int fromCityId,  int toCityId,  String status,  String identification,  String? deletedAt,  String? pickUpTime,  String? receiveTime,  OrderCityEntity? fromCity,  OrderCityEntity? toCity,  List<OrderEntity> orders)?  $default,) {final _that = this;
switch (_that) {
case _AccumulatorEntity() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.fromCityId,_that.toCityId,_that.status,_that.identification,_that.deletedAt,_that.pickUpTime,_that.receiveTime,_that.fromCity,_that.toCity,_that.orders);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccumulatorEntity implements AccumulatorEntity {
  const _AccumulatorEntity({required this.id, required this.createdAt, required this.updatedAt, required this.fromCityId, required this.toCityId, required this.status, required this.identification, this.deletedAt, this.pickUpTime, this.receiveTime, this.fromCity, this.toCity, final  List<OrderEntity> orders = const []}): _orders = orders;
  factory _AccumulatorEntity.fromJson(Map<String, dynamic> json) => _$AccumulatorEntityFromJson(json);

@override final  int id;
@override final  String createdAt;
@override final  String updatedAt;
@override final  int fromCityId;
@override final  int toCityId;
@override final  String status;
@override final  String identification;
@override final  String? deletedAt;
@override final  String? pickUpTime;
@override final  String? receiveTime;
@override final  OrderCityEntity? fromCity;
@override final  OrderCityEntity? toCity;
 final  List<OrderEntity> _orders;
@override@JsonKey() List<OrderEntity> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}


/// Create a copy of AccumulatorEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccumulatorEntityCopyWith<_AccumulatorEntity> get copyWith => __$AccumulatorEntityCopyWithImpl<_AccumulatorEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccumulatorEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccumulatorEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.fromCityId, fromCityId) || other.fromCityId == fromCityId)&&(identical(other.toCityId, toCityId) || other.toCityId == toCityId)&&(identical(other.status, status) || other.status == status)&&(identical(other.identification, identification) || other.identification == identification)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.pickUpTime, pickUpTime) || other.pickUpTime == pickUpTime)&&(identical(other.receiveTime, receiveTime) || other.receiveTime == receiveTime)&&(identical(other.fromCity, fromCity) || other.fromCity == fromCity)&&(identical(other.toCity, toCity) || other.toCity == toCity)&&const DeepCollectionEquality().equals(other._orders, _orders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,fromCityId,toCityId,status,identification,deletedAt,pickUpTime,receiveTime,fromCity,toCity,const DeepCollectionEquality().hash(_orders));

@override
String toString() {
  return 'AccumulatorEntity(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, fromCityId: $fromCityId, toCityId: $toCityId, status: $status, identification: $identification, deletedAt: $deletedAt, pickUpTime: $pickUpTime, receiveTime: $receiveTime, fromCity: $fromCity, toCity: $toCity, orders: $orders)';
}


}

/// @nodoc
abstract mixin class _$AccumulatorEntityCopyWith<$Res> implements $AccumulatorEntityCopyWith<$Res> {
  factory _$AccumulatorEntityCopyWith(_AccumulatorEntity value, $Res Function(_AccumulatorEntity) _then) = __$AccumulatorEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String createdAt, String updatedAt, int fromCityId, int toCityId, String status, String identification, String? deletedAt, String? pickUpTime, String? receiveTime, OrderCityEntity? fromCity, OrderCityEntity? toCity, List<OrderEntity> orders
});


@override $OrderCityEntityCopyWith<$Res>? get fromCity;@override $OrderCityEntityCopyWith<$Res>? get toCity;

}
/// @nodoc
class __$AccumulatorEntityCopyWithImpl<$Res>
    implements _$AccumulatorEntityCopyWith<$Res> {
  __$AccumulatorEntityCopyWithImpl(this._self, this._then);

  final _AccumulatorEntity _self;
  final $Res Function(_AccumulatorEntity) _then;

/// Create a copy of AccumulatorEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? fromCityId = null,Object? toCityId = null,Object? status = null,Object? identification = null,Object? deletedAt = freezed,Object? pickUpTime = freezed,Object? receiveTime = freezed,Object? fromCity = freezed,Object? toCity = freezed,Object? orders = null,}) {
  return _then(_AccumulatorEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,fromCityId: null == fromCityId ? _self.fromCityId : fromCityId // ignore: cast_nullable_to_non_nullable
as int,toCityId: null == toCityId ? _self.toCityId : toCityId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,identification: null == identification ? _self.identification : identification // ignore: cast_nullable_to_non_nullable
as String,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,pickUpTime: freezed == pickUpTime ? _self.pickUpTime : pickUpTime // ignore: cast_nullable_to_non_nullable
as String?,receiveTime: freezed == receiveTime ? _self.receiveTime : receiveTime // ignore: cast_nullable_to_non_nullable
as String?,fromCity: freezed == fromCity ? _self.fromCity : fromCity // ignore: cast_nullable_to_non_nullable
as OrderCityEntity?,toCity: freezed == toCity ? _self.toCity : toCity // ignore: cast_nullable_to_non_nullable
as OrderCityEntity?,orders: null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderEntity>,
  ));
}

/// Create a copy of AccumulatorEntity
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
}/// Create a copy of AccumulatorEntity
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

// dart format on
