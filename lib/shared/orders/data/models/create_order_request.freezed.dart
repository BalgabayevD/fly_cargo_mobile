// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateOrderRequest {

 bool get isDefect; bool get isFragile; String get category; String get comment; List<String> get contentPhotos; String get description; String get fromAddress; String get fromApartment; int get fromCityId; String get fromEntrance; String get fromFloor; double get fromLatitude; double get fromLongitude; double get height; double get length; List<String> get photos; int get tariffId; String get toAddress; String get toApartment; int get toCityId; String get toEntrance; String get toFloor; double get toLatitude; double get toLongitude; String get toName; String get toPhone; double get volumetricWeight; double get weight; double get width;
/// Create a copy of CreateOrderRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateOrderRequestCopyWith<CreateOrderRequest> get copyWith => _$CreateOrderRequestCopyWithImpl<CreateOrderRequest>(this as CreateOrderRequest, _$identity);

  /// Serializes this CreateOrderRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOrderRequest&&(identical(other.isDefect, isDefect) || other.isDefect == isDefect)&&(identical(other.isFragile, isFragile) || other.isFragile == isFragile)&&(identical(other.category, category) || other.category == category)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other.contentPhotos, contentPhotos)&&(identical(other.description, description) || other.description == description)&&(identical(other.fromAddress, fromAddress) || other.fromAddress == fromAddress)&&(identical(other.fromApartment, fromApartment) || other.fromApartment == fromApartment)&&(identical(other.fromCityId, fromCityId) || other.fromCityId == fromCityId)&&(identical(other.fromEntrance, fromEntrance) || other.fromEntrance == fromEntrance)&&(identical(other.fromFloor, fromFloor) || other.fromFloor == fromFloor)&&(identical(other.fromLatitude, fromLatitude) || other.fromLatitude == fromLatitude)&&(identical(other.fromLongitude, fromLongitude) || other.fromLongitude == fromLongitude)&&(identical(other.height, height) || other.height == height)&&(identical(other.length, length) || other.length == length)&&const DeepCollectionEquality().equals(other.photos, photos)&&(identical(other.tariffId, tariffId) || other.tariffId == tariffId)&&(identical(other.toAddress, toAddress) || other.toAddress == toAddress)&&(identical(other.toApartment, toApartment) || other.toApartment == toApartment)&&(identical(other.toCityId, toCityId) || other.toCityId == toCityId)&&(identical(other.toEntrance, toEntrance) || other.toEntrance == toEntrance)&&(identical(other.toFloor, toFloor) || other.toFloor == toFloor)&&(identical(other.toLatitude, toLatitude) || other.toLatitude == toLatitude)&&(identical(other.toLongitude, toLongitude) || other.toLongitude == toLongitude)&&(identical(other.toName, toName) || other.toName == toName)&&(identical(other.toPhone, toPhone) || other.toPhone == toPhone)&&(identical(other.volumetricWeight, volumetricWeight) || other.volumetricWeight == volumetricWeight)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.width, width) || other.width == width));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,isDefect,isFragile,category,comment,const DeepCollectionEquality().hash(contentPhotos),description,fromAddress,fromApartment,fromCityId,fromEntrance,fromFloor,fromLatitude,fromLongitude,height,length,const DeepCollectionEquality().hash(photos),tariffId,toAddress,toApartment,toCityId,toEntrance,toFloor,toLatitude,toLongitude,toName,toPhone,volumetricWeight,weight,width]);

@override
String toString() {
  return 'CreateOrderRequest(isDefect: $isDefect, isFragile: $isFragile, category: $category, comment: $comment, contentPhotos: $contentPhotos, description: $description, fromAddress: $fromAddress, fromApartment: $fromApartment, fromCityId: $fromCityId, fromEntrance: $fromEntrance, fromFloor: $fromFloor, fromLatitude: $fromLatitude, fromLongitude: $fromLongitude, height: $height, length: $length, photos: $photos, tariffId: $tariffId, toAddress: $toAddress, toApartment: $toApartment, toCityId: $toCityId, toEntrance: $toEntrance, toFloor: $toFloor, toLatitude: $toLatitude, toLongitude: $toLongitude, toName: $toName, toPhone: $toPhone, volumetricWeight: $volumetricWeight, weight: $weight, width: $width)';
}


}

