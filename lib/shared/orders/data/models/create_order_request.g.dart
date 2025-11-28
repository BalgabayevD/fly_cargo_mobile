// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateOrderRequest _$CreateOrderRequestFromJson(Map<String, dynamic> json) =>
    _CreateOrderRequest(
      isDefect: json['isDefect'] as bool,
      isFragile: json['isFragile'] as bool,
      category: json['category'] as String,
      comment: json['comment'] as String,
      contentPhotos: (json['contentPhotos'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String,
      fromAddress: json['fromAddress'] as String,
      fromApartment: json['fromApartment'] as String,
      fromCityId: (json['fromCityId'] as num).toInt(),
      fromEntrance: json['fromEntrance'] as String,
      fromFloor: json['fromFloor'] as String,
      fromLatitude: (json['fromLatitude'] as num).toDouble(),
      fromLongitude: (json['fromLongitude'] as num).toDouble(),
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
      toFloor: json['toFloor'] as String,
      toLatitude: (json['toLatitude'] as num).toDouble(),
      toLongitude: (json['toLongitude'] as num).toDouble(),
      toName: json['toName'] as String,
      toPhone: json['toPhone'] as String,
      volumetricWeight: (json['volumetricWeight'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
    );

Map<String, dynamic> _$CreateOrderRequestToJson(_CreateOrderRequest instance) =>
    <String, dynamic>{
      'isDefect': instance.isDefect,
      'isFragile': instance.isFragile,
      'category': instance.category,
      'comment': instance.comment,
      'contentPhotos': instance.contentPhotos,
      'description': instance.description,
      'fromAddress': instance.fromAddress,
      'fromApartment': instance.fromApartment,
      'fromCityId': instance.fromCityId,
      'fromEntrance': instance.fromEntrance,
      'fromFloor': instance.fromFloor,
      'fromLatitude': instance.fromLatitude,
      'fromLongitude': instance.fromLongitude,
      'height': instance.height,
      'length': instance.length,
      'photos': instance.photos,
      'tariffId': instance.tariffId,
      'toAddress': instance.toAddress,
      'toApartment': instance.toApartment,
      'toCityId': instance.toCityId,
      'toEntrance': instance.toEntrance,
      'toFloor': instance.toFloor,
      'toLatitude': instance.toLatitude,
      'toLongitude': instance.toLongitude,
      'toName': instance.toName,
      'toPhone': instance.toPhone,
      'volumetricWeight': instance.volumetricWeight,
      'weight': instance.weight,
      'width': instance.width,
    };
