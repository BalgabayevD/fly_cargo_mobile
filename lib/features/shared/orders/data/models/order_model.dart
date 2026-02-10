import 'package:freezed_annotation/freezed_annotation.dart';

import 'city_model.dart';
import 'order_history_model.dart';
import 'order_identification_model.dart';
import 'price_calculation_model.dart';
import 'qr_model.dart';
import 'tariff_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

enum StatusModel {
  created('created'),
  cancelled('cancelled'),
  accepted('accepted'),
  decided('decided'),
  submitted('submitted'),
  accounted('accounted'),
  checked('checked'),
  revision('revision'),
  dispatched('dispatched'),
  transit('transit'),
  arrived('arrived'),
  delivers_recipient('delivers_recipient'),
  completed('completed')
  ;

  const StatusModel(this.value);

  final String value;
}

@freezed
sealed class OrderModel with _$OrderModel {
  const factory OrderModel({
    required int id,
    required String createdAt,
    required String updatedAt,
    required int fromCityId,
    required double fromLatitude,
    required double fromLongitude,
    required String fromAddress,
    required int toCityId,
    required double toLatitude,
    required double toLongitude,
    required String toAddress,
    required int tariffId,
    required bool isFragile,
    required bool isDefect,
    required double volumetricWeight,
    required double weight,
    required double width,
    required double length,
    required double height,
    required int calculationId,
    bool? isPaid,
    String? deletedAt,
    String? status,
    @Default('') String fromApartment,
    String? fromEntrance,
    @Default('') String fromFloor,
    @Default('') String fromPhone,
    @Default('') String fromName,
    @Default('') String toApartment,
    String? toEntrance,
    @Default('') String toFloor,
    String? toPhone,
    String? toName,
    double? price,
    double? paidAmount,
    double? payAmount,
    TariffModel? tariff,
    String? sendTime,
    String? courierArriveTime,
    int? orderAccumulatorId,
    @Default('') String comment,
    @Default('') String description,
    @Default('') String category,
    @Default([]) List<String> photos,
    @Default([]) List<String> contentPhotos,
    @Default([]) List<String>? defectPhotos,
    @Default('') String decideReason,
    @Default('') String decideDescription,
    CityModel? fromCity,
    CityModel? toCity,
    @Default([]) List<QrModel>? qrs,
    @Default([]) List<OrderIdentificationModel> identifications,
    @Default([]) List<OrderHistoryModel> histories,
    PriceCalculationModel? priceCalculations,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
