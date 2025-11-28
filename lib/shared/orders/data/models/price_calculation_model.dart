import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_calculation_model.freezed.dart';
part 'price_calculation_model.g.dart';

@freezed
sealed class PriceCalculationModel with _$PriceCalculationModel {
  const factory PriceCalculationModel({
    int? id,
    required String createdAt,
    required String updatedAt,
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
  }) = _PriceCalculationModel;

  factory PriceCalculationModel.fromJson(Map<String, dynamic> json) =>
      _$PriceCalculationModelFromJson(json);
}

