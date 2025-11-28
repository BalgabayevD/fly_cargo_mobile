// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
  id: (json['id'] as num).toInt(),
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  deletedAt: json['deletedAt'] as String?,
  fromCityId: (json['fromCityId'] as num).toInt(),
  fromLatitude: (json['fromLatitude'] as num).toDouble(),
  fromLongitude: (json['fromLongitude'] as num).toDouble(),
  fromApartment: json['fromApartment'] as String,
  fromEntrance: json['fromEntrance'] as String?,
  fromFloor: json['fromFloor'] as String,
  fromAddress: json['fromAddress'] as String,
  toCityId: (json['toCityId'] as num).toInt(),
  toLatitude: (json['toLatitude'] as num).toDouble(),
  toLongitude: (json['toLongitude'] as num).toDouble(),
  toApartment: json['toApartment'] as String,
  toEntrance: json['toEntrance'] as String?,
  toFloor: json['toFloor'] as String,
  toAddress: json['toAddress'] as String,
  price: (json['price'] as num?)?.toDouble(),
  tariffId: (json['tariffId'] as num).toInt(),
  tariff: json['tariff'] == null
      ? null
      : TariffModel.fromJson(json['tariff'] as Map<String, dynamic>),
  comment: json['comment'] as String,
  description: json['description'] as String,
  category: json['category'] as String,
  isPaid: json['isPaid'] as bool,
  isFragile: json['isFragile'] as bool,
  isDefect: json['isDefect'] as bool,
  photos: (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
  contentPhotos: (json['contentPhotos'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  defectPhotos: (json['defectPhotos'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  volumetricWeight: (json['volumetricWeight'] as num).toDouble(),
  weight: (json['weight'] as num).toDouble(),
  width: (json['width'] as num).toDouble(),
  length: (json['length'] as num).toDouble(),
  height: (json['height'] as num).toDouble(),
  fromCity: json['fromCity'] == null
      ? null
      : CityModel.fromJson(json['fromCity'] as Map<String, dynamic>),
  toCity: json['toCity'] == null
      ? null
      : CityModel.fromJson(json['toCity'] as Map<String, dynamic>),
  participants: (json['participants'] as List<dynamic>)
      .map((e) => ParticipantModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  qrs: (json['qrs'] as List<dynamic>?)
      ?.map((e) => QrModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  calculationId: (json['calculationId'] as num).toInt(),
  priceCalculations: json['priceCalculations'] == null
      ? null
      : PriceCalculationModel.fromJson(
          json['priceCalculations'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'fromCityId': instance.fromCityId,
      'fromLatitude': instance.fromLatitude,
      'fromLongitude': instance.fromLongitude,
      'fromApartment': instance.fromApartment,
      'fromEntrance': instance.fromEntrance,
      'fromFloor': instance.fromFloor,
      'fromAddress': instance.fromAddress,
      'toCityId': instance.toCityId,
      'toLatitude': instance.toLatitude,
      'toLongitude': instance.toLongitude,
      'toApartment': instance.toApartment,
      'toEntrance': instance.toEntrance,
      'toFloor': instance.toFloor,
      'toAddress': instance.toAddress,
      'price': instance.price,
      'tariffId': instance.tariffId,
      'tariff': instance.tariff,
      'comment': instance.comment,
      'description': instance.description,
      'category': instance.category,
      'isPaid': instance.isPaid,
      'isFragile': instance.isFragile,
      'isDefect': instance.isDefect,
      'photos': instance.photos,
      'contentPhotos': instance.contentPhotos,
      'defectPhotos': instance.defectPhotos,
      'volumetricWeight': instance.volumetricWeight,
      'weight': instance.weight,
      'width': instance.width,
      'length': instance.length,
      'height': instance.height,
      'fromCity': instance.fromCity,
      'toCity': instance.toCity,
      'participants': instance.participants,
      'qrs': instance.qrs,
      'calculationId': instance.calculationId,
      'priceCalculations': instance.priceCalculations,
    };
