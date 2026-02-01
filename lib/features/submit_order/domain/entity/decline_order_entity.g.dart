// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decline_order_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeclineOrderEntity _$DeclineOrderEntityFromJson(Map<String, dynamic> json) =>
    _DeclineOrderEntity(
      orderId: (json['orderId'] as num).toInt(),
      decideReason: json['decideReason'] as String,
      decideDescription: json['decideDescription'] as String,
    );

Map<String, dynamic> _$DeclineOrderEntityToJson(_DeclineOrderEntity instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'decideReason': instance.decideReason,
      'decideDescription': instance.decideDescription,
    };
