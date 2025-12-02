// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateOrderRequest _$CreateOrderRequestFromJson(Map<String, dynamic> json) =>
    _CreateOrderRequest(
      isDefect: json['isDefect'] as bool,
      isFragile: json['isFragile'] as bool,
      contentPhotos: (json['contentPhotos'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String,
      fromAddress: json['fromAddress'] as String,
      fromCityId: (json['fromCityId'] as num).toInt(),
      height: (json['height'] as num).toDouble(),
      length: (json['length'] as num).toDouble(),
      photos: (json['photos'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tariffId: (json['tariffId'] as num).toInt(),
      toAddress: json['toAddress'] as String,
      toCityId: (json['toCityId'] as num).toInt(),
      toName: json['toName'] as String,
      toPhone: json['toPhone'] as String,
      weight: (json['weight'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
      category: json['category'] as String?,
      comment: json['comment'] as String?,
      fromApartment: json['fromApartment'] as String?,
      fromEntrance: json['fromEntrance'] as String?,
      fromFloor: json['fromFloor'] as String?,
      fromLatitude: (json['fromLatitude'] as num?)?.toDouble(),
      fromLongitude: (json['fromLongitude'] as num?)?.toDouble(),
      toApartment: json['toApartment'] as String?,
      toEntrance: json['toEntrance'] as String?,
      toFloor: json['toFloor'] as String?,
      toLatitude: (json['toLatitude'] as num?)?.toDouble(),
      toLongitude: (json['toLongitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CreateOrderRequestToJson(_CreateOrderRequest instance) =>
    <String, dynamic>{
      'isDefect': instance.isDefect,
      'isFragile': instance.isFragile,
      'contentPhotos': instance.contentPhotos,
      'description': instance.description,
      'fromAddress': instance.fromAddress,
      'fromCityId': instance.fromCityId,
      'height': instance.height,
      'length': instance.length,
      'photos': instance.photos,
      'tariffId': instance.tariffId,
      'toAddress': instance.toAddress,
      'toCityId': instance.toCityId,
      'toName': instance.toName,
      'toPhone': instance.toPhone,
      'weight': instance.weight,
      'width': instance.width,
      'category': ?instance.category,
      'comment': ?instance.comment,
      'fromApartment': ?instance.fromApartment,
      'fromEntrance': ?instance.fromEntrance,
      'fromFloor': ?instance.fromFloor,
      'fromLatitude': ?instance.fromLatitude,
      'fromLongitude': ?instance.fromLongitude,
      'toApartment': ?instance.toApartment,
      'toEntrance': ?instance.toEntrance,
      'toFloor': ?instance.toFloor,
      'toLatitude': ?instance.toLatitude,
      'toLongitude': ?instance.toLongitude,
    };
