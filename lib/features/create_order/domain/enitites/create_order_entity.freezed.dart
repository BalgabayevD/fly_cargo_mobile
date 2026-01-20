// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_order_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateOrderEntity {

 String get comment; String get description; bool get isDefect; bool get isFragile; List<String> get photos; List<String> get contentPhotos; int get tariffId; double get height; double get length; double? get volumetricWeight; double get weight; double get width; int get fromCityId; String get fromAddress; String get fromApartment; int get toCityId; String get toAddress; String get toApartment; String get toEntrance; String get toName; String get toPhone; String get fromEntrance; String get fromFloor; double? get fromLatitude; double? get fromLongitude; String get toFloor; double? get toLatitude; double? get toLongitude; dynamic get category;
/// Create a copy of CreateOrderEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateOrderEntityCopyWith<CreateOrderEntity> get copyWith => _$CreateOrderEntityCopyWithImpl<CreateOrderEntity>(this as CreateOrderEntity, _$identity);

  /// Serializes this CreateOrderEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOrderEntity&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.description, description) || other.description == description)&&(identical(other.isDefect, isDefect) || other.isDefect == isDefect)&&(identical(other.isFragile, isFragile) || other.isFragile == isFragile)&&const DeepCollectionEquality().equals(other.photos, photos)&&const DeepCollectionEquality().equals(other.contentPhotos, contentPhotos)&&(identical(other.tariffId, tariffId) || other.tariffId == tariffId)&&(identical(other.height, height) || other.height == height)&&(identical(other.length, length) || other.length == length)&&(identical(other.volumetricWeight, volumetricWeight) || other.volumetricWeight == volumetricWeight)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.width, width) || other.width == width)&&(identical(other.fromCityId, fromCityId) || other.fromCityId == fromCityId)&&(identical(other.fromAddress, fromAddress) || other.fromAddress == fromAddress)&&(identical(other.fromApartment, fromApartment) || other.fromApartment == fromApartment)&&(identical(other.toCityId, toCityId) || other.toCityId == toCityId)&&(identical(other.toAddress, toAddress) || other.toAddress == toAddress)&&(identical(other.toApartment, toApartment) || other.toApartment == toApartment)&&(identical(other.toEntrance, toEntrance) || other.toEntrance == toEntrance)&&(identical(other.toName, toName) || other.toName == toName)&&(identical(other.toPhone, toPhone) || other.toPhone == toPhone)&&(identical(other.fromEntrance, fromEntrance) || other.fromEntrance == fromEntrance)&&(identical(other.fromFloor, fromFloor) || other.fromFloor == fromFloor)&&(identical(other.fromLatitude, fromLatitude) || other.fromLatitude == fromLatitude)&&(identical(other.fromLongitude, fromLongitude) || other.fromLongitude == fromLongitude)&&(identical(other.toFloor, toFloor) || other.toFloor == toFloor)&&(identical(other.toLatitude, toLatitude) || other.toLatitude == toLatitude)&&(identical(other.toLongitude, toLongitude) || other.toLongitude == toLongitude)&&const DeepCollectionEquality().equals(other.category, category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,comment,description,isDefect,isFragile,const DeepCollectionEquality().hash(photos),const DeepCollectionEquality().hash(contentPhotos),tariffId,height,length,volumetricWeight,weight,width,fromCityId,fromAddress,fromApartment,toCityId,toAddress,toApartment,toEntrance,toName,toPhone,fromEntrance,fromFloor,fromLatitude,fromLongitude,toFloor,toLatitude,toLongitude,const DeepCollectionEquality().hash(category)]);