/// @nodoc
abstract mixin class $CreateOrderRequestCopyWith<$Res>  {
  factory $CreateOrderRequestCopyWith(CreateOrderRequest value, $Res Function(CreateOrderRequest) _then) = _$CreateOrderRequestCopyWithImpl;
@useResult
$Res call({
 bool isDefect, bool isFragile, String category, String comment, List<String> contentPhotos, String description, String fromAddress, String fromApartment, int fromCityId, String fromEntrance, String fromFloor, double fromLatitude, double fromLongitude, double height, double length, List<String> photos, int tariffId, String toAddress, String toApartment, int toCityId, String toEntrance, String toFloor, double toLatitude, double toLongitude, String toName, String toPhone, double volumetricWeight, double weight, double width
});




}
/// @nodoc
class _$CreateOrderRequestCopyWithImpl<$Res>
    implements $CreateOrderRequestCopyWith<$Res> {
  _$CreateOrderRequestCopyWithImpl(this._self, this._then);

  final CreateOrderRequest _self;
  final $Res Function(CreateOrderRequest) _then;

/// Create a copy of CreateOrderRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isDefect = null,Object? isFragile = null,Object? category = null,Object? comment = null,Object? contentPhotos = null,Object? description = null,Object? fromAddress = null,Object? fromApartment = null,Object? fromCityId = null,Object? fromEntrance = null,Object? fromFloor = null,Object? fromLatitude = null,Object? fromLongitude = null,Object? height = null,Object? length = null,Object? photos = null,Object? tariffId = null,Object? toAddress = null,Object? toApartment = null,Object? toCityId = null,Object? toEntrance = null,Object? toFloor = null,Object? toLatitude = null,Object? toLongitude = null,Object? toName = null,Object? toPhone = null,Object? volumetricWeight = null,Object? weight = null,Object? width = null,}) {
  return _then(_self.copyWith(
isDefect: null == isDefect ? _self.isDefect : isDefect // ignore: cast_nullable_to_non_nullable
as bool,isFragile: null == isFragile ? _self.isFragile : isFragile // ignore: cast_nullable_to_non_nullable
as bool,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,contentPhotos: null == contentPhotos ? _self.contentPhotos : contentPhotos // ignore: cast_nullable_to_non_nullable
as List<String>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,fromAddress: null == fromAddress ? _self.fromAddress : fromAddress // ignore: cast_nullable_to_non_nullable
as String,fromApartment: null == fromApartment ? _self.fromApartment : fromApartment // ignore: cast_nullable_to_non_nullable
as String,fromCityId: null == fromCityId ? _self.fromCityId : fromCityId // ignore: cast_nullable_to_non_nullable
as int,fromEntrance: null == fromEntrance ? _self.fromEntrance : fromEntrance // ignore: cast_nullable_to_non_nullable
as String,fromFloor: null == fromFloor ? _self.fromFloor : fromFloor // ignore: cast_nullable_to_non_nullable
as String,fromLatitude: null == fromLatitude ? _self.fromLatitude : fromLatitude // ignore: cast_nullable_to_non_nullable
as double,fromLongitude: null == fromLongitude ? _self.fromLongitude : fromLongitude // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,tariffId: null == tariffId ? _self.tariffId : tariffId // ignore: cast_nullable_to_non_nullable
as int,toAddress: null == toAddress ? _self.toAddress : toAddress // ignore: cast_nullable_to_non_nullable
as String,toApartment: null == toApartment ? _self.toApartment : toApartment // ignore: cast_nullable_to_non_nullable
as String,toCityId: null == toCityId ? _self.toCityId : toCityId // ignore: cast_nullable_to_non_nullable
as int,toEntrance: null == toEntrance ? _self.toEntrance : toEntrance // ignore: cast_nullable_to_non_nullable
as String,toFloor: null == toFloor ? _self.toFloor : toFloor // ignore: cast_nullable_to_non_nullable
as String,toLatitude: null == toLatitude ? _self.toLatitude : toLatitude // ignore: cast_nullable_to_non_nullable
as double,toLongitude: null == toLongitude ? _self.toLongitude : toLongitude // ignore: cast_nullable_to_non_nullable
as double,toName: null == toName ? _self.toName : toName // ignore: cast_nullable_to_non_nullable
as String,toPhone: null == toPhone ? _self.toPhone : toPhone // ignore: cast_nullable_to_non_nullable
as String,volumetricWeight: null == volumetricWeight ? _self.volumetricWeight : volumetricWeight // ignore: cast_nullable_to_non_nullable
as double,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateOrderRequest].
extension CreateOrderRequestPatterns on CreateOrderRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateOrderRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateOrderRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateOrderRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateOrderRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateOrderRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateOrderRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isDefect,  bool isFragile,  String category,  String comment,  List<String> contentPhotos,  String description,  String fromAddress,  String fromApartment,  int fromCityId,  String fromEntrance,  String fromFloor,  double fromLatitude,  double fromLongitude,  double height,  double length,  List<String> photos,  int tariffId,  String toAddress,  String toApartment,  int toCityId,  String toEntrance,  String toFloor,  double toLatitude,  double toLongitude,  String toName,  String toPhone,  double volumetricWeight,  double weight,  double width)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateOrderRequest() when $default != null:
return $default(_that.isDefect,_that.isFragile,_that.category,_that.comment,_that.contentPhotos,_that.description,_that.fromAddress,_that.fromApartment,_that.fromCityId,_that.fromEntrance,_that.fromFloor,_that.fromLatitude,_that.fromLongitude,_that.height,_that.length,_that.photos,_that.tariffId,_that.toAddress,_that.toApartment,_that.toCityId,_that.toEntrance,_that.toFloor,_that.toLatitude,_that.toLongitude,_that.toName,_that.toPhone,_that.volumetricWeight,_that.weight,_that.width);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isDefect,  bool isFragile,  String category,  String comment,  List<String> contentPhotos,  String description,  String fromAddress,  String fromApartment,  int fromCityId,  String fromEntrance,  String fromFloor,  double fromLatitude,  double fromLongitude,  double height,  double length,  List<String> photos,  int tariffId,  String toAddress,  String toApartment,  int toCityId,  String toEntrance,  String toFloor,  double toLatitude,  double toLongitude,  String toName,  String toPhone,  double volumetricWeight,  double weight,  double width)  $default,) {final _that = this;
switch (_that) {
case _CreateOrderRequest():
return $default(_that.isDefect,_that.isFragile,_that.category,_that.comment,_that.contentPhotos,_that.description,_that.fromAddress,_that.fromApartment,_that.fromCityId,_that.fromEntrance,_that.fromFloor,_that.fromLatitude,_that.fromLongitude,_that.height,_that.length,_that.photos,_that.tariffId,_that.toAddress,_that.toApartment,_that.toCityId,_that.toEntrance,_that.toFloor,_that.toLatitude,_that.toLongitude,_that.toName,_that.toPhone,_that.volumetricWeight,_that.weight,_that.width);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isDefect,  bool isFragile,  String category,  String comment,  List<String> contentPhotos,  String description,  String fromAddress,  String fromApartment,  int fromCityId,  String fromEntrance,  String fromFloor,  double fromLatitude,  double fromLongitude,  double height,  double length,  List<String> photos,  int tariffId,  String toAddress,  String toApartment,  int toCityId,  String toEntrance,  String toFloor,  double toLatitude,  double toLongitude,  String toName,  String toPhone,  double volumetricWeight,  double weight,  double width)?  $default,) {final _that = this;
switch (_that) {
case _CreateOrderRequest() when $default != null:
return $default(_that.isDefect,_that.isFragile,_that.category,_that.comment,_that.contentPhotos,_that.description,_that.fromAddress,_that.fromApartment,_that.fromCityId,_that.fromEntrance,_that.fromFloor,_that.fromLatitude,_that.fromLongitude,_that.height,_that.length,_that.photos,_that.tariffId,_that.toAddress,_that.toApartment,_that.toCityId,_that.toEntrance,_that.toFloor,_that.toLatitude,_that.toLongitude,_that.toName,_that.toPhone,_that.volumetricWeight,_that.weight,_that.width);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateOrderRequest implements CreateOrderRequest {
  const _CreateOrderRequest({required this.isDefect, required this.isFragile, required this.category, required this.comment, required final  List<String> contentPhotos, required this.description, required this.fromAddress, required this.fromApartment, required this.fromCityId, required this.fromEntrance, required this.fromFloor, required this.fromLatitude, required this.fromLongitude, required this.height, required this.length, required final  List<String> photos, required this.tariffId, required this.toAddress, required this.toApartment, required this.toCityId, required this.toEntrance, required this.toFloor, required this.toLatitude, required this.toLongitude, required this.toName, required this.toPhone, required this.volumetricWeight, required this.weight, required this.width}): _contentPhotos = contentPhotos,_photos = photos;
  factory _CreateOrderRequest.fromJson(Map<String, dynamic> json) => _$CreateOrderRequestFromJson(json);

@override final  bool isDefect;
@override final  bool isFragile;
@override final  String category;
@override final  String comment;
 final  List<String> _contentPhotos;
@override List<String> get contentPhotos {
  if (_contentPhotos is EqualUnmodifiableListView) return _contentPhotos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contentPhotos);
}

@override final  String description;
@override final  String fromAddress;
@override final  String fromApartment;
@override final  int fromCityId;
@override final  String fromEntrance;
@override final  String fromFloor;
@override final  double fromLatitude;
@override final  double fromLongitude;
@override final  double height;
@override final  double length;
 final  List<String> _photos;
@override List<String> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

@override final  int tariffId;
@override final  String toAddress;
@override final  String toApartment;
@override final  int toCityId;
@override final  String toEntrance;
@override final  String toFloor;
@override final  double toLatitude;
@override final  double toLongitude;
@override final  String toName;
@override final  String toPhone;
@override final  double volumetricWeight;
@override final  double weight;
@override final  double width;

/// Create a copy of CreateOrderRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateOrderRequestCopyWith<_CreateOrderRequest> get copyWith => __$CreateOrderRequestCopyWithImpl<_CreateOrderRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateOrderRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateOrderRequest&&(identical(other.isDefect, isDefect) || other.isDefect == isDefect)&&(identical(other.isFragile, isFragile) || other.isFragile == isFragile)&&(identical(other.category, category) || other.category == category)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other._contentPhotos, _contentPhotos)&&(identical(other.description, description) || other.description == description)&&(identical(other.fromAddress, fromAddress) || other.fromAddress == fromAddress)&&(identical(other.fromApartment, fromApartment) || other.fromApartment == fromApartment)&&(identical(other.fromCityId, fromCityId) || other.fromCityId == fromCityId)&&(identical(other.fromEntrance, fromEntrance) || other.fromEntrance == fromEntrance)&&(identical(other.fromFloor, fromFloor) || other.fromFloor == fromFloor)&&(identical(other.fromLatitude, fromLatitude) || other.fromLatitude == fromLatitude)&&(identical(other.fromLongitude, fromLongitude) || other.fromLongitude == fromLongitude)&&(identical(other.height, height) || other.height == height)&&(identical(other.length, length) || other.length == length)&&const DeepCollectionEquality().equals(other._photos, _photos)&&(identical(other.tariffId, tariffId) || other.tariffId == tariffId)&&(identical(other.toAddress, toAddress) || other.toAddress == toAddress)&&(identical(other.toApartment, toApartment) || other.toApartment == toApartment)&&(identical(other.toCityId, toCityId) || other.toCityId == toCityId)&&(identical(other.toEntrance, toEntrance) || other.toEntrance == toEntrance)&&(identical(other.toFloor, toFloor) || other.toFloor == toFloor)&&(identical(other.toLatitude, toLatitude) || other.toLatitude == toLatitude)&&(identical(other.toLongitude, toLongitude) || other.toLongitude == toLongitude)&&(identical(other.toName, toName) || other.toName == toName)&&(identical(other.toPhone, toPhone) || other.toPhone == toPhone)&&(identical(other.volumetricWeight, volumetricWeight) || other.volumetricWeight == volumetricWeight)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.width, width) || other.width == width));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,isDefect,isFragile,category,comment,const DeepCollectionEquality().hash(_contentPhotos),description,fromAddress,fromApartment,fromCityId,fromEntrance,fromFloor,fromLatitude,fromLongitude,height,length,const DeepCollectionEquality().hash(_photos),tariffId,toAddress,toApartment,toCityId,toEntrance,toFloor,toLatitude,toLongitude,toName,toPhone,volumetricWeight,weight,width]);

@override
String toString() {
  return 'CreateOrderRequest(isDefect: $isDefect, isFragile: $isFragile, category: $category, comment: $comment, contentPhotos: $contentPhotos, description: $description, fromAddress: $fromAddress, fromApartment: $fromApartment, fromCityId: $fromCityId, fromEntrance: $fromEntrance, fromFloor: $fromFloor, fromLatitude: $fromLatitude, fromLongitude: $fromLongitude, height: $height, length: $length, photos: $photos, tariffId: $tariffId, toAddress: $toAddress, toApartment: $toApartment, toCityId: $toCityId, toEntrance: $toEntrance, toFloor: $toFloor, toLatitude: $toLatitude, toLongitude: $toLongitude, toName: $toName, toPhone: $toPhone, volumetricWeight: $volumetricWeight, weight: $weight, width: $width)';
}


}

/// @nodoc
abstract mixin class _$CreateOrderRequestCopyWith<$Res> implements $CreateOrderRequestCopyWith<$Res> {
  factory _$CreateOrderRequestCopyWith(_CreateOrderRequest value, $Res Function(_CreateOrderRequest) _then) = __$CreateOrderRequestCopyWithImpl;
@override @useResult
$Res call({
 bool isDefect, bool isFragile, String category, String comment, List<String> contentPhotos, String description, String fromAddress, String fromApartment, int fromCityId, String fromEntrance, String fromFloor, double fromLatitude, double fromLongitude, double height, double length, List<String> photos, int tariffId, String toAddress, String toApartment, int toCityId, String toEntrance, String toFloor, double toLatitude, double toLongitude, String toName, String toPhone, double volumetricWeight, double weight, double width
});




}
/// @nodoc
class __$CreateOrderRequestCopyWithImpl<$Res>
    implements _$CreateOrderRequestCopyWith<$Res> {
  __$CreateOrderRequestCopyWithImpl(this._self, this._then);

  final _CreateOrderRequest _self;
  final $Res Function(_CreateOrderRequest) _then;

/// Create a copy of CreateOrderRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isDefect = null,Object? isFragile = null,Object? category = null,Object? comment = null,Object? contentPhotos = null,Object? description = null,Object? fromAddress = null,Object? fromApartment = null,Object? fromCityId = null,Object? fromEntrance = null,Object? fromFloor = null,Object? fromLatitude = null,Object? fromLongitude = null,Object? height = null,Object? length = null,Object? photos = null,Object? tariffId = null,Object? toAddress = null,Object? toApartment = null,Object? toCityId = null,Object? toEntrance = null,Object? toFloor = null,Object? toLatitude = null,Object? toLongitude = null,Object? toName = null,Object? toPhone = null,Object? volumetricWeight = null,Object? weight = null,Object? width = null,}) {
  return _then(_CreateOrderRequest(
isDefect: null == isDefect ? _self.isDefect : isDefect // ignore: cast_nullable_to_non_nullable
as bool,isFragile: null == isFragile ? _self.isFragile : isFragile // ignore: cast_nullable_to_non_nullable
as bool,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,contentPhotos: null == contentPhotos ? _self._contentPhotos : contentPhotos // ignore: cast_nullable_to_non_nullable
as List<String>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,fromAddress: null == fromAddress ? _self.fromAddress : fromAddress // ignore: cast_nullable_to_non_nullable
as String,fromApartment: null == fromApartment ? _self.fromApartment : fromApartment // ignore: cast_nullable_to_non_nullable
as String,fromCityId: null == fromCityId ? _self.fromCityId : fromCityId // ignore: cast_nullable_to_non_nullable
as int,fromEntrance: null == fromEntrance ? _self.fromEntrance : fromEntrance // ignore: cast_nullable_to_non_nullable
as String,fromFloor: null == fromFloor ? _self.fromFloor : fromFloor // ignore: cast_nullable_to_non_nullable
as String,fromLatitude: null == fromLatitude ? _self.fromLatitude : fromLatitude // ignore: cast_nullable_to_non_nullable
as double,fromLongitude: null == fromLongitude ? _self.fromLongitude : fromLongitude // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,tariffId: null == tariffId ? _self.tariffId : tariffId // ignore: cast_nullable_to_non_nullable
as int,toAddress: null == toAddress ? _self.toAddress : toAddress // ignore: cast_nullable_to_non_nullable
as String,toApartment: null == toApartment ? _self.toApartment : toApartment // ignore: cast_nullable_to_non_nullable
as String,toCityId: null == toCityId ? _self.toCityId : toCityId // ignore: cast_nullable_to_non_nullable
as int,toEntrance: null == toEntrance ? _self.toEntrance : toEntrance // ignore: cast_nullable_to_non_nullable
as String,toFloor: null == toFloor ? _self.toFloor : toFloor // ignore: cast_nullable_to_non_nullable
as String,toLatitude: null == toLatitude ? _self.toLatitude : toLatitude // ignore: cast_nullable_to_non_nullable
as double,toLongitude: null == toLongitude ? _self.toLongitude : toLongitude // ignore: cast_nullable_to_non_nullable
as double,toName: null == toName ? _self.toName : toName // ignore: cast_nullable_to_non_nullable
as String,toPhone: null == toPhone ? _self.toPhone : toPhone // ignore: cast_nullable_to_non_nullable
as String,volumetricWeight: null == volumetricWeight ? _self.volumetricWeight : volumetricWeight // ignore: cast_nullable_to_non_nullable
as double,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
