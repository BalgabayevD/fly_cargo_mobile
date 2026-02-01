// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_order_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubmitOrderEntity _$SubmitOrderEntityFromJson(Map<String, dynamic> json) =>
    _SubmitOrderEntity(
      orderId: (json['orderId'] as num).toInt(),
      tariffId: (json['tariffId'] as num).toInt(),
      isDefect: json['isDefect'] as bool,
      defectPhotos: (json['defectPhotos'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      weight: (json['weight'] as num).toDouble(),
    );

Map<String, dynamic> _$SubmitOrderEntityToJson(_SubmitOrderEntity instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'tariffId': instance.tariffId,
      'isDefect': instance.isDefect,
      'defectPhotos': instance.defectPhotos,
      'weight': instance.weight,
    };