@override
String toString() {
  return 'CreateOrderEntity(comment: $comment, description: $description, isDefect: $isDefect, isFragile: $isFragile, photos: $photos, contentPhotos: $contentPhotos, tariffId: $tariffId, height: $height, length: $length, volumetricWeight: $volumetricWeight, weight: $weight, width: $width, fromCityId: $fromCityId, fromAddress: $fromAddress, fromApartment: $fromApartment, toCityId: $toCityId, toAddress: $toAddress, toApartment: $toApartment, toEntrance: $toEntrance, toName: $toName, toPhone: $toPhone, fromEntrance: $fromEntrance, fromFloor: $fromFloor, fromLatitude: $fromLatitude, fromLongitude: $fromLongitude, toFloor: $toFloor, toLatitude: $toLatitude, toLongitude: $toLongitude, category: $category)';
}


}

/// @nodoc
abstract mixin class $CreateOrderEntityCopyWith<$Res>  {
  factory $CreateOrderEntityCopyWith(CreateOrderEntity value, $Res Function(CreateOrderEntity) _then) = _$CreateOrderEntityCopyWithImpl;
@useResult
$Res call({
 String comment, String description, bool isDefect, bool isFragile, List<String> photos, List<String> contentPhotos, int tariffId, double height, double length, double? volumetricWeight, double weight, double width, int fromCityId, String fromAddress, String fromApartment, int toCityId, String toAddress, String toApartment, String toEntrance, String toName, String toPhone, String fromEntrance, String fromFloor, double? fromLatitude, double? fromLongitude, String toFloor, double? toLatitude, double? toLongitude, dynamic category
});




}
/// @nodoc
class _$CreateOrderEntityCopyWithImpl<$Res>
    implements $CreateOrderEntityCopyWith<$Res> {
  _$CreateOrderEntityCopyWithImpl(this._self, this._then);

  final CreateOrderEntity _self;
  final $Res Function(CreateOrderEntity) _then;

/// Create a copy of CreateOrderEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comment = null,Object? description = null,Object? isDefect = null,Object? isFragile = null,Object? photos = null,Object? contentPhotos = null,Object? tariffId = null,Object? height = null,Object? length = null,Object? volumetricWeight = freezed,Object? weight = null,Object? width = null,Object? fromCityId = null,Object? fromAddress = null,Object? fromApartment = null,Object? toCityId = null,Object? toAddress = null,Object? toApartment = null,Object? toEntrance = null,Object? toName = null,Object? toPhone = null,Object? fromEntrance = null,Object? fromFloor = null,Object? fromLatitude = freezed,Object? fromLongitude = freezed,Object? toFloor = null,Object? toLatitude = freezed,Object? toLongitude = freezed,Object? category = freezed,}) {
  return _then(_self.copyWith(
comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isDefect: null == isDefect ? _self.isDefect : isDefect // ignore: cast_nullable_to_non_nullable
as bool,isFragile: null == isFragile ? _self.isFragile : isFragile // ignore: cast_nullable_to_non_nullable
as bool,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,contentPhotos: null == contentPhotos ? _self.contentPhotos : contentPhotos // ignore: cast_nullable_to_non_nullable
as List<String>,tariffId: null == tariffId ? _self.tariffId : tariffId // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double,volumetricWeight: freezed == volumetricWeight ? _self.volumetricWeight : volumetricWeight // ignore: cast_nullable_to_non_nullable
as double?,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,fromCityId: null == fromCityId ? _self.fromCityId : fromCityId // ignore: cast_nullable_to_non_nullable
as int,fromAddress: null == fromAddress ? _self.fromAddress : fromAddress // ignore: cast_nullable_to_non_nullable
as String,fromApartment: null == fromApartment ? _self.fromApartment : fromApartment // ignore: cast_nullable_to_non_nullable
as String,toCityId: null == toCityId ? _self.toCityId : toCityId // ignore: cast_nullable_to_non_nullable
as int,toAddress: null == toAddress ? _self.toAddress : toAddress // ignore: cast_nullable_to_non_nullable
as String,toApartment: null == toApartment ? _self.toApartment : toApartment // ignore: cast_nullable_to_non_nullable
as String,toEntrance: null == toEntrance ? _self.toEntrance : toEntrance // ignore: cast_nullable_to_non_nullable
as String,toName: null == toName ? _self.toName : toName // ignore: cast_nullable_to_non_nullable
as String,toPhone: null == toPhone ? _self.toPhone : toPhone // ignore: cast_nullable_to_non_nullable
as String,fromEntrance: null == fromEntrance ? _self.fromEntrance : fromEntrance // ignore: cast_nullable_to_non_nullable
as String,fromFloor: null == fromFloor ? _self.fromFloor : fromFloor // ignore: cast_nullable_to_non_nullable
as String,fromLatitude: freezed == fromLatitude ? _self.fromLatitude : fromLatitude // ignore: cast_nullable_to_non_nullable
as double?,fromLongitude: freezed == fromLongitude ? _self.fromLongitude : fromLongitude // ignore: cast_nullable_to_non_nullable
as double?,toFloor: null == toFloor ? _self.toFloor : toFloor // ignore: cast_nullable_to_non_nullable
as String,toLatitude: freezed == toLatitude ? _self.toLatitude : toLatitude // ignore: cast_nullable_to_non_nullable
as double?,toLongitude: freezed == toLongitude ? _self.toLongitude : toLongitude // ignore: cast_nullable_to_non_nullable
as double?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateOrderEntity].
extension CreateOrderEntityPatterns on CreateOrderEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateOrderEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateOrderEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateOrderEntity value)  $default,){
final _that = this;
switch (_that) {
case _CreateOrderEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateOrderEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CreateOrderEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String comment,  String description,  bool isDefect,  bool isFragile,  List<String> photos,  List<String> contentPhotos,  int tariffId,  double height,  double length,  double? volumetricWeight,  double weight,  double width,  int fromCityId,  String fromAddress,  String fromApartment,  int toCityId,  String toAddress,  String toApartment,  String toEntrance,  String toName,  String toPhone,  String fromEntrance,  String fromFloor,  double? fromLatitude,  double? fromLongitude,  String toFloor,  double? toLatitude,  double? toLongitude,  dynamic category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateOrderEntity() when $default != null:
return $default(_that.comment,_that.description,_that.isDefect,_that.isFragile,_that.photos,_that.contentPhotos,_that.tariffId,_that.height,_that.length,_that.volumetricWeight,_that.weight,_that.width,_that.fromCityId,_that.fromAddress,_that.fromApartment,_that.toCityId,_that.toAddress,_that.toApartment,_that.toEntrance,_that.toName,_that.toPhone,_that.fromEntrance,_that.fromFloor,_that.fromLatitude,_that.fromLongitude,_that.toFloor,_that.toLatitude,_that.toLongitude,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String comment,  String description,  bool isDefect,  bool isFragile,  List<String> photos,  List<String> contentPhotos,  int tariffId,  double height,  double length,  double? volumetricWeight,  double weight,  double width,  int fromCityId,  String fromAddress,  String fromApartment,  int toCityId,  String toAddress,  String toApartment,  String toEntrance,  String toName,  String toPhone,  String fromEntrance,  String fromFloor,  double? fromLatitude,  double? fromLongitude,  String toFloor,  double? toLatitude,  double? toLongitude,  dynamic category)  $default,) {final _that = this;
switch (_that) {
case _CreateOrderEntity():
return $default(_that.comment,_that.description,_that.isDefect,_that.isFragile,_that.photos,_that.contentPhotos,_that.tariffId,_that.height,_that.length,_that.volumetricWeight,_that.weight,_that.width,_that.fromCityId,_that.fromAddress,_that.fromApartment,_that.toCityId,_that.toAddress,_that.toApartment,_that.toEntrance,_that.toName,_that.toPhone,_that.fromEntrance,_that.fromFloor,_that.fromLatitude,_that.fromLongitude,_that.toFloor,_that.toLatitude,_that.toLongitude,_that.category);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String comment,  String description,  bool isDefect,  bool isFragile,  List<String> photos,  List<String> contentPhotos,  int tariffId,  double height,  double length,  double? volumetricWeight,  double weight,  double width,  int fromCityId,  String fromAddress,  String fromApartment,  int toCityId,  String toAddress,  String toApartment,  String toEntrance,  String toName,  String toPhone,  String fromEntrance,  String fromFloor,  double? fromLatitude,  double? fromLongitude,  String toFloor,  double? toLatitude,  double? toLongitude,  dynamic category)?  $default,) {final _that = this;
switch (_that) {
case _CreateOrderEntity() when $default != null:
return $default(_that.comment,_that.description,_that.isDefect,_that.isFragile,_that.photos,_that.contentPhotos,_that.tariffId,_that.height,_that.length,_that.volumetricWeight,_that.weight,_that.width,_that.fromCityId,_that.fromAddress,_that.fromApartment,_that.toCityId,_that.toAddress,_that.toApartment,_that.toEntrance,_that.toName,_that.toPhone,_that.fromEntrance,_that.fromFloor,_that.fromLatitude,_that.fromLongitude,_that.toFloor,_that.toLatitude,_that.toLongitude,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateOrderEntity extends CreateOrderEntity {
  const _CreateOrderEntity({this.comment = '', this.description = '', this.isDefect = false, this.isFragile = false, final  List<String> photos = const <String>[], final  List<String> contentPhotos = const <String>[], this.tariffId = 0, this.height = 0.0, this.length = 0.0, this.volumetricWeight, this.weight = 0.0, this.width = 0.0, this.fromCityId = 0, this.fromAddress = '', this.fromApartment = '', this.toCityId = 0, this.toAddress = '', this.toApartment = '', this.toEntrance = '', this.toName = '', this.toPhone = '', this.fromEntrance = '', this.fromFloor = '', this.fromLatitude, this.fromLongitude, this.toFloor = '', this.toLatitude, this.toLongitude, this.category = ''}): _photos = photos,_contentPhotos = contentPhotos,super._();
  factory _CreateOrderEntity.fromJson(Map<String, dynamic> json) => _$CreateOrderEntityFromJson(json);

@override@JsonKey() final  String comment;
@override@JsonKey() final  String description;
@override@JsonKey() final  bool isDefect;
@override@JsonKey() final  bool isFragile;
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

@override@JsonKey() final  int tariffId;
@override@JsonKey() final  double height;
@override@JsonKey() final  double length;
@override final  double? volumetricWeight;
@override@JsonKey() final  double weight;
@override@JsonKey() final  double width;
@override@JsonKey() final  int fromCityId;
@override@JsonKey() final  String fromAddress;
@override@JsonKey() final  String fromApartment;
@override@JsonKey() final  int toCityId;
@override@JsonKey() final  String toAddress;
@override@JsonKey() final  String toApartment;
@override@JsonKey() final  String toEntrance;
@override@JsonKey() final  String toName;
@override@JsonKey() final  String toPhone;
@override@JsonKey() final  String fromEntrance;
@override@JsonKey() final  String fromFloor;
@override final  double? fromLatitude;
@override final  double? fromLongitude;
@override@JsonKey() final  String toFloor;
@override final  double? toLatitude;
@override final  double? toLongitude;
@override@JsonKey() final  dynamic category;

/// Create a copy of CreateOrderEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateOrderEntityCopyWith<_CreateOrderEntity> get copyWith => __$CreateOrderEntityCopyWithImpl<_CreateOrderEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateOrderEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateOrderEntity&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.description, description) || other.description == description)&&(identical(other.isDefect, isDefect) || other.isDefect == isDefect)&&(identical(other.isFragile, isFragile) || other.isFragile == isFragile)&&const DeepCollectionEquality().equals(other._photos, _photos)&&const DeepCollectionEquality().equals(other._contentPhotos, _contentPhotos)&&(identical(other.tariffId, tariffId) || other.tariffId == tariffId)&&(identical(other.height, height) || other.height == height)&&(identical(other.length, length) || other.length == length)&&(identical(other.volumetricWeight, volumetricWeight) || other.volumetricWeight == volumetricWeight)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.width, width) || other.width == width)&&(identical(other.fromCityId, fromCityId) || other.fromCityId == fromCityId)&&(identical(other.fromAddress, fromAddress) || other.fromAddress == fromAddress)&&(identical(other.fromApartment, fromApartment) || other.fromApartment == fromApartment)&&(identical(other.toCityId, toCityId) || other.toCityId == toCityId)&&(identical(other.toAddress, toAddress) || other.toAddress == toAddress)&&(identical(other.toApartment, toApartment) || other.toApartment == toApartment)&&(identical(other.toEntrance, toEntrance) || other.toEntrance == toEntrance)&&(identical(other.toName, toName) || other.toName == toName)&&(identical(other.toPhone, toPhone) || other.toPhone == toPhone)&&(identical(other.fromEntrance, fromEntrance) || other.fromEntrance == fromEntrance)&&(identical(other.fromFloor, fromFloor) || other.fromFloor == fromFloor)&&(identical(other.fromLatitude, fromLatitude) || other.fromLatitude == fromLatitude)&&(identical(other.fromLongitude, fromLongitude) || other.fromLongitude == fromLongitude)&&(identical(other.toFloor, toFloor) || other.toFloor == toFloor)&&(identical(other.toLatitude, toLatitude) || other.toLatitude == toLatitude)&&(identical(other.toLongitude, toLongitude) || other.toLongitude == toLongitude)&&const DeepCollectionEquality().equals(other.category, category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,comment,description,isDefect,isFragile,const DeepCollectionEquality().hash(_photos),const DeepCollectionEquality().hash(_contentPhotos),tariffId,height,length,volumetricWeight,weight,width,fromCityId,fromAddress,fromApartment,toCityId,toAddress,toApartment,toEntrance,toName,toPhone,fromEntrance,fromFloor,fromLatitude,fromLongitude,toFloor,toLatitude,toLongitude,const DeepCollectionEquality().hash(category)]);

@override
String toString() {
  return 'CreateOrderEntity(comment: $comment, description: $description, isDefect: $isDefect, isFragile: $isFragile, photos: $photos, contentPhotos: $contentPhotos, tariffId: $tariffId, height: $height, length: $length, volumetricWeight: $volumetricWeight, weight: $weight, width: $width, fromCityId: $fromCityId, fromAddress: $fromAddress, fromApartment: $fromApartment, toCityId: $toCityId, toAddress: $toAddress, toApartment: $toApartment, toEntrance: $toEntrance, toName: $toName, toPhone: $toPhone, fromEntrance: $fromEntrance, fromFloor: $fromFloor, fromLatitude: $fromLatitude, fromLongitude: $fromLongitude, toFloor: $toFloor, toLatitude: $toLatitude, toLongitude: $toLongitude, category: $category)';
}


}

/// @nodoc
abstract mixin class _$CreateOrderEntityCopyWith<$Res> implements $CreateOrderEntityCopyWith<$Res> {
  factory _$CreateOrderEntityCopyWith(_CreateOrderEntity value, $Res Function(_CreateOrderEntity) _then) = __$CreateOrderEntityCopyWithImpl;
@override @useResult
$Res call({
 String comment, String description, bool isDefect, bool isFragile, List<String> photos, List<String> contentPhotos, int tariffId, double height, double length, double? volumetricWeight, double weight, double width, int fromCityId, String fromAddress, String fromApartment, int toCityId, String toAddress, String toApartment, String toEntrance, String toName, String toPhone, String fromEntrance, String fromFloor, double? fromLatitude, double? fromLongitude, String toFloor, double? toLatitude, double? toLongitude, dynamic category
});




}
/// @nodoc
class __$CreateOrderEntityCopyWithImpl<$Res>
    implements _$CreateOrderEntityCopyWith<$Res> {
  __$CreateOrderEntityCopyWithImpl(this._self, this._then);

  final _CreateOrderEntity _self;
  final $Res Function(_CreateOrderEntity) _then;

/// Create a copy of CreateOrderEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comment = null,Object? description = null,Object? isDefect = null,Object? isFragile = null,Object? photos = null,Object? contentPhotos = null,Object? tariffId = null,Object? height = null,Object? length = null,Object? volumetricWeight = freezed,Object? weight = null,Object? width = null,Object? fromCityId = null,Object? fromAddress = null,Object? fromApartment = null,Object? toCityId = null,Object? toAddress = null,Object? toApartment = null,Object? toEntrance = null,Object? toName = null,Object? toPhone = null,Object? fromEntrance = null,Object? fromFloor = null,Object? fromLatitude = freezed,Object? fromLongitude = freezed,Object? toFloor = null,Object? toLatitude = freezed,Object? toLongitude = freezed,Object? category = freezed,}) {
  return _then(_CreateOrderEntity(
comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isDefect: null == isDefect ? _self.isDefect : isDefect // ignore: cast_nullable_to_non_nullable
as bool,isFragile: null == isFragile ? _self.isFragile : isFragile // ignore: cast_nullable_to_non_nullable
as bool,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,contentPhotos: null == contentPhotos ? _self._contentPhotos : contentPhotos // ignore: cast_nullable_to_non_nullable
as List<String>,tariffId: null == tariffId ? _self.tariffId : tariffId // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double,volumetricWeight: freezed == volumetricWeight ? _self.volumetricWeight : volumetricWeight // ignore: cast_nullable_to_non_nullable
as double?,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,fromCityId: null == fromCityId ? _self.fromCityId : fromCityId // ignore: cast_nullable_to_non_nullable
as int,fromAddress: null == fromAddress ? _self.fromAddress : fromAddress // ignore: cast_nullable_to_non_nullable
as String,fromApartment: null == fromApartment ? _self.fromApartment : fromApartment // ignore: cast_nullable_to_non_nullable
as String,toCityId: null == toCityId ? _self.toCityId : toCityId // ignore: cast_nullable_to_non_nullable
as int,toAddress: null == toAddress ? _self.toAddress : toAddress // ignore: cast_nullable_to_non_nullable
as String,toApartment: null == toApartment ? _self.toApartment : toApartment // ignore: cast_nullable_to_non_nullable
as String,toEntrance: null == toEntrance ? _self.toEntrance : toEntrance // ignore: cast_nullable_to_non_nullable
as String,toName: null == toName ? _self.toName : toName // ignore: cast_nullable_to_non_nullable
as String,toPhone: null == toPhone ? _self.toPhone : toPhone // ignore: cast_nullable_to_non_nullable
as String,fromEntrance: null == fromEntrance ? _self.fromEntrance : fromEntrance // ignore: cast_nullable_to_non_nullable
as String,fromFloor: null == fromFloor ? _self.fromFloor : fromFloor // ignore: cast_nullable_to_non_nullable
as String,fromLatitude: freezed == fromLatitude ? _self.fromLatitude : fromLatitude // ignore: cast_nullable_to_non_nullable
as double?,fromLongitude: freezed == fromLongitude ? _self.fromLongitude : fromLongitude // ignore: cast_nullable_to_non_nullable
as double?,toFloor: null == toFloor ? _self.toFloor : toFloor // ignore: cast_nullable_to_non_nullable
as String,toLatitude: freezed == toLatitude ? _self.toLatitude : toLatitude // ignore: cast_nullable_to_non_nullable
as double?,toLongitude: freezed == toLongitude ? _self.toLongitude : toLongitude // ignore: cast_nullable_to_non_nullable
as double?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
