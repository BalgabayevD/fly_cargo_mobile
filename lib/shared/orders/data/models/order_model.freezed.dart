// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderModel {

 int get id; String get createdAt; String get updatedAt; String? get deletedAt; int get fromCityId; double get fromLatitude; double get fromLongitude; String get fromApartment; String? get fromEntrance; String get fromFloor; String get fromAddress; int get toCityId; double get toLatitude; double get toLongitude; String get toApartment; String? get toEntrance; String get toFloor; String get toAddress; double? get price; int get tariffId; TariffModel? get tariff; String get comment; String get description; String get category; bool get isPaid; bool get isFragile; bool get isDefect; List<String> get photos; List<String> get contentPhotos; List<String>? get defectPhotos; double get volumetricWeight; double get weight; double get width; double get length; double get height; CityModel? get fromCity; CityModel? get toCity; List<ParticipantModel> get participants; List<QrModel>? get qrs; int get calculationId; PriceCalculationModel? get priceCalculations;
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderModelCopyWith<OrderModel> get copyWith => _$OrderModelCopyWithImpl<OrderModel>(this as OrderModel, _$identity);

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.fromCityId, fromCityId) || other.fromCityId == fromCityId)&&(identical(other.fromLatitude, fromLatitude) || other.fromLatitude == fromLatitude)&&(identical(other.fromLongitude, fromLongitude) || other.fromLongitude == fromLongitude)&&(identical(other.fromApartment, fromApartment) || other.fromApartment == fromApartment)&&(identical(other.fromEntrance, fromEntrance) || other.fromEntrance == fromEntrance)&&(identical(other.fromFloor, fromFloor) || other.fromFloor == fromFloor)&&(identical(other.fromAddress, fromAddress) || other.fromAddress == fromAddress)&&(identical(other.toCityId, toCityId) || other.toCityId == toCityId)&&(identical(other.toLatitude, toLatitude) || other.toLatitude == toLatitude)&&(identical(other.toLongitude, toLongitude) || other.toLongitude == toLongitude)&&(identical(other.toApartment, toApartment) || other.toApartment == toApartment)&&(identical(other.toEntrance, toEntrance) || other.toEntrance == toEntrance)&&(identical(other.toFloor, toFloor) || other.toFloor == toFloor)&&(identical(other.toAddress, toAddress) || other.toAddress == toAddress)&&(identical(other.price, price) || other.price == price)&&(identical(other.tariffId, tariffId) || other.tariffId == tariffId)&&(identical(other.tariff, tariff) || other.tariff == tariff)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.isPaid, isPaid) || other.isPaid == isPaid)&&(identical(other.isFragile, isFragile) || other.isFragile == isFragile)&&(identical(other.isDefect, isDefect) || other.isDefect == isDefect)&&const DeepCollectionEquality().equals(other.photos, photos)&&const DeepCollectionEquality().equals(other.contentPhotos, contentPhotos)&&const DeepCollectionEquality().equals(other.defectPhotos, defectPhotos)&&(identical(other.volumetricWeight, volumetricWeight) || other.volumetricWeight == volumetricWeight)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.width, width) || other.width == width)&&(identical(other.length, length) || other.length == length)&&(identical(other.height, height) || other.height == height)&&(identical(other.fromCity, fromCity) || other.fromCity == fromCity)&&(identical(other.toCity, toCity) || other.toCity == toCity)&&const DeepCollectionEquality().equals(other.participants, participants)&&const DeepCollectionEquality().equals(other.qrs, qrs)&&(identical(other.calculationId, calculationId) || other.calculationId == calculationId)&&(identical(other.priceCalculations, priceCalculations) || other.priceCalculations == priceCalculations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,createdAt,updatedAt,deletedAt,fromCityId,fromLatitude,fromLongitude,fromApartment,fromEntrance,fromFloor,fromAddress,toCityId,toLatitude,toLongitude,toApartment,toEntrance,toFloor,toAddress,price,tariffId,tariff,comment,description,category,isPaid,isFragile,isDefect,const DeepCollectionEquality().hash(photos),const DeepCollectionEquality().hash(contentPhotos),const DeepCollectionEquality().hash(defectPhotos),volumetricWeight,weight,width,length,height,fromCity,toCity,const DeepCollectionEquality().hash(participants),const DeepCollectionEquality().hash(qrs),calculationId,priceCalculations]);

