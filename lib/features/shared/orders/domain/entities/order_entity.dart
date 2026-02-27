import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_entity.freezed.dart';
part 'order_entity.g.dart';

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

  factory OrderCityEntity.fromJson(Map<String, Object?> json) =>
      _$OrderCityEntityFromJson(json);
}

@freezed
sealed class OrderHistoryEntity with _$OrderHistoryEntity {
  const factory OrderHistoryEntity({
    int? id,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    int? orderId,
    String? status,
    String? userId,
    String? comment,
    String? description,
    String? parameters,
  }) = _OrderHistoryEntity;

  factory OrderHistoryEntity.fromJson(Map<String, Object?> json) =>
      _$OrderHistoryEntityFromJson(json);
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

  factory OrderIdentificationEntity.fromJson(Map<String, Object?> json) =>
      _$OrderIdentificationEntityFromJson(json);
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

  factory QrEntity.fromJson(Map<String, Object?> json) =>
      _$QrEntityFromJson(json);
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

  factory OrderTariffEntity.fromJson(Map<String, Object?> json) =>
      _$OrderTariffEntityFromJson(json);
}

@JsonEnum(valueField: 'value')
enum OrderStatus {
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
  @JsonValue('delivers_recipient')
  deliversRecipient('delivers_recipient'),
  completed('completed')
  ;

  final String value;

  const OrderStatus(this.value);
}

@freezed
sealed class OrderEntity with _$OrderEntity {
  const OrderEntity._();

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
    required String status,
    @Default(false) bool isPaid,
    String? deletedAt,
    @Default('') String fromApartment,
    String? fromEntrance,
    @Default('') String fromFloor,
    String? fromPhone,
    String? fromName,
    @Default('') String toApartment,
    String? toEntrance,
    @Default('') String toFloor,
    String? toPhone,
    String? toName,
    @Default(0.0) double price,
    @Default(0.0) double paidAmount,
    @Default(0.0) double payAmount,
    @Default(false) bool isCanCancel,
    @Default(0) int cancelType, // 1 - бесплатно, 2 платно
    @Default(0.0) double cancelAmount,
    OrderTariffEntity? tariff,
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
    OrderCityEntity? fromCity,
    OrderCityEntity? toCity,
    @Default([]) List<QrEntity>? qrs,
    @Default([]) List<OrderIdentificationEntity> identifications,
    @Default([]) List<OrderHistoryEntity> histories,
  }) = _OrderEntity;

  factory OrderEntity.fromJson(Map<String, Object?> json) =>
      _$OrderEntityFromJson(json);

  bool get isAccounted => histories.any((e) => e.status == 'accounted');
  bool get isChecked => histories.any((e) => e.status == 'checked');
  bool get isTransit => histories.any((e) => e.status == 'transit');
  bool get isArrived => histories.any((e) => e.status == 'arrived');
  bool get isAssigned => histories.any((e) => e.status == 'assigned');
  bool get isCompleted => histories.any((e) => e.status == 'completed');

  String toStatus() {
    String value = '';

    if (isAccounted) {
      value = 'Заказ получен в г. ${fromCity?.name}';
    }
    if (isChecked) {
      value = 'Заказ прошел обработку';
    }
    if (isTransit) {
      value = 'Заказ отгружен';
    }
    if (isArrived) {
      value = 'Заказ прибыл в г. ${toCity?.name}';
    }
    if (isAssigned) {
      value = 'Заказ выдан на доставку';
    }
    if (isCompleted) {
      value = 'Заказ завершен';
    }

    return value;
  }
}

@freezed
sealed class OrderResultEntity with _$OrderResultEntity {
  const factory OrderResultEntity({
    required int orderId,
    required String status,
    required String message,
  }) = _OrderResultEntity;

  factory OrderResultEntity.fromJson(Map<String, Object?> json) =>
      _$OrderResultEntityFromJson(json);
}
