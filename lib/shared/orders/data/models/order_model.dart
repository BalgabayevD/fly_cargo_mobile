import 'package:freezed_annotation/freezed_annotation.dart';

import 'city_model.dart';
import 'order_history_model.dart';
import 'order_identification_model.dart';
import 'participant_model.dart';
import 'price_calculation_model.dart';
import 'qr_model.dart';
import 'tariff_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

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
    required bool isPaid,
    required bool isFragile,
    required bool isDefect,
    required double volumetricWeight,
    required double weight,
    required double width,
    required double length,
    required double height,
    required int calculationId,
    String? deletedAt,
    String? status,
    @Default('') String fromApartment,
    String? fromEntrance,
    @Default('') String fromFloor,
    @Default('') String toApartment,
    String? toEntrance,
    @Default('') String toFloor,
    String? toPhone,
    String? toName,
    double? price,
    TariffModel? tariff,
    String? sendTime,
    @Default('') String comment,
    @Default('') String description,
    @Default('') String category,
    @Default([]) List<String> photos,
    @Default([]) List<String> contentPhotos,
    @Default([]) List<String>? defectPhotos,
    @Default('') @JsonKey(name: 'decideReason') String declineReason,
    @Default('') @JsonKey(name: 'decideDescription') String declineDescription,
    CityModel? fromCity,
    CityModel? toCity,
    @Default([]) List<ParticipantModel> participants,
    @Default([]) List<QrModel>? qrs,
    @Default([]) List<OrderIdentificationModel> identifications,
    @Default([]) List<OrderHistoryModel> histories,
    PriceCalculationModel? priceCalculations,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
