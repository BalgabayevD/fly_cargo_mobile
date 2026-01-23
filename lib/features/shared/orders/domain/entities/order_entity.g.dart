// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderCityEntity _$OrderCityEntityFromJson(Map<String, dynamic> json) =>
    _OrderCityEntity(
      name: json['name'] as String,
      country: json['country'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      id: (json['id'] as num?)?.toInt(),
      deletedAt: json['deletedAt'] as String?,
    );

Map<String, dynamic> _$OrderCityEntityToJson(_OrderCityEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
      'deletedAt': instance.deletedAt,
    };

_OrderHistoryEntity _$OrderHistoryEntityFromJson(Map<String, dynamic> json) =>
    _OrderHistoryEntity(
      id: (json['id'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
      orderId: (json['orderId'] as num?)?.toInt(),
      status: json['status'] as String?,
      userId: json['userId'] as String?,
      comment: json['comment'] as String?,
      description: json['description'] as String?,
      parameters: json['parameters'] as String?,
    );

Map<String, dynamic> _$OrderHistoryEntityToJson(_OrderHistoryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'orderId': instance.orderId,
      'status': instance.status,
      'userId': instance.userId,
      'comment': instance.comment,
      'description': instance.description,
      'parameters': instance.parameters,
    };

_OrderIdentificationEntity _$OrderIdentificationEntityFromJson(
  Map<String, dynamic> json,
) => _OrderIdentificationEntity(
  id: (json['id'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  orderId: (json['orderId'] as num?)?.toInt(),
  target: json['target'] as String?,
  uuid: json['uuid'] as String?,
);

Map<String, dynamic> _$OrderIdentificationEntityToJson(
  _OrderIdentificationEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'orderId': instance.orderId,
  'target': instance.target,
  'uuid': instance.uuid,
};

_QrEntity _$QrEntityFromJson(Map<String, dynamic> json) => _QrEntity(
  id: (json['id'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  orderId: (json['orderId'] as num?)?.toInt(),
  target: json['target'] as String?,
  uuid: json['uuid'] as String?,
);

Map<String, dynamic> _$QrEntityToJson(_QrEntity instance) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'orderId': instance.orderId,
  'target': instance.target,
  'uuid': instance.uuid,
};

_OrderTariffEntity _$OrderTariffEntityFromJson(
  Map<String, dynamic> json,
) => _OrderTariffEntity(
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  isActive: json['isActive'] as bool,
  name: json['name'] as String,
  description: json['description'] as String,
  image: json['image'] as String,
  id: (json['id'] as num?)?.toInt(),
  deletedAt: json['deletedAt'] as String?,
  icon: (json['icon'] as num?)?.toInt(),
  sortIndex: (json['sortIndex'] as num?)?.toInt(),
  fields: (json['fields'] as List<dynamic>?)?.map((e) => e as String).toList(),
  tariffCategoryId: (json['tariffCategoryId'] as num?)?.toInt(),
  length: (json['length'] as num?)?.toDouble(),
  height: (json['height'] as num?)?.toDouble(),
  width: (json['width'] as num?)?.toDouble(),
  volumetricWeight: (json['volumetricWeight'] as num?)?.toDouble(),
  weight: (json['weight'] as num?)?.toDouble(),
  invoiceWeight: (json['invoiceWeight'] as num?)?.toDouble(),
  costPriceOfAirShipment: (json['costPriceOfAirShipment'] as num?)?.toDouble(),
  packageId: (json['packageId'] as num?)?.toInt(),
  additionalCostForFragileCargo: (json['additionalCostForFragileCargo'] as num?)
      ?.toDouble(),
);

Map<String, dynamic> _$OrderTariffEntityToJson(_OrderTariffEntity instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isActive': instance.isActive,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'id': instance.id,
      'deletedAt': instance.deletedAt,
      'icon': instance.icon,
      'sortIndex': instance.sortIndex,
      'fields': instance.fields,
      'tariffCategoryId': instance.tariffCategoryId,
      'length': instance.length,
      'height': instance.height,
      'width': instance.width,
      'volumetricWeight': instance.volumetricWeight,
      'weight': instance.weight,
      'invoiceWeight': instance.invoiceWeight,
      'costPriceOfAirShipment': instance.costPriceOfAirShipment,
      'packageId': instance.packageId,
      'additionalCostForFragileCargo': instance.additionalCostForFragileCargo,
    };

_OrderEntity _$OrderEntityFromJson(Map<String, dynamic> json) => _OrderEntity(
  id: (json['id'] as num).toInt(),
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  fromCityId: (json['fromCityId'] as num).toInt(),
  fromLatitude: (json['fromLatitude'] as num).toDouble(),
  fromLongitude: (json['fromLongitude'] as num).toDouble(),
  fromAddress: json['fromAddress'] as String,
  toCityId: (json['toCityId'] as num).toInt(),
  toLatitude: (json['toLatitude'] as num).toDouble(),
  toLongitude: (json['toLongitude'] as num).toDouble(),
  toAddress: json['toAddress'] as String,
  tariffId: (json['tariffId'] as num).toInt(),
  isFragile: json['isFragile'] as bool,
  isDefect: json['isDefect'] as bool,
  volumetricWeight: (json['volumetricWeight'] as num).toDouble(),
  weight: (json['weight'] as num).toDouble(),
  width: (json['width'] as num).toDouble(),
  length: (json['length'] as num).toDouble(),
  height: (json['height'] as num).toDouble(),
  calculationId: (json['calculationId'] as num).toInt(),
  isPaid: json['isPaid'] as bool? ?? false,
  deletedAt: json['deletedAt'] as String?,
  status: json['status'] as String?,
  fromApartment: json['fromApartment'] as String? ?? '',
  fromEntrance: json['fromEntrance'] as String?,
  fromFloor: json['fromFloor'] as String? ?? '',
  fromPhone: json['fromPhone'] as String?,
  fromName: json['fromName'] as String?,
  toApartment: json['toApartment'] as String? ?? '',
  toEntrance: json['toEntrance'] as String?,
  toFloor: json['toFloor'] as String? ?? '',
  toPhone: json['toPhone'] as String?,
  toName: json['toName'] as String?,
  price: (json['price'] as num?)?.toDouble() ?? 0.0,
  paidAmount: (json['paidAmount'] as num?)?.toDouble() ?? 0.0,
  payAmount: (json['payAmount'] as num?)?.toDouble() ?? 0.0,
  isCanCancel: json['isCanCancel'] as bool? ?? false,
  cancelType: (json['cancelType'] as num?)?.toInt() ?? 0,
  cancelAmount: (json['cancelAmount'] as num?)?.toDouble() ?? 0.0,
  tariff: json['tariff'] == null
      ? null
      : OrderTariffEntity.fromJson(json['tariff'] as Map<String, dynamic>),
  sendTime: json['sendTime'] as String?,
  courierArriveTime: json['courierArriveTime'] as String?,
  orderAccumulatorId: (json['orderAccumulatorId'] as num?)?.toInt(),
  comment: json['comment'] as String? ?? '',
  description: json['description'] as String? ?? '',
  category: json['category'] as String? ?? '',
  photos:
      (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  contentPhotos:
      (json['contentPhotos'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  defectPhotos:
      (json['defectPhotos'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  decideReason: json['decideReason'] as String? ?? '',
  decideDescription: json['decideDescription'] as String? ?? '',
  fromCity: json['fromCity'] == null
      ? null
      : OrderCityEntity.fromJson(json['fromCity'] as Map<String, dynamic>),
  toCity: json['toCity'] == null
      ? null
      : OrderCityEntity.fromJson(json['toCity'] as Map<String, dynamic>),
  qrs:
      (json['qrs'] as List<dynamic>?)
          ?.map((e) => QrEntity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  identifications:
      (json['identifications'] as List<dynamic>?)
          ?.map(
            (e) =>
                OrderIdentificationEntity.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  histories:
      (json['histories'] as List<dynamic>?)
          ?.map((e) => OrderHistoryEntity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$OrderEntityToJson(_OrderEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'fromCityId': instance.fromCityId,
      'fromLatitude': instance.fromLatitude,
      'fromLongitude': instance.fromLongitude,
      'fromAddress': instance.fromAddress,
      'toCityId': instance.toCityId,
      'toLatitude': instance.toLatitude,
      'toLongitude': instance.toLongitude,
      'toAddress': instance.toAddress,
      'tariffId': instance.tariffId,
      'isFragile': instance.isFragile,
      'isDefect': instance.isDefect,
      'volumetricWeight': instance.volumetricWeight,
      'weight': instance.weight,
      'width': instance.width,
      'length': instance.length,
      'height': instance.height,
      'calculationId': instance.calculationId,
      'isPaid': instance.isPaid,
      'deletedAt': instance.deletedAt,
      'status': instance.status,
      'fromApartment': instance.fromApartment,
      'fromEntrance': instance.fromEntrance,
      'fromFloor': instance.fromFloor,
      'fromPhone': instance.fromPhone,
      'fromName': instance.fromName,
      'toApartment': instance.toApartment,
      'toEntrance': instance.toEntrance,
      'toFloor': instance.toFloor,
      'toPhone': instance.toPhone,
      'toName': instance.toName,
      'price': instance.price,
      'paidAmount': instance.paidAmount,
      'payAmount': instance.payAmount,
      'isCanCancel': instance.isCanCancel,
      'cancelType': instance.cancelType,
      'cancelAmount': instance.cancelAmount,
      'tariff': instance.tariff,
      'sendTime': instance.sendTime,
      'courierArriveTime': instance.courierArriveTime,
      'orderAccumulatorId': instance.orderAccumulatorId,
      'comment': instance.comment,
      'description': instance.description,
      'category': instance.category,
      'photos': instance.photos,
      'contentPhotos': instance.contentPhotos,
      'defectPhotos': instance.defectPhotos,
      'decideReason': instance.decideReason,
      'decideDescription': instance.decideDescription,
      'fromCity': instance.fromCity,
      'toCity': instance.toCity,
      'qrs': instance.qrs,
      'identifications': instance.identifications,
      'histories': instance.histories,
    };

_OrderResultEntity _$OrderResultEntityFromJson(Map<String, dynamic> json) =>
    _OrderResultEntity(
      orderId: (json['orderId'] as num).toInt(),
      status: json['status'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$OrderResultEntityToJson(_OrderResultEntity instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'status': instance.status,
      'message': instance.message,
    };
