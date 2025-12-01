// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateOrderRequest _$CreateOrderRequestFromJson(Map<String, dynamic> json) =>
    _CreateOrderRequest(
      isDefect: json['isDefect'] as bool,
      isFragile: json['isFragile'] as bool,
      comment: json['comment'] as String,
      contentPhotos: (json['contentPhotos'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String,
      fromAddress: json['fromAddress'] as String,
      fromApartment: json['fromApartment'] as String,
      fromCityId: (json['fromCityId'] as num).toInt(),
      fromEntrance: json['fromEntrance'] as String,
      height: (json['height'] as num).toDouble(),
      length: (json['length'] as num).toDouble(),
      photos: (json['photos'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tariffId: (json['tariffId'] as num).toInt(),
      toAddress: json['toAddress'] as String,
      toApartment: json['toApartment'] as String,
      toCityId: (json['toCityId'] as num).toInt(),
      toEntrance: json['toEntrance'] as String,
      toName: json['toName'] as String,
      toPhone: json['toPhone'] as String,
      weight: (json['weight'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
      category: json['category'] as String?,
      fromFloor: json['fromFloor'] as String?,
      fromLatitude: (json['fromLatitude'] as num?)?.toDouble(),
      fromLongitude: (json['fromLongitude'] as num?)?.toDouble(),
      toFloor: json['toFloor'] as String?,
      toLatitude: (json['toLatitude'] as num?)?.toDouble(),
      toLongitude: (json['toLongitude'] as num?)?.toDouble(),
      volumetricWeight: (json['volumetricWeight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CreateOrderRequestToJson(_CreateOrderRequest instance) =>
    <String, dynamic>{
      'isDefect': instance.isDefect,
      'isFragile': instance.isFragile,
      'comment': instance.comment,
      'contentPhotos': instance.contentPhotos,
      'description': instance.description,
      'fromAddress': instance.fromAddress,
      'fromApartment': instance.fromApartment,
      'fromCityId': instance.fromCityId,
      'fromEntrance': instance.fromEntrance,
      'height': instance.height,
      'length': instance.length,
      'photos': instance.photos,
      'tariffId': instance.tariffId,
      'toAddress': instance.toAddress,
      'toApartment': instance.toApartment,
      'toCityId': instance.toCityId,
      'toEntrance': instance.toEntrance,
      'toName': instance.toName,
      'toPhone': instance.toPhone,
      'weight': instance.weight,
      'width': instance.width,
      'category': ?instance.category,
      'fromFloor': ?instance.fromFloor,
      'fromLatitude': ?instance.fromLatitude,
      'fromLongitude': ?instance.fromLongitude,
      'toFloor': ?instance.toFloor,
      'toLatitude': ?instance.toLatitude,
      'toLongitude': ?instance.toLongitude,
      'volumetricWeight': ?instance.volumetricWeight,
    };
