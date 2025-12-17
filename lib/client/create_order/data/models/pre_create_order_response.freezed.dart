// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pre_create_order_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PreCreateOrderData {

 double get weight; int get tariffId; String get description; int get height; int get length; int get width;
/// Create a copy of PreCreateOrderData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreCreateOrderDataCopyWith<PreCreateOrderData> get copyWith => _$PreCreateOrderDataCopyWithImpl<PreCreateOrderData>(this as PreCreateOrderData, _$identity);

  /// Serializes this PreCreateOrderData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreCreateOrderData&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.tariffId, tariffId) || other.tariffId == tariffId)&&(identical(other.description, description) || other.description == description)&&(identical(other.height, height) || other.height == height)&&(identical(other.length, length) || other.length == length)&&(identical(other.width, width) || other.width == width));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weight,tariffId,description,height,length,width);

@override
String toString() {
  return 'PreCreateOrderData(weight: $weight, tariffId: $tariffId, description: $description, height: $height, length: $length, width: $width)';
}


}

/// @nodoc
abstract mixin class $PreCreateOrderDataCopyWith<$Res>  {
  factory $PreCreateOrderDataCopyWith(PreCreateOrderData value, $Res Function(PreCreateOrderData) _then) = _$PreCreateOrderDataCopyWithImpl;
@useResult
$Res call({
 double weight, int tariffId, String description, int height, int length, int width
});




}
/// @nodoc
class _$PreCreateOrderDataCopyWithImpl<$Res>
    implements $PreCreateOrderDataCopyWith<$Res> {
  _$PreCreateOrderDataCopyWithImpl(this._self, this._then);

  final PreCreateOrderData _self;
  final $Res Function(PreCreateOrderData) _then;

/// Create a copy of PreCreateOrderData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weight = null,Object? tariffId = null,Object? description = null,Object? height = null,Object? length = null,Object? width = null,}) {
  return _then(_self.copyWith(
weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,tariffId: null == tariffId ? _self.tariffId : tariffId // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PreCreateOrderData].
extension PreCreateOrderDataPatterns on PreCreateOrderData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreCreateOrderData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreCreateOrderData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreCreateOrderData value)  $default,){
final _that = this;
switch (_that) {
case _PreCreateOrderData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreCreateOrderData value)?  $default,){
final _that = this;
switch (_that) {
case _PreCreateOrderData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double weight,  int tariffId,  String description,  int height,  int length,  int width)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreCreateOrderData() when $default != null:
return $default(_that.weight,_that.tariffId,_that.description,_that.height,_that.length,_that.width);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double weight,  int tariffId,  String description,  int height,  int length,  int width)  $default,) {final _that = this;
switch (_that) {
case _PreCreateOrderData():
return $default(_that.weight,_that.tariffId,_that.description,_that.height,_that.length,_that.width);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double weight,  int tariffId,  String description,  int height,  int length,  int width)?  $default,) {final _that = this;
switch (_that) {
case _PreCreateOrderData() when $default != null:
return $default(_that.weight,_that.tariffId,_that.description,_that.height,_that.length,_that.width);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreCreateOrderData implements PreCreateOrderData {
  const _PreCreateOrderData({required this.weight, required this.tariffId, required this.description, required this.height, required this.length, required this.width});
  factory _PreCreateOrderData.fromJson(Map<String, dynamic> json) => _$PreCreateOrderDataFromJson(json);

@override final  double weight;
@override final  int tariffId;
@override final  String description;
@override final  int height;
@override final  int length;
@override final  int width;

/// Create a copy of PreCreateOrderData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreCreateOrderDataCopyWith<_PreCreateOrderData> get copyWith => __$PreCreateOrderDataCopyWithImpl<_PreCreateOrderData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreCreateOrderDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreCreateOrderData&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.tariffId, tariffId) || other.tariffId == tariffId)&&(identical(other.description, description) || other.description == description)&&(identical(other.height, height) || other.height == height)&&(identical(other.length, length) || other.length == length)&&(identical(other.width, width) || other.width == width));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weight,tariffId,description,height,length,width);

@override
String toString() {
  return 'PreCreateOrderData(weight: $weight, tariffId: $tariffId, description: $description, height: $height, length: $length, width: $width)';
}


}

/// @nodoc
abstract mixin class _$PreCreateOrderDataCopyWith<$Res> implements $PreCreateOrderDataCopyWith<$Res> {
  factory _$PreCreateOrderDataCopyWith(_PreCreateOrderData value, $Res Function(_PreCreateOrderData) _then) = __$PreCreateOrderDataCopyWithImpl;
@override @useResult
$Res call({
 double weight, int tariffId, String description, int height, int length, int width
});




}
/// @nodoc
class __$PreCreateOrderDataCopyWithImpl<$Res>
    implements _$PreCreateOrderDataCopyWith<$Res> {
  __$PreCreateOrderDataCopyWithImpl(this._self, this._then);

  final _PreCreateOrderData _self;
  final $Res Function(_PreCreateOrderData) _then;

/// Create a copy of PreCreateOrderData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weight = null,Object? tariffId = null,Object? description = null,Object? height = null,Object? length = null,Object? width = null,}) {
  return _then(_PreCreateOrderData(
weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,tariffId: null == tariffId ? _self.tariffId : tariffId // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PreCreateOrderResult {

 String get status; bool get success; PreCreateOrderData get result;
/// Create a copy of PreCreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreCreateOrderResultCopyWith<PreCreateOrderResult> get copyWith => _$PreCreateOrderResultCopyWithImpl<PreCreateOrderResult>(this as PreCreateOrderResult, _$identity);

  /// Serializes this PreCreateOrderResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreCreateOrderResult&&(identical(other.status, status) || other.status == status)&&(identical(other.success, success) || other.success == success)&&(identical(other.result, result) || other.result == result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,success,result);

@override
String toString() {
  return 'PreCreateOrderResult(status: $status, success: $success, result: $result)';
}


}

/// @nodoc
abstract mixin class $PreCreateOrderResultCopyWith<$Res>  {
  factory $PreCreateOrderResultCopyWith(PreCreateOrderResult value, $Res Function(PreCreateOrderResult) _then) = _$PreCreateOrderResultCopyWithImpl;
@useResult
$Res call({
 String status, bool success, PreCreateOrderData result
});


$PreCreateOrderDataCopyWith<$Res> get result;

}
/// @nodoc
class _$PreCreateOrderResultCopyWithImpl<$Res>
    implements $PreCreateOrderResultCopyWith<$Res> {
  _$PreCreateOrderResultCopyWithImpl(this._self, this._then);

  final PreCreateOrderResult _self;
  final $Res Function(PreCreateOrderResult) _then;

/// Create a copy of PreCreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? success = null,Object? result = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as PreCreateOrderData,
  ));
}
/// Create a copy of PreCreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreCreateOrderDataCopyWith<$Res> get result {
  
  return $PreCreateOrderDataCopyWith<$Res>(_self.result, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}


/// Adds pattern-matching-related methods to [PreCreateOrderResult].
extension PreCreateOrderResultPatterns on PreCreateOrderResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreCreateOrderResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreCreateOrderResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreCreateOrderResult value)  $default,){
final _that = this;
switch (_that) {
case _PreCreateOrderResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreCreateOrderResult value)?  $default,){
final _that = this;
switch (_that) {
case _PreCreateOrderResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  bool success,  PreCreateOrderData result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreCreateOrderResult() when $default != null:
return $default(_that.status,_that.success,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  bool success,  PreCreateOrderData result)  $default,) {final _that = this;
switch (_that) {
case _PreCreateOrderResult():
return $default(_that.status,_that.success,_that.result);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  bool success,  PreCreateOrderData result)?  $default,) {final _that = this;
switch (_that) {
case _PreCreateOrderResult() when $default != null:
return $default(_that.status,_that.success,_that.result);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreCreateOrderResult implements PreCreateOrderResult {
  const _PreCreateOrderResult({required this.status, required this.success, required this.result});
  factory _PreCreateOrderResult.fromJson(Map<String, dynamic> json) => _$PreCreateOrderResultFromJson(json);

@override final  String status;
@override final  bool success;
@override final  PreCreateOrderData result;

/// Create a copy of PreCreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreCreateOrderResultCopyWith<_PreCreateOrderResult> get copyWith => __$PreCreateOrderResultCopyWithImpl<_PreCreateOrderResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreCreateOrderResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreCreateOrderResult&&(identical(other.status, status) || other.status == status)&&(identical(other.success, success) || other.success == success)&&(identical(other.result, result) || other.result == result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,success,result);

@override
String toString() {
  return 'PreCreateOrderResult(status: $status, success: $success, result: $result)';
}


}

/// @nodoc
abstract mixin class _$PreCreateOrderResultCopyWith<$Res> implements $PreCreateOrderResultCopyWith<$Res> {
  factory _$PreCreateOrderResultCopyWith(_PreCreateOrderResult value, $Res Function(_PreCreateOrderResult) _then) = __$PreCreateOrderResultCopyWithImpl;
@override @useResult
$Res call({
 String status, bool success, PreCreateOrderData result
});


@override $PreCreateOrderDataCopyWith<$Res> get result;

}
/// @nodoc
class __$PreCreateOrderResultCopyWithImpl<$Res>
    implements _$PreCreateOrderResultCopyWith<$Res> {
  __$PreCreateOrderResultCopyWithImpl(this._self, this._then);

  final _PreCreateOrderResult _self;
  final $Res Function(_PreCreateOrderResult) _then;

/// Create a copy of PreCreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? success = null,Object? result = null,}) {
  return _then(_PreCreateOrderResult(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as PreCreateOrderData,
  ));
}

/// Create a copy of PreCreateOrderResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreCreateOrderDataCopyWith<$Res> get result {
  
  return $PreCreateOrderDataCopyWith<$Res>(_self.result, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}


/// @nodoc
mixin _$PreCreateOrderResponse {

 bool get success; int get code; String get description; PreCreateOrderResult? get data;
/// Create a copy of PreCreateOrderResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreCreateOrderResponseCopyWith<PreCreateOrderResponse> get copyWith => _$PreCreateOrderResponseCopyWithImpl<PreCreateOrderResponse>(this as PreCreateOrderResponse, _$identity);

  /// Serializes this PreCreateOrderResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreCreateOrderResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.code, code) || other.code == code)&&(identical(other.description, description) || other.description == description)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,code,description,data);

@override
String toString() {
  return 'PreCreateOrderResponse(success: $success, code: $code, description: $description, data: $data)';
}


}

/// @nodoc
abstract mixin class $PreCreateOrderResponseCopyWith<$Res>  {
  factory $PreCreateOrderResponseCopyWith(PreCreateOrderResponse value, $Res Function(PreCreateOrderResponse) _then) = _$PreCreateOrderResponseCopyWithImpl;
@useResult
$Res call({
 bool success, int code, String description, PreCreateOrderResult? data
});


$PreCreateOrderResultCopyWith<$Res>? get data;

}
/// @nodoc
class _$PreCreateOrderResponseCopyWithImpl<$Res>
    implements $PreCreateOrderResponseCopyWith<$Res> {
  _$PreCreateOrderResponseCopyWithImpl(this._self, this._then);

  final PreCreateOrderResponse _self;
  final $Res Function(PreCreateOrderResponse) _then;

/// Create a copy of PreCreateOrderResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? code = null,Object? description = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PreCreateOrderResult?,
  ));
}
/// Create a copy of PreCreateOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreCreateOrderResultCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $PreCreateOrderResultCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [PreCreateOrderResponse].
extension PreCreateOrderResponsePatterns on PreCreateOrderResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreCreateOrderResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreCreateOrderResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreCreateOrderResponse value)  $default,){
final _that = this;
switch (_that) {
case _PreCreateOrderResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreCreateOrderResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PreCreateOrderResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  int code,  String description,  PreCreateOrderResult? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreCreateOrderResponse() when $default != null:
return $default(_that.success,_that.code,_that.description,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  int code,  String description,  PreCreateOrderResult? data)  $default,) {final _that = this;
switch (_that) {
case _PreCreateOrderResponse():
return $default(_that.success,_that.code,_that.description,_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  int code,  String description,  PreCreateOrderResult? data)?  $default,) {final _that = this;
switch (_that) {
case _PreCreateOrderResponse() when $default != null:
return $default(_that.success,_that.code,_that.description,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreCreateOrderResponse implements PreCreateOrderResponse {
  const _PreCreateOrderResponse({required this.success, required this.code, required this.description, this.data});
  factory _PreCreateOrderResponse.fromJson(Map<String, dynamic> json) => _$PreCreateOrderResponseFromJson(json);

@override final  bool success;
@override final  int code;
@override final  String description;
@override final  PreCreateOrderResult? data;

/// Create a copy of PreCreateOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreCreateOrderResponseCopyWith<_PreCreateOrderResponse> get copyWith => __$PreCreateOrderResponseCopyWithImpl<_PreCreateOrderResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreCreateOrderResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreCreateOrderResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.code, code) || other.code == code)&&(identical(other.description, description) || other.description == description)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,code,description,data);

@override
String toString() {
  return 'PreCreateOrderResponse(success: $success, code: $code, description: $description, data: $data)';
}


}

/// @nodoc
abstract mixin class _$PreCreateOrderResponseCopyWith<$Res> implements $PreCreateOrderResponseCopyWith<$Res> {
  factory _$PreCreateOrderResponseCopyWith(_PreCreateOrderResponse value, $Res Function(_PreCreateOrderResponse) _then) = __$PreCreateOrderResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, int code, String description, PreCreateOrderResult? data
});


@override $PreCreateOrderResultCopyWith<$Res>? get data;

}
/// @nodoc
class __$PreCreateOrderResponseCopyWithImpl<$Res>
    implements _$PreCreateOrderResponseCopyWith<$Res> {
  __$PreCreateOrderResponseCopyWithImpl(this._self, this._then);

  final _PreCreateOrderResponse _self;
  final $Res Function(_PreCreateOrderResponse) _then;

/// Create a copy of PreCreateOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? code = null,Object? description = null,Object? data = freezed,}) {
  return _then(_PreCreateOrderResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PreCreateOrderResult?,
  ));
}

/// Create a copy of PreCreateOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreCreateOrderResultCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $PreCreateOrderResultCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
