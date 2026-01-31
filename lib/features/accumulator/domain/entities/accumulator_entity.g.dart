// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accumulator_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccumulatorEntity _$AccumulatorEntityFromJson(Map<String, dynamic> json) =>
    _AccumulatorEntity(
      id: (json['id'] as num).toInt(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      fromCityId: (json['fromCityId'] as num).toInt(),
      toCityId: (json['toCityId'] as num).toInt(),
      status: json['status'] as String,
      identification: json['identification'] as String,
      deletedAt: json['deletedAt'] as String?,
      pickUpTime: json['pickUpTime'] as String?,
      receiveTime: json['receiveTime'] as String?,
      fromCity: json['fromCity'] == null
          ? null
          : OrderCityEntity.fromJson(json['fromCity'] as Map<String, dynamic>),
      toCity: json['toCity'] == null
          ? null
          : OrderCityEntity.fromJson(json['toCity'] as Map<String, dynamic>),
      orders:
          (json['orders'] as List<dynamic>?)
              ?.map((e) => OrderEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AccumulatorEntityToJson(_AccumulatorEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'fromCityId': instance.fromCityId,
      'toCityId': instance.toCityId,
      'status': instance.status,
      'identification': instance.identification,
      'deletedAt': instance.deletedAt,
      'pickUpTime': instance.pickUpTime,
      'receiveTime': instance.receiveTime,
      'fromCity': instance.fromCity,
      'toCity': instance.toCity,
      'orders': instance.orders,
    };
