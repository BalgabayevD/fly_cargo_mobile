import 'package:fly_cargo/features/shared/orders/data/models/city_model.dart';
import 'package:fly_cargo/features/shared/orders/data/models/order_history_model.dart';
import 'package:fly_cargo/features/shared/orders/data/models/order_identification_model.dart';
import 'package:fly_cargo/features/shared/orders/data/models/order_model.dart';
import 'package:fly_cargo/features/shared/orders/data/models/order_result.dart';
import 'package:fly_cargo/features/shared/orders/data/models/price_calculation_model.dart';
import 'package:fly_cargo/features/shared/orders/data/models/qr_model.dart';
import 'package:fly_cargo/features/shared/orders/data/models/tariff_model.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';

extension OrderCityModelMapper on CityModel {
  OrderCityEntity toEntity() {
    return OrderCityEntity(
      name: name,
      country: country,
      createdAt: createdAt,
      updatedAt: updatedAt,
      id: id,
      deletedAt: deletedAt,
    );
  }
}

extension OrderHistoryModelMapper on OrderHistoryModel {
  OrderHistoryEntity toEntity() {
    return OrderHistoryEntity(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      orderId: orderId,
      status: status,
      userId: userId,
      comment: comment,
      description: description,
      parameters: parameters,
    );
  }
}

extension OrderIdentificationModelMapper on OrderIdentificationModel {
  OrderIdentificationEntity toEntity() {
    return OrderIdentificationEntity(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      orderId: orderId,
      target: target,
      uuid: uuid,
    );
  }
}

extension QrModelMapper on QrModel {
  QrEntity toEntity() {
    return QrEntity(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      orderId: orderId,
      target: target,
      uuid: uuid,
    );
  }
}

extension PriceCalculationModelMapper on PriceCalculationModel {
  PriceCalculationEntity toEntity() {
    return PriceCalculationEntity(
      createdAt: createdAt,
      updatedAt: updatedAt,
      id: id,
      deletedAt: deletedAt,
      length: length,
      height: height,
      width: width,
      volumetricWeight: volumetricWeight,
      weight: weight,
      invoiceWeight: invoiceWeight,
      costPriceOfAirShipment: costPriceOfAirShipment,
      totalCostOfAirCargoShipment: totalCostOfAirCargoShipment,
      courierExpensesAroundTheCityFromFixedSalary:
          courierExpensesAroundTheCityFromFixedSalary,
      courierExpensesAroundTheCityUponReceiptIfGoods:
          courierExpensesAroundTheCityUponReceiptIfGoods,
      averageCourierFuelOerOrder: averageCourierFuelOerOrder,
      carDepreciationExpense: carDepreciationExpense,
      averageProductPackagingPerUnit: averageProductPackagingPerUnit,
      additionalCostForFragileCargo: additionalCostForFragileCargo,
      tax: tax,
      bankCommission: bankCommission,
      tariffCostInExpenses: tariffCostInExpenses,
      sellingPrice: sellingPrice,
      salesRevenue: salesRevenue,
      totalConsumptionPerOrder: totalConsumptionPerOrder,
      marginality: marginality,
      netProfit: netProfit,
      orderProfitabilityPercentage: orderProfitabilityPercentage,
      plannedMarkup: plannedMarkup,
    );
  }
}

extension TariffModelToOrderTariffMapper on TariffModel {
  OrderTariffEntity toOrderTariffEntity() {
    return OrderTariffEntity(
      createdAt: createdAt,
      updatedAt: updatedAt,
      isActive: isActive,
      name: name,
      description: description,
      image: image,
      id: id,
      deletedAt: deletedAt,
      icon: icon,
      sortIndex: sortIndex,
      fields: fields,
      tariffCategoryId: tariffCategoryId,
      length: length,
      height: height,
      width: width,
      volumetricWeight: volumetricWeight,
      weight: weight,
      invoiceWeight: invoiceWeight,
      costPriceOfAirShipment: costPriceOfAirShipment,
      packageId: packageId,
      additionalCostForFragileCargo: additionalCostForFragileCargo,
    );
  }
}

extension OrderModelMapper on OrderModel {
  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      fromCityId: fromCityId,
      fromLatitude: fromLatitude,
      fromLongitude: fromLongitude,
      fromAddress: fromAddress,
      toCityId: toCityId,
      toLatitude: toLatitude,
      toLongitude: toLongitude,
      toAddress: toAddress,
      tariffId: tariffId,
      isFragile: isFragile,
      isDefect: isDefect,
      volumetricWeight: volumetricWeight,
      weight: weight,
      width: width,
      length: length,
      height: height,
      calculationId: calculationId,
      isPaid: isPaid,
      deletedAt: deletedAt,
      status: status,
      fromApartment: fromApartment,
      fromEntrance: fromEntrance,
      fromFloor: fromFloor,
      fromPhone: fromPhone,
      fromName: fromName,
      toApartment: toApartment,
      toEntrance: toEntrance,
      toFloor: toFloor,
      toPhone: toPhone,
      toName: toName,
      price: price,
      paidAmount: paidAmount,
      payAmount: payAmount,
      tariff: tariff?.toOrderTariffEntity(),
      sendTime: sendTime,
      courierArriveTime: courierArriveTime,
      orderAccumulatorId: orderAccumulatorId,
      comment: comment,
      description: description,
      category: category,
      photos: photos,
      contentPhotos: contentPhotos,
      defectPhotos: defectPhotos,
      decideReason: decideReason,
      decideDescription: decideDescription,
      fromCity: fromCity?.toEntity(),
      toCity: toCity?.toEntity(),
      qrs: qrs?.map((q) => q.toEntity()).toList(),
      identifications: identifications.map((i) => i.toEntity()).toList(),
      histories: histories.map((h) => h.toEntity()).toList(),
    );
  }
}

extension OrderResultMapper on OrderResult {
  OrderResultEntity toEntity() {
    return OrderResultEntity(
      orderId: orderId,
      status: status,
      message: message,
    );
  }
}
