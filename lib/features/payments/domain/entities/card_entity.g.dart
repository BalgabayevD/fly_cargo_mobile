// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CardEntity _$CardEntityFromJson(Map<String, dynamic> json) => _CardEntity(
  id: (json['id'] as num).toInt(),
  mask: json['mask'] as String,
  type: json['type'] as String,
  bank: json['bank'] as String,
  image: json['image'] as String,
);

Map<String, dynamic> _$CardEntityToJson(_CardEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mask': instance.mask,
      'type': instance.type,
      'bank': instance.bank,
      'image': instance.image,
    };
