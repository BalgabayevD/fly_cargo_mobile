// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CityModel _$CityModelFromJson(Map<String, dynamic> json) => _CityModel(
  name: json['name'] as String,
  country: json['country'] as String,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  id: (json['id'] as num?)?.toInt(),
  deletedAt: json['deletedAt'] as String?,
  RoutesFrom: json['RoutesFrom'] as List<dynamic>?,
  RoutesTo: json['RoutesTo'] as List<dynamic>?,
);

Map<String, dynamic> _$CityModelToJson(_CityModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
      'deletedAt': instance.deletedAt,
      'RoutesFrom': instance.RoutesFrom,
      'RoutesTo': instance.RoutesTo,
    };
