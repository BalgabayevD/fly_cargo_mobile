// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CityEntity _$CityEntityFromJson(Map<String, dynamic> json) => _CityEntity(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  region: json['region'] as String?,
);

Map<String, dynamic> _$CityEntityToJson(_CityEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'region': instance.region,
    };
