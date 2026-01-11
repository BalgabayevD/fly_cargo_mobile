// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QrModel _$QrModelFromJson(Map<String, dynamic> json) => _QrModel(
  id: (json['id'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  orderId: (json['orderId'] as num?)?.toInt(),
  target: json['target'] as String?,
  uuid: json['uuid'] as String?,
);

Map<String, dynamic> _$QrModelToJson(_QrModel instance) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'orderId': instance.orderId,
  'target': instance.target,
  'uuid': instance.uuid,
};
