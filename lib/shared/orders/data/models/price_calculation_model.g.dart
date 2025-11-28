// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_calculation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PriceCalculationModel _$PriceCalculationModelFromJson(
  Map<String, dynamic> json,
) => _PriceCalculationModel(
  id: (json['id'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  deletedAt: json['deletedAt'] as String?,
  length: (json['length'] as num?)?.toDouble(),
  height: (json['height'] as num?)?.toDouble(),
  width: (json['width'] as num?)?.toDouble(),
  volumetricWeight: (json['volumetricWeight'] as num?)?.toDouble(),
  weight: (json['weight'] as num?)?.toDouble(),
  invoiceWeight: (json['invoiceWeight'] as num?)?.toDouble(),
  costPriceOfAirShipment: (json['costPriceOfAirShipment'] as num?)?.toDouble(),
  totalCostOfAirCargoShipment: (json['totalCostOfAirCargoShipment'] as num?)
      ?.toDouble(),
  courierExpensesAroundTheCityFromFixedSalary:
      (json['courierExpensesAroundTheCityFromFixedSalary'] as num?)?.toDouble(),
  courierExpensesAroundTheCityUponReceiptIfGoods:
      (json['courierExpensesAroundTheCityUponReceiptIfGoods'] as num?)
          ?.toDouble(),
  averageCourierFuelOerOrder: (json['averageCourierFuelOerOrder'] as num?)
      ?.toDouble(),
  carDepreciationExpense: (json['carDepreciationExpense'] as num?)?.toDouble(),
  averageProductPackagingPerUnit:
      (json['averageProductPackagingPerUnit'] as num?)?.toDouble(),
  additionalCostForFragileCargo: (json['additionalCostForFragileCargo'] as num?)
      ?.toDouble(),
  tax: (json['tax'] as num?)?.toDouble(),
  bankCommission: (json['bankCommission'] as num?)?.toDouble(),
  tariffCostInExpenses: (json['tariffCostInExpenses'] as num?)?.toDouble(),
  sellingPrice: (json['sellingPrice'] as num?)?.toDouble(),
  salesRevenue: (json['salesRevenue'] as num?)?.toDouble(),
  totalConsumptionPerOrder: (json['totalConsumptionPerOrder'] as num?)
      ?.toDouble(),
  marginality: (json['marginality'] as num?)?.toDouble(),
  netProfit: (json['netProfit'] as num?)?.toDouble(),
  orderProfitabilityPercentage: (json['orderProfitabilityPercentage'] as num?)
      ?.toDouble(),
  plannedMarkup: (json['plannedMarkup'] as num?)?.toDouble(),
);

Map<String, dynamic> _$PriceCalculationModelToJson(
  _PriceCalculationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'deletedAt': instance.deletedAt,
  'length': instance.length,
  'height': instance.height,
  'width': instance.width,
  'volumetricWeight': instance.volumetricWeight,
  'weight': instance.weight,
  'invoiceWeight': instance.invoiceWeight,
  'costPriceOfAirShipment': instance.costPriceOfAirShipment,
  'totalCostOfAirCargoShipment': instance.totalCostOfAirCargoShipment,
  'courierExpensesAroundTheCityFromFixedSalary':
      instance.courierExpensesAroundTheCityFromFixedSalary,
  'courierExpensesAroundTheCityUponReceiptIfGoods':
      instance.courierExpensesAroundTheCityUponReceiptIfGoods,
  'averageCourierFuelOerOrder': instance.averageCourierFuelOerOrder,
  'carDepreciationExpense': instance.carDepreciationExpense,
  'averageProductPackagingPerUnit': instance.averageProductPackagingPerUnit,
  'additionalCostForFragileCargo': instance.additionalCostForFragileCargo,
  'tax': instance.tax,
  'bankCommission': instance.bankCommission,
  'tariffCostInExpenses': instance.tariffCostInExpenses,
  'sellingPrice': instance.sellingPrice,
  'salesRevenue': instance.salesRevenue,
  'totalConsumptionPerOrder': instance.totalConsumptionPerOrder,
  'marginality': instance.marginality,
  'netProfit': instance.netProfit,
  'orderProfitabilityPercentage': instance.orderProfitabilityPercentage,
  'plannedMarkup': instance.plannedMarkup,
};
