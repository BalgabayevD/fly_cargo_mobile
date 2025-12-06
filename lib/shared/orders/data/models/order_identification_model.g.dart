// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_identification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderIdentificationModel _$OrderIdentificationModelFromJson(
  Map<String, dynamic> json,
) => _OrderIdentificationModel(
  id: (json['id'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  orderId: (json['orderId'] as num?)?.toInt(),
  target: json['target'] as String?,
  uuid: json['uuid'] as String?,
);

Map<String, dynamic> _$OrderIdentificationModelToJson(
  _OrderIdentificationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'orderId': instance.orderId,
  'target': instance.target,
  'uuid': instance.uuid,
};
