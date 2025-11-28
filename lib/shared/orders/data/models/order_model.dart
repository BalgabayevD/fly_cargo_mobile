import 'package:freezed_annotation/freezed_annotation.dart';
import 'tariff_model.dart';
import 'city_model.dart';
import 'participant_model.dart';
import 'qr_model.dart';
import 'price_calculation_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
sealed class OrderModel with _$OrderModel {
  const factory OrderModel({
    required int id,
    required String createdAt,
    required String updatedAt,
    String? deletedAt,
    required int fromCityId,
    required double fromLatitude,
    required double fromLongitude,
    required String fromApartment,
    String? fromEntrance,
    required String fromFloor,
    required String fromAddress,
    required int toCityId,
    required double toLatitude,
    required double toLongitude,
    required String toApartment,
    String? toEntrance,
    required String toFloor,
    required String toAddress,
    double? price,
    required int tariffId,
    TariffModel? tariff,
    required String comment,
    required String description,
    required String category,
    required bool isPaid,
    required bool isFragile,
    required bool isDefect,
    required List<String> photos,
    required List<String> contentPhotos,
    List<String>? defectPhotos,
    required double volumetricWeight,
    required double weight,
    required double width,
    required double length,
    required double height,
    CityModel? fromCity,
    CityModel? toCity,
    required List<ParticipantModel> participants,
    List<QrModel>? qrs,
    required int calculationId,
    PriceCalculationModel? priceCalculations,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

