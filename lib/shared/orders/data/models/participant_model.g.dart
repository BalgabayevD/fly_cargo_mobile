// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParticipantModel _$ParticipantModelFromJson(Map<String, dynamic> json) =>
    _ParticipantModel(
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      target: json['target'] as String,
      id: (json['id'] as num?)?.toInt(),
      deletedAt: json['deletedAt'] as String?,
      orderId: (json['orderId'] as num?)?.toInt(),
      userId: json['userId'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ParticipantModelToJson(_ParticipantModel instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'target': instance.target,
      'id': instance.id,
      'deletedAt': instance.deletedAt,
      'orderId': instance.orderId,
      'userId': instance.userId,
      'user': instance.user,
    };