@override
String toString() {
  return 'OrderModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, fromCityId: $fromCityId, fromLatitude: $fromLatitude, fromLongitude: $fromLongitude, fromApartment: $fromApartment, fromEntrance: $fromEntrance, fromFloor: $fromFloor, fromAddress: $fromAddress, toCityId: $toCityId, toLatitude: $toLatitude, toLongitude: $toLongitude, toApartment: $toApartment, toEntrance: $toEntrance, toFloor: $toFloor, toAddress: $toAddress, price: $price, tariffId: $tariffId, tariff: $tariff, comment: $comment, description: $description, category: $category, isPaid: $isPaid, isFragile: $isFragile, isDefect: $isDefect, photos: $photos, contentPhotos: $contentPhotos, defectPhotos: $defectPhotos, volumetricWeight: $volumetricWeight, weight: $weight, width: $width, length: $length, height: $height, fromCity: $fromCity, toCity: $toCity, participants: $participants, qrs: $qrs, calculationId: $calculationId, priceCalculations: $priceCalculations)';
}


}

/// @nodoc
abstract mixin class $OrderModelCopyWith<$Res>  {
  factory $OrderModelCopyWith(OrderModel value, $Res Function(OrderModel) _then) = _$OrderModelCopyWithImpl;
@useResult
$Res call({
 int id, String createdAt, String updatedAt, String? deletedAt, int fromCityId, double fromLatitude, double fromLongitude, String fromApartment, String? fromEntrance, String fromFloor, String fromAddress, int toCityId, double toLatitude, double toLongitude, String toApartment, String? toEntrance, String toFloor, String toAddress, double? price, int tariffId, TariffModel? tariff, String comment, String description, String category, bool isPaid, bool isFragile, bool isDefect, List<String> photos, List<String> contentPhotos, List<String>? defectPhotos, double volumetricWeight, double weight, double width, double length, double height, CityModel? fromCity, CityModel? toCity, List<ParticipantModel> participants, List<QrModel>? qrs, int calculationId, PriceCalculationModel? priceCalculations
});


$TariffModelCopyWith<$Res>? get tariff;$CityModelCopyWith<$Res>? get fromCity;$CityModelCopyWith<$Res>? get toCity;$PriceCalculationModelCopyWith<$Res>? get priceCalculations;

}
/// @nodoc
class _$OrderModelCopyWithImpl<$Res>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._self, this._then);

  final OrderModel _self;
  final $Res Function(OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? fromCityId = null,Object? fromLatitude = null,Object? fromLongitude = null,Object? fromApartment = null,Object? fromEntrance = freezed,Object? fromFloor = null,Object? fromAddress = null,Object? toCityId = null,Object? toLatitude = null,Object? toLongitude = null,Object? toApartment = null,Object? toEntrance = freezed,Object? toFloor = null,Object? toAddress = null,Object? price = freezed,Object? tariffId = null,Object? tariff = freezed,Object? comment = null,Object? description = null,Object? category = null,Object? isPaid = null,Object? isFragile = null,Object? isDefect = null,Object? photos = null,Object? contentPhotos = null,Object? defectPhotos = freezed,Object? volumetricWeight = null,Object? weight = null,Object? width = null,Object? length = null,Object? height = null,Object? fromCity = freezed,Object? toCity = freezed,Object? participants = null,Object? qrs = freezed,Object? calculationId = null,Object? priceCalculations = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,fromCityId: null == fromCityId ? _self.fromCityId : fromCityId // ignore: cast_nullable_to_non_nullable
as int,fromLatitude: null == fromLatitude ? _self.fromLatitude : fromLatitude // ignore: cast_nullable_to_non_nullable
as double,fromLongitude: null == fromLongitude ? _self.fromLongitude : fromLongitude // ignore: cast_nullable_to_non_nullable
as double,fromApartment: null == fromApartment ? _self.fromApartment : fromApartment // ignore: cast_nullable_to_non_nullable
as String,fromEntrance: freezed == fromEntrance ? _self.fromEntrance : fromEntrance // ignore: cast_nullable_to_non_nullable
as String?,fromFloor: null == fromFloor ? _self.fromFloor : fromFloor // ignore: cast_nullable_to_non_nullable
as String,fromAddress: null == fromAddress ? _self.fromAddress : fromAddress // ignore: cast_nullable_to_non_nullable
as String,toCityId: null == toCityId ? _self.toCityId : toCityId // ignore: cast_nullable_to_non_nullable
as int,toLatitude: null == toLatitude ? _self.toLatitude : toLatitude // ignore: cast_nullable_to_non_nullable
as double,toLongitude: null == toLongitude ? _self.toLongitude : toLongitude // ignore: cast_nullable_to_non_nullable
as double,toApartment: null == toApartment ? _self.toApartment : toApartment // ignore: cast_nullable_to_non_nullable
as String,toEntrance: freezed == toEntrance ? _self.toEntrance : toEntrance // ignore: cast_nullable_to_non_nullable
as String?,toFloor: null == toFloor ? _self.toFloor : toFloor // ignore: cast_nullable_to_non_nullable
as String,toAddress: null == toAddress ? _self.toAddress : toAddress // ignore: cast_nullable_to_non_nullable
as String,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,tariffId: null == tariffId ? _self.tariffId : tariffId // ignore: cast_nullable_to_non_nullable
as int,tariff: freezed == tariff ? _self.tariff : tariff // ignore: cast_nullable_to_non_nullable
as TariffModel?,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,isPaid: null == isPaid ? _self.isPaid : isPaid // ignore: cast_nullable_to_non_nullable
as bool,isFragile: null == isFragile ? _self.isFragile : isFragile // ignore: cast_nullable_to_non_nullable
as bool,isDefect: null == isDefect ? _self.isDefect : isDefect // ignore: cast_nullable_to_non_nullable
as bool,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,contentPhotos: null == contentPhotos ? _self.contentPhotos : contentPhotos // ignore: cast_nullable_to_non_nullable
as List<String>,defectPhotos: freezed == defectPhotos ? _self.defectPhotos : defectPhotos // ignore: cast_nullable_to_non_nullable
as List<String>?,volumetricWeight: null == volumetricWeight ? _self.volumetricWeight : volumetricWeight // ignore: cast_nullable_to_non_nullable
as double,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,fromCity: freezed == fromCity ? _self.fromCity : fromCity // ignore: cast_nullable_to_non_nullable
as CityModel?,toCity: freezed == toCity ? _self.toCity : toCity // ignore: cast_nullable_to_non_nullable
as CityModel?,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<ParticipantModel>,qrs: freezed == qrs ? _self.qrs : qrs // ignore: cast_nullable_to_non_nullable
as List<QrModel>?,calculationId: null == calculationId ? _self.calculationId : calculationId // ignore: cast_nullable_to_non_nullable
as int,priceCalculations: freezed == priceCalculations ? _self.priceCalculations : priceCalculations // ignore: cast_nullable_to_non_nullable
as PriceCalculationModel?,
  ));
}
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TariffModelCopyWith<$Res>? get tariff {
    if (_self.tariff == null) {
    return null;
  }

  return $TariffModelCopyWith<$Res>(_self.tariff!, (value) {
    return _then(_self.copyWith(tariff: value));
  });
}/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityModelCopyWith<$Res>? get fromCity {
    if (_self.fromCity == null) {
    return null;
  }

  return $CityModelCopyWith<$Res>(_self.fromCity!, (value) {
    return _then(_self.copyWith(fromCity: value));
  });
}/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityModelCopyWith<$Res>? get toCity {
    if (_self.toCity == null) {
    return null;
  }

  return $CityModelCopyWith<$Res>(_self.toCity!, (value) {
    return _then(_self.copyWith(toCity: value));
  });
}/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PriceCalculationModelCopyWith<$Res>? get priceCalculations {
    if (_self.priceCalculations == null) {
    return null;
  }

  return $PriceCalculationModelCopyWith<$Res>(_self.priceCalculations!, (value) {
    return _then(_self.copyWith(priceCalculations: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderModel].
extension OrderModelPatterns on OrderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String createdAt,  String updatedAt,  String? deletedAt,  int fromCityId,  double fromLatitude,  double fromLongitude,  String fromApartment,  String? fromEntrance,  String fromFloor,  String fromAddress,  int toCityId,  double toLatitude,  double toLongitude,  String toApartment,  String? toEntrance,  String toFloor,  String toAddress,  double? price,  int tariffId,  TariffModel? tariff,  String comment,  String description,  String category,  bool isPaid,  bool isFragile,  bool isDefect,  List<String> photos,  List<String> contentPhotos,  List<String>? defectPhotos,  double volumetricWeight,  double weight,  double width,  double length,  double height,  CityModel? fromCity,  CityModel? toCity,  List<ParticipantModel> participants,  List<QrModel>? qrs,  int calculationId,  PriceCalculationModel? priceCalculations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.fromCityId,_that.fromLatitude,_that.fromLongitude,_that.fromApartment,_that.fromEntrance,_that.fromFloor,_that.fromAddress,_that.toCityId,_that.toLatitude,_that.toLongitude,_that.toApartment,_that.toEntrance,_that.toFloor,_that.toAddress,_that.price,_that.tariffId,_that.tariff,_that.comment,_that.description,_that.category,_that.isPaid,_that.isFragile,_that.isDefect,_that.photos,_that.contentPhotos,_that.defectPhotos,_that.volumetricWeight,_that.weight,_that.width,_that.length,_that.height,_that.fromCity,_that.toCity,_that.participants,_that.qrs,_that.calculationId,_that.priceCalculations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String createdAt,  String updatedAt,  String? deletedAt,  int fromCityId,  double fromLatitude,  double fromLongitude,  String fromApartment,  String? fromEntrance,  String fromFloor,  String fromAddress,  int toCityId,  double toLatitude,  double toLongitude,  String toApartment,  String? toEntrance,  String toFloor,  String toAddress,  double? price,  int tariffId,  TariffModel? tariff,  String comment,  String description,  String category,  bool isPaid,  bool isFragile,  bool isDefect,  List<String> photos,  List<String> contentPhotos,  List<String>? defectPhotos,  double volumetricWeight,  double weight,  double width,  double length,  double height,  CityModel? fromCity,  CityModel? toCity,  List<ParticipantModel> participants,  List<QrModel>? qrs,  int calculationId,  PriceCalculationModel? priceCalculations)  $default,) {final _that = this;
switch (_that) {
case _OrderModel():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.fromCityId,_that.fromLatitude,_that.fromLongitude,_that.fromApartment,_that.fromEntrance,_that.fromFloor,_that.fromAddress,_that.toCityId,_that.toLatitude,_that.toLongitude,_that.toApartment,_that.toEntrance,_that.toFloor,_that.toAddress,_that.price,_that.tariffId,_that.tariff,_that.comment,_that.description,_that.category,_that.isPaid,_that.isFragile,_that.isDefect,_that.photos,_that.contentPhotos,_that.defectPhotos,_that.volumetricWeight,_that.weight,_that.width,_that.length,_that.height,_that.fromCity,_that.toCity,_that.participants,_that.qrs,_that.calculationId,_that.priceCalculations);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String createdAt,  String updatedAt,  String? deletedAt,  int fromCityId,  double fromLatitude,  double fromLongitude,  String fromApartment,  String? fromEntrance,  String fromFloor,  String fromAddress,  int toCityId,  double toLatitude,  double toLongitude,  String toApartment,  String? toEntrance,  String toFloor,  String toAddress,  double? price,  int tariffId,  TariffModel? tariff,  String comment,  String description,  String category,  bool isPaid,  bool isFragile,  bool isDefect,  List<String> photos,  List<String> contentPhotos,  List<String>? defectPhotos,  double volumetricWeight,  double weight,  double width,  double length,  double height,  CityModel? fromCity,  CityModel? toCity,  List<ParticipantModel> participants,  List<QrModel>? qrs,  int calculationId,  PriceCalculationModel? priceCalculations)?  $default,) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.fromCityId,_that.fromLatitude,_that.fromLongitude,_that.fromApartment,_that.fromEntrance,_that.fromFloor,_that.fromAddress,_that.toCityId,_that.toLatitude,_that.toLongitude,_that.toApartment,_that.toEntrance,_that.toFloor,_that.toAddress,_that.price,_that.tariffId,_that.tariff,_that.comment,_that.description,_that.category,_that.isPaid,_that.isFragile,_that.isDefect,_that.photos,_that.contentPhotos,_that.defectPhotos,_that.volumetricWeight,_that.weight,_that.width,_that.length,_that.height,_that.fromCity,_that.toCity,_that.participants,_that.qrs,_that.calculationId,_that.priceCalculations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderModel implements OrderModel {
  const _OrderModel({required this.id, required this.createdAt, required this.updatedAt, this.deletedAt, required this.fromCityId, required this.fromLatitude, required this.fromLongitude, required this.fromApartment, this.fromEntrance, required this.fromFloor, required this.fromAddress, required this.toCityId, required this.toLatitude, required this.toLongitude, required this.toApartment, this.toEntrance, required this.toFloor, required this.toAddress, this.price, required this.tariffId, this.tariff, required this.comment, required this.description, required this.category, required this.isPaid, required this.isFragile, required this.isDefect, required final  List<String> photos, required final  List<String> contentPhotos, final  List<String>? defectPhotos, required this.volumetricWeight, required this.weight, required this.width, required this.length, required this.height, this.fromCity, this.toCity, required final  List<ParticipantModel> participants, final  List<QrModel>? qrs, required this.calculationId, this.priceCalculations}): _photos = photos,_contentPhotos = contentPhotos,_defectPhotos = defectPhotos,_participants = participants,_qrs = qrs;
  factory _OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

@override final  int id;
@override final  String createdAt;
@override final  String updatedAt;
@override final  String? deletedAt;
@override final  int fromCityId;
@override final  double fromLatitude;
@override final  double fromLongitude;
@override final  String fromApartment;
@override final  String? fromEntrance;
@override final  String fromFloor;
@override final  String fromAddress;
@override final  int toCityId;
@override final  double toLatitude;
@override final  double toLongitude;
@override final  String toApartment;
@override final  String? toEntrance;
@override final  String toFloor;
@override final  String toAddress;
@override final  double? price;
@override final  int tariffId;
@override final  TariffModel? tariff;
@override final  String comment;
@override final  String description;
@override final  String category;
@override final  bool isPaid;
@override final  bool isFragile;
@override final  bool isDefect;
 final  List<String> _photos;
@override List<String> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

 final  List<String> _contentPhotos;
@override List<String> get contentPhotos {
  if (_contentPhotos is EqualUnmodifiableListView) return _contentPhotos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contentPhotos);
}

 final  List<String>? _defectPhotos;
@override List<String>? get defectPhotos {
  final value = _defectPhotos;
  if (value == null) return null;
  if (_defectPhotos is EqualUnmodifiableListView) return _defectPhotos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  double volumetricWeight;
@override final  double weight;
@override final  double width;
@override final  double length;
@override final  double height;
@override final  CityModel? fromCity;
@override final  CityModel? toCity;
 final  List<ParticipantModel> _participants;
@override List<ParticipantModel> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}

 final  List<QrModel>? _qrs;
@override List<QrModel>? get qrs {
  final value = _qrs;
  if (value == null) return null;
  if (_qrs is EqualUnmodifiableListView) return _qrs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int calculationId;
@override final  PriceCalculationModel? priceCalculations;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderModelCopyWith<_OrderModel> get copyWith => __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.fromCityId, fromCityId) || other.fromCityId == fromCityId)&&(identical(other.fromLatitude, fromLatitude) || other.fromLatitude == fromLatitude)&&(identical(other.fromLongitude, fromLongitude) || other.fromLongitude == fromLongitude)&&(identical(other.fromApartment, fromApartment) || other.fromApartment == fromApartment)&&(identical(other.fromEntrance, fromEntrance) || other.fromEntrance == fromEntrance)&&(identical(other.fromFloor, fromFloor) || other.fromFloor == fromFloor)&&(identical(other.fromAddress, fromAddress) || other.fromAddress == fromAddress)&&(identical(other.toCityId, toCityId) || other.toCityId == toCityId)&&(identical(other.toLatitude, toLatitude) || other.toLatitude == toLatitude)&&(identical(other.toLongitude, toLongitude) || other.toLongitude == toLongitude)&&(identical(other.toApartment, toApartment) || other.toApartment == toApartment)&&(identical(other.toEntrance, toEntrance) || other.toEntrance == toEntrance)&&(identical(other.toFloor, toFloor) || other.toFloor == toFloor)&&(identical(other.toAddress, toAddress) || other.toAddress == toAddress)&&(identical(other.price, price) || other.price == price)&&(identical(other.tariffId, tariffId) || other.tariffId == tariffId)&&(identical(other.tariff, tariff) || other.tariff == tariff)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.isPaid, isPaid) || other.isPaid == isPaid)&&(identical(other.isFragile, isFragile) || other.isFragile == isFragile)&&(identical(other.isDefect, isDefect) || other.isDefect == isDefect)&&const DeepCollectionEquality().equals(other._photos, _photos)&&const DeepCollectionEquality().equals(other._contentPhotos, _contentPhotos)&&const DeepCollectionEquality().equals(other._defectPhotos, _defectPhotos)&&(identical(other.volumetricWeight, volumetricWeight) || other.volumetricWeight == volumetricWeight)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.width, width) || other.width == width)&&(identical(other.length, length) || other.length == length)&&(identical(other.height, height) || other.height == height)&&(identical(other.fromCity, fromCity) || other.fromCity == fromCity)&&(identical(other.toCity, toCity) || other.toCity == toCity)&&const DeepCollectionEquality().equals(other._participants, _participants)&&const DeepCollectionEquality().equals(other._qrs, _qrs)&&(identical(other.calculationId, calculationId) || other.calculationId == calculationId)&&(identical(other.priceCalculations, priceCalculations) || other.priceCalculations == priceCalculations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,createdAt,updatedAt,deletedAt,fromCityId,fromLatitude,fromLongitude,fromApartment,fromEntrance,fromFloor,fromAddress,toCityId,toLatitude,toLongitude,toApartment,toEntrance,toFloor,toAddress,price,tariffId,tariff,comment,description,category,isPaid,isFragile,isDefect,const DeepCollectionEquality().hash(_photos),const DeepCollectionEquality().hash(_contentPhotos),const DeepCollectionEquality().hash(_defectPhotos),volumetricWeight,weight,width,length,height,fromCity,toCity,const DeepCollectionEquality().hash(_participants),const DeepCollectionEquality().hash(_qrs),calculationId,priceCalculations]);

