// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_order_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateOrderResponse {

 OrderModel get data;
/// Create a copy of CreateOrderResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateOrderResponseCopyWith<CreateOrderResponse> get copyWith => _$CreateOrderResponseCopyWithImpl<CreateOrderResponse>(this as CreateOrderResponse, _$identity);

  /// Serializes this CreateOrderResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOrderResponse&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'CreateOrderResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class $CreateOrderResponseCopyWith<$Res>  {
  factory $CreateOrderResponseCopyWith(CreateOrderResponse value, $Res Function(CreateOrderResponse) _then) = _$CreateOrderResponseCopyWithImpl;
@useResult
$Res call({
 OrderModel data
});


$OrderModelCopyWith<$Res> get data;

}
/// @nodoc
class _$CreateOrderResponseCopyWithImpl<$Res>
    implements $CreateOrderResponseCopyWith<$Res> {
  _$CreateOrderResponseCopyWithImpl(this._self, this._then);

  final CreateOrderResponse _self;
  final $Res Function(CreateOrderResponse) _then;

/// Create a copy of CreateOrderResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OrderModel,
  ));
}
/// Create a copy of CreateOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderModelCopyWith<$Res> get data {
  
  return $OrderModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateOrderResponse].
extension CreateOrderResponsePatterns on CreateOrderResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateOrderResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateOrderResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateOrderResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreateOrderResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateOrderResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreateOrderResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OrderModel data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateOrderResponse() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OrderModel data)  $default,) {final _that = this;
switch (_that) {
case _CreateOrderResponse():
return $default(_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OrderModel data)?  $default,) {final _that = this;
switch (_that) {
case _CreateOrderResponse() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateOrderResponse implements CreateOrderResponse {
  const _CreateOrderResponse({required this.data});
  factory _CreateOrderResponse.fromJson(Map<String, dynamic> json) => _$CreateOrderResponseFromJson(json);

@override final  OrderModel data;

/// Create a copy of CreateOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateOrderResponseCopyWith<_CreateOrderResponse> get copyWith => __$CreateOrderResponseCopyWithImpl<_CreateOrderResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateOrderResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateOrderResponse&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'CreateOrderResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class _$CreateOrderResponseCopyWith<$Res> implements $CreateOrderResponseCopyWith<$Res> {
  factory _$CreateOrderResponseCopyWith(_CreateOrderResponse value, $Res Function(_CreateOrderResponse) _then) = __$CreateOrderResponseCopyWithImpl;
@override @useResult
$Res call({
 OrderModel data
});


@override $OrderModelCopyWith<$Res> get data;

}
/// @nodoc
class __$CreateOrderResponseCopyWithImpl<$Res>
    implements _$CreateOrderResponseCopyWith<$Res> {
  __$CreateOrderResponseCopyWithImpl(this._self, this._then);

  final _CreateOrderResponse _self;
  final $Res Function(_CreateOrderResponse) _then;

/// Create a copy of CreateOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_CreateOrderResponse(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OrderModel,
  ));
}

/// Create a copy of CreateOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderModelCopyWith<$Res> get data {
  
  return $OrderModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
