import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_entity.freezed.dart';

@freezed
sealed class OrderCityEntity with _$OrderCityEntity {
  const factory OrderCityEntity({
    required String name,
    required String country,
    required String createdAt,
    required String updatedAt,
    int? id,
    String? deletedAt,
  }) = _OrderCityEntity;
}

@freezed
sealed class OrderHistoryEntity with _$OrderHistoryEntity {
  const factory OrderHistoryEntity({
    int? id,
    String? createdAt,
    String? updatedAt,
    int? orderId,
    String? status,
    String? userId,
    String? comment,
  }) = _OrderHistoryEntity;
}

@freezed
sealed class OrderIdentificationEntity with _$OrderIdentificationEntity {
  const factory OrderIdentificationEntity({
    int? id,
    String? createdAt,
    String? updatedAt,
    int? orderId,
    String? target,
    String? uuid,
  }) = _OrderIdentificationEntity;
}

@freezed
sealed class QrEntity with _$QrEntity {
  const factory QrEntity({
    int? id,
    String? createdAt,
    String? updatedAt,
    int? orderId,
    String? target,
    String? uuid,
  }) = _QrEntity;
}

@freezed
sealed class PriceCalculationEntity with _$PriceCalculationEntity {
  const factory PriceCalculationEntity({
    required String createdAt,
    required String updatedAt,
    int? id,
    String? deletedAt,
    double? length,
    double? height,
    double? width,
    double? volumetricWeight,
    double? weight,
    double? invoiceWeight,
    double? costPriceOfAirShipment,
    double? totalCostOfAirCargoShipment,
    double? courierExpensesAroundTheCityFromFixedSalary,
    double? courierExpensesAroundTheCityUponReceiptIfGoods,
    double? averageCourierFuelOerOrder,
    double? carDepreciationExpense,
    double? averageProductPackagingPerUnit,
    double? additionalCostForFragileCargo,
    double? tax,
    double? bankCommission,
    double? tariffCostInExpenses,
    double? sellingPrice,
    double? salesRevenue,
    double? totalConsumptionPerOrder,
    double? marginality,
    double? netProfit,
    double? orderProfitabilityPercentage,
    double? plannedMarkup,
  }) = _PriceCalculationEntity;
}

@freezed
sealed class OrderTariffEntity with _$OrderTariffEntity {
  const factory OrderTariffEntity({
    required String createdAt,
    required String updatedAt,
    required bool isActive,
    required String name,
    required String description,
    required String image,
    int? id,
    String? deletedAt,
    int? icon,
    int? sortIndex,
    List<String>? fields,
    int? tariffCategoryId,
    double? length,
    double? height,
    double? width,
    double? volumetricWeight,
    double? weight,
    double? invoiceWeight,
    double? costPriceOfAirShipment,
    int? packageId,
    double? additionalCostForFragileCargo,
  }) = _OrderTariffEntity;
}

@freezed
sealed class OrderEntity with _$OrderEntity {
  const factory OrderEntity({
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
    @Default('') String toApartment,
    String? toEntrance,
    @Default('') String toFloor,
    String? toPhone,
    String? toName,
    double? price,
    OrderTariffEntity? tariff,
    String? sendTime,
    @Default('') String comment,
    @Default('') String description,
    @Default('') String category,
    @Default([]) List<String> photos,
    @Default([]) List<String> contentPhotos,
    @Default([]) List<String>? defectPhotos,
    @Default('') String decideReason,
    @Default('') String decideDescription,
    OrderCityEntity? fromCity,
    OrderCityEntity? toCity,
    @Default([]) List<QrEntity>? qrs,
    @Default([]) List<OrderIdentificationEntity> identifications,
    @Default([]) List<OrderHistoryEntity> histories,
    PriceCalculationEntity? priceCalculations,
  }) = _OrderEntity;
}

@freezed
sealed class OrderResultEntity with _$OrderResultEntity {
  const factory OrderResultEntity({
    required int orderId,
    required String status,
    required String message,
  }) = _OrderResultEntity;
}