@override
String toString() {
  return 'OrderModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, fromCityId: $fromCityId, fromLatitude: $fromLatitude, fromLongitude: $fromLongitude, fromApartment: $fromApartment, fromEntrance: $fromEntrance, fromFloor: $fromFloor, fromAddress: $fromAddress, toCityId: $toCityId, toLatitude: $toLatitude, toLongitude: $toLongitude, toApartment: $toApartment, toEntrance: $toEntrance, toFloor: $toFloor, toAddress: $toAddress, price: $price, tariffId: $tariffId, tariff: $tariff, comment: $comment, description: $description, category: $category, isPaid: $isPaid, isFragile: $isFragile, isDefect: $isDefect, photos: $photos, contentPhotos: $contentPhotos, defectPhotos: $defectPhotos, volumetricWeight: $volumetricWeight, weight: $weight, width: $width, length: $length, height: $height, fromCity: $fromCity, toCity: $toCity, participants: $participants, qrs: $qrs, calculationId: $calculationId, priceCalculations: $priceCalculations)';
}


}

/// @nodoc
abstract mixin class _$OrderModelCopyWith<$Res> implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(_OrderModel value, $Res Function(_OrderModel) _then) = __$OrderModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String createdAt, String updatedAt, String? deletedAt, int fromCityId, double fromLatitude, double fromLongitude, String fromApartment, String? fromEntrance, String fromFloor, String fromAddress, int toCityId, double toLatitude, double toLongitude, String toApartment, String? toEntrance, String toFloor, String toAddress, double? price, int tariffId, TariffModel? tariff, String comment, String description, String category, bool isPaid, bool isFragile, bool isDefect, List<String> photos, List<String> contentPhotos, List<String>? defectPhotos, double volumetricWeight, double weight, double width, double length, double height, CityModel? fromCity, CityModel? toCity, List<ParticipantModel> participants, List<QrModel>? qrs, int calculationId, PriceCalculationModel? priceCalculations
});


