import 'package:freezed_annotation/freezed_annotation.dart';

part 'tariff_entity.freezed.dart';

@freezed
sealed class PackageEntity with _$PackageEntity {
  const factory PackageEntity({
    required String createdAt,
    required String description,
    required String image,
    required bool isActive,
    required String name,
    required String updatedAt,
    String? deletedAt,
    int? id,
    double? price,
  }) = _PackageEntity;
}

@freezed
sealed class TariffEntity with _$TariffEntity {
  const factory TariffEntity({
    required String createdAt,
    required String description,
    required int id,
    required String image,
    required bool isActive,
    required String name,
    required String updatedAt,
    double? additionalCostForFragileCargo,
    double? costPriceOfAirShipment,
    String? deletedAt,
    List<String>? fields,
    double? height,
    double? invoiceWeight,
    double? length,
    PackageEntity? package,
    int? packageId,
    int? sortIndex,
    int? tariffCategoryId,
    double? volumetricWeight,
    double? weight,
    double? width,
  }) = _TariffEntity;
}

@freezed
sealed class TariffCategoryEntity with _$TariffCategoryEntity {
  const factory TariffCategoryEntity({
    required bool active,
    required String createdAt,
    required String key,
    required String name,
    required String updatedAt,
    String? deletedAt,
    int? id,
    int? sortIndex,
    List<TariffEntity>? tariffs,
  }) = _TariffCategoryEntity;
}

@freezed
sealed class CreateTariffResultEntity with _$CreateTariffResultEntity {
  const factory CreateTariffResultEntity({
    required int id,
    required String message,
    required bool success,
  }) = _CreateTariffResultEntity;
}
