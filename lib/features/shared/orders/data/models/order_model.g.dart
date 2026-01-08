// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
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
  isPaid: json['isPaid'] as bool?,
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
  price: (json['price'] as num?)?.toDouble(),
  paidAmount: (json['paidAmount'] as num?)?.toDouble(),
  payAmount: (json['payAmount'] as num?)?.toDouble(),
  tariff: json['tariff'] == null
      ? null
      : TariffModel.fromJson(json['tariff'] as Map<String, dynamic>),
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
      : CityModel.fromJson(json['fromCity'] as Map<String, dynamic>),
  toCity: json['toCity'] == null
      ? null
      : CityModel.fromJson(json['toCity'] as Map<String, dynamic>),
  qrs:
      (json['qrs'] as List<dynamic>?)
          ?.map((e) => QrModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  identifications:
      (json['identifications'] as List<dynamic>?)
          ?.map(
            (e) => OrderIdentificationModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  histories:
      (json['histories'] as List<dynamic>?)
          ?.map((e) => OrderHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  priceCalculations: json['priceCalculations'] == null
      ? null
      : PriceCalculationModel.fromJson(
          json['priceCalculations'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
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
      'priceCalculations': instance.priceCalculations,
    };