@override $TariffModelCopyWith<$Res>? get tariff;@override $CityModelCopyWith<$Res>? get fromCity;@override $CityModelCopyWith<$Res>? get toCity;@override $PriceCalculationModelCopyWith<$Res>? get priceCalculations;

}
/// @nodoc
class __$OrderModelCopyWithImpl<$Res>
    implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(this._self, this._then);

  final _OrderModel _self;
  final $Res Function(_OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? fromCityId = null,Object? fromLatitude = null,Object? fromLongitude = null,Object? fromApartment = null,Object? fromEntrance = freezed,Object? fromFloor = null,Object? fromAddress = null,Object? toCityId = null,Object? toLatitude = null,Object? toLongitude = null,Object? toApartment = null,Object? toEntrance = freezed,Object? toFloor = null,Object? toAddress = null,Object? price = freezed,Object? tariffId = null,Object? tariff = freezed,Object? comment = null,Object? description = null,Object? category = null,Object? isPaid = null,Object? isFragile = null,Object? isDefect = null,Object? photos = null,Object? contentPhotos = null,Object? defectPhotos = freezed,Object? volumetricWeight = null,Object? weight = null,Object? width = null,Object? length = null,Object? height = null,Object? fromCity = freezed,Object? toCity = freezed,Object? participants = null,Object? qrs = freezed,Object? calculationId = null,Object? priceCalculations = freezed,}) {
  return _then(_OrderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,fromCityId: null == fromCityId ? _self.fromCityId : fromCityId // ignore: cast_nullable_to_non_nullable
as int,fromLatitude: null == fromLatitude ? _self.fromLatitude : fromLatitude // ignore: cast_nullable_to_non_nullable
as double,fromLongitude: null == fromLongitude ? _self.fromLongitude : fromLongitude // ignore: cast_nullable_to_non_nullable
as double,fromApartment: null == fromApartment ? _self.fromApartment : fromApartment // ignore: cast_nullable_to_non_nullable
as String,fromEntrance: freezed == fromEntrance ? _self.fromEntrance : fromEntrance // ignore: cast_nullable_to_non_nullable
as String?,fromFloor: null == fromFloor ? _self.fromFloor : fromFloor // ignore: cast_nullable_to_non_nullable
as String,fromAddress: null == fromAddress ? _self.fromAddress : fromAddress // ignore: cast_nullable_to_non_nullable
as String,toCityId: null == toCityId ? _self.toCityId : toCityId // ignore: cast_nullable_to_non_nullable
as int,toLatitude: null == toLatitude ? _self.toLatitude : toLatitude // ignore: cast_nullable_to_non_nullable
as double,toLongitude: null == toLongitude ? _self.toLongitude : toLongitude // ignore: cast_nullable_to_non_nullable
as double,toApartment: null == toApartment ? _self.toApartment : toApartment // ignore: cast_nullable_to_non_nullable
as String,toEntrance: freezed == toEntrance ? _self.toEntrance : toEntrance // ignore: cast_nullable_to_non_nullable
as String?,toFloor: null == toFloor ? _self.toFloor : toFloor // ignore: cast_nullable_to_non_nullable
as String,toAddress: null == toAddress ? _self.toAddress : toAddress // ignore: cast_nullable_to_non_nullable
as String,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,tariffId: null == tariffId ? _self.tariffId : tariffId // ignore: cast_nullable_to_non_nullable
as int,tariff: freezed == tariff ? _self.tariff : tariff // ignore: cast_nullable_to_non_nullable
as TariffModel?,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,isPaid: null == isPaid ? _self.isPaid : isPaid // ignore: cast_nullable_to_non_nullable
as bool,isFragile: null == isFragile ? _self.isFragile : isFragile // ignore: cast_nullable_to_non_nullable
as bool,isDefect: null == isDefect ? _self.isDefect : isDefect // ignore: cast_nullable_to_non_nullable
as bool,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,contentPhotos: null == contentPhotos ? _self._contentPhotos : contentPhotos // ignore: cast_nullable_to_non_nullable
as List<String>,defectPhotos: freezed == defectPhotos ? _self._defectPhotos : defectPhotos // ignore: cast_nullable_to_non_nullable
as List<String>?,volumetricWeight: null == volumetricWeight ? _self.volumetricWeight : volumetricWeight // ignore: cast_nullable_to_non_nullable
as double,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,fromCity: freezed == fromCity ? _self.fromCity : fromCity // ignore: cast_nullable_to_non_nullable
as CityModel?,toCity: freezed == toCity ? _self.toCity : toCity // ignore: cast_nullable_to_non_nullable
as CityModel?,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<ParticipantModel>,qrs: freezed == qrs ? _self._qrs : qrs // ignore: cast_nullable_to_non_nullable
as List<QrModel>?,calculationId: null == calculationId ? _self.calculationId : calculationId // ignore: cast_nullable_to_non_nullable
as int,priceCalculations: freezed == priceCalculations ? _self.priceCalculations : priceCalculations // ignore: cast_nullable_to_non_nullable
as PriceCalculationModel?,
  ));
}

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TariffModelCopyWith<$Res>? get tariff {
    if (_self.tariff == null) {
    return null;
  }

  return $TariffModelCopyWith<$Res>(_self.tariff!, (value) {
    return _then(_self.copyWith(tariff: value));
  });
}/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityModelCopyWith<$Res>? get fromCity {
    if (_self.fromCity == null) {
    return null;
  }

  return $CityModelCopyWith<$Res>(_self.fromCity!, (value) {
    return _then(_self.copyWith(fromCity: value));
  });
}/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityModelCopyWith<$Res>? get toCity {
    if (_self.toCity == null) {
    return null;
  }

  return $CityModelCopyWith<$Res>(_self.toCity!, (value) {
    return _then(_self.copyWith(toCity: value));
  });
}/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PriceCalculationModelCopyWith<$Res>? get priceCalculations {
    if (_self.priceCalculations == null) {
    return null;
  }

  return $PriceCalculationModelCopyWith<$Res>(_self.priceCalculations!, (value) {
    return _then(_self.copyWith(priceCalculations: value));
  });
}
}

// dart format on
