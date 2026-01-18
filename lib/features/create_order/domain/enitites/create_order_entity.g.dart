// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateOrderEntity _$CreateOrderEntityFromJson(Map<String, dynamic> json) =>
    _CreateOrderEntity(
      comment: json['comment'] as String? ?? '',
      description: json['description'] as String? ?? '',
      isDefect: json['isDefect'] as bool? ?? false,
      isFragile: json['isFragile'] as bool? ?? false,
      photos:
          (json['photos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      contentPhotos:
          (json['contentPhotos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      tariffId: (json['tariffId'] as num?)?.toInt() ?? 0,
      height: (json['height'] as num?)?.toDouble() ?? 0.0,
      length: (json['length'] as num?)?.toDouble() ?? 0.0,
      volumetricWeight: (json['volumetricWeight'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
      width: (json['width'] as num?)?.toDouble() ?? 0.0,
      fromCityId: (json['fromCityId'] as num?)?.toInt() ?? 0,
      fromAddress: json['fromAddress'] as String? ?? '',
      fromApartment: json['fromApartment'] as String? ?? '',
      toCityId: (json['toCityId'] as num?)?.toInt() ?? 0,
      toAddress: json['toAddress'] as String? ?? '',
      toApartment: json['toApartment'] as String? ?? '',
      toEntrance: json['toEntrance'] as String? ?? '',
      toName: json['toName'] as String? ?? '',
      toPhone: json['toPhone'] as String? ?? '',
      fromEntrance: json['fromEntrance'] as String? ?? '',
      fromFloor: json['fromFloor'] as String? ?? '',
      fromLatitude: (json['fromLatitude'] as num?)?.toDouble(),
      fromLongitude: (json['fromLongitude'] as num?)?.toDouble(),
      toFloor: json['toFloor'] as String? ?? '',
      toLatitude: (json['toLatitude'] as num?)?.toDouble(),
      toLongitude: (json['toLongitude'] as num?)?.toDouble(),
      category: json['category'] ?? '',
    );

Map<String, dynamic> _$CreateOrderEntityToJson(_CreateOrderEntity instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'description': instance.description,
      'isDefect': instance.isDefect,
      'isFragile': instance.isFragile,
      'photos': instance.photos,
      'contentPhotos': instance.contentPhotos,
      'tariffId': instance.tariffId,
      'height': instance.height,
      'length': instance.length,
      'volumetricWeight': instance.volumetricWeight,
      'weight': instance.weight,
      'width': instance.width,
      'fromCityId': instance.fromCityId,
      'fromAddress': instance.fromAddress,
      'fromApartment': instance.fromApartment,
      'toCityId': instance.toCityId,
      'toAddress': instance.toAddress,
      'toApartment': instance.toApartment,
      'toEntrance': instance.toEntrance,
      'toName': instance.toName,
      'toPhone': instance.toPhone,
      'fromEntrance': instance.fromEntrance,
      'fromFloor': instance.fromFloor,
      'fromLatitude': instance.fromLatitude,
      'fromLongitude': instance.fromLongitude,
      'toFloor': instance.toFloor,
      'toLatitude': instance.toLatitude,
      'toLongitude': instance.toLongitude,
      'category': instance.category,
    };
