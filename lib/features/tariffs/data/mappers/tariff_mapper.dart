import 'package:fly_cargo/features/tariffs/data/models/tariff_models.dart';
import 'package:fly_cargo/features/tariffs/domain/entities/tariff_entity.dart';

extension PackageModelMapper on PackageModel {
  PackageEntity toEntity() {
    return PackageEntity(
      createdAt: createdAt,
      description: description,
      image: image,
      isActive: isActive,
      name: name,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      id: id,
      price: price,
    );
  }
}

extension TariffModelMapper on TariffModel {
  TariffEntity toEntity() {
    return TariffEntity(
      createdAt: createdAt,
      description: description,
      id: id,
      image: image,
      isActive: isActive,
      name: name,
      updatedAt: updatedAt,
      additionalCostForFragileCargo: additionalCostForFragileCargo,
      costPriceOfAirShipment: costPriceOfAirShipment,
      deletedAt: deletedAt,
      fields: fields,
      height: height,
      invoiceWeight: invoiceWeight,
      length: length,
      package: package?.toEntity(),
      packageId: packageId,
      sortIndex: sortIndex,
      tariffCategoryId: tariffCategoryId,
      volumetricWeight: volumetricWeight,
      weight: weight,
      width: width,
    );
  }
}

extension TariffCategoryModelMapper on TariffCategoryModel {
  TariffCategoryEntity toEntity() {
    return TariffCategoryEntity(
      active: active,
      createdAt: createdAt,
      key: key,
      name: name,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      id: id,
      sortIndex: sortIndex,
      tariffs: tariffs?.map((t) => t.toEntity()).toList(),
    );
  }
}

extension CreateTariffResponseMapper on CreateTariffResponse {
  CreateTariffResultEntity toEntity() {
    return CreateTariffResultEntity(
      id: id,
      message: message,
      success: success,
    );
  }
}
