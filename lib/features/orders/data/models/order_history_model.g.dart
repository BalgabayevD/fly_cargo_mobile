// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderHistoryModel _$OrderHistoryModelFromJson(Map<String, dynamic> json) =>
    _OrderHistoryModel(
      id: (json['id'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      orderId: (json['orderId'] as num?)?.toInt(),
      status: json['status'] as String?,
      userId: json['userId'] as String?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$OrderHistoryModelToJson(_OrderHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'orderId': instance.orderId,
      'status': instance.status,
      'userId': instance.userId,
      'comment': instance.comment,
    };
