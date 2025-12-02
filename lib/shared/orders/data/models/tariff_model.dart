import 'package:freezed_annotation/freezed_annotation.dart';

import 'package_model.dart';
import 'tariff_category_model.dart';

part 'tariff_model.freezed.dart';
part 'tariff_model.g.dart';

@freezed
sealed class TariffModel with _$TariffModel {
  const factory TariffModel({
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
    TariffCategoryModel? tariffCategory,
    PackageModel? package,
  }) = _TariffModel;

  factory TariffModel.fromJson(Map<String, dynamic> json) =>
      _$TariffModelFromJson(json);
}
