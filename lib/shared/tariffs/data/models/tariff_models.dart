import 'package:json_annotation/json_annotation.dart';

part 'tariff_models.g.dart';

// ========== Модель пакета ==========

@JsonSerializable()
class PackageModel {
  final String createdAt;
  final String? deletedAt;
  final String description;
  final int? id;
  final String image;
  final bool isActive;
  final String name;
  final double? price;
  final String updatedAt;

  const PackageModel({
    required this.createdAt,
    this.deletedAt,
    required this.description,
    this.id,
    required this.image,
    required this.isActive,
    required this.name,
    this.price,
    required this.updatedAt,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) =>
      _$PackageModelFromJson(json);

  Map<String, dynamic> toJson() => _$PackageModelToJson(this);
}

// ========== Модель тарифа ==========

@JsonSerializable()
class TariffModel {
  final double? additionalCostForFragileCargo;
  final double? costPriceOfAirShipment;
  final String createdAt;
  final String? deletedAt;
  final String description;
  final List<String>? fields;
  final double? height;
  final int? icon;
  final int id;
  final String image;
  final double? invoiceWeight;
  final bool isActive;
  final double? length;
  final String name;
  final PackageModel? package;
  final int? packageId;
  final int? sortIndex;
  final TariffCategoryModel? tariffCategory;
  final int? tariffCategoryId;
  final String updatedAt;
  final double? volumetricWeight;
  final double? weight;
  final double? width;

  const TariffModel({
    this.additionalCostForFragileCargo,
    this.costPriceOfAirShipment,
    required this.createdAt,
    this.deletedAt,
    required this.description,
    this.fields,
    this.height,
    this.icon,
    required this.id,
    required this.image,
    this.invoiceWeight,
    required this.isActive,
    this.length,
    required this.name,
    this.package,
    this.packageId,
    this.sortIndex,
    this.tariffCategory,
    this.tariffCategoryId,
    required this.updatedAt,
    this.volumetricWeight,
    this.weight,
    this.width,
  });

  factory TariffModel.fromJson(Map<String, dynamic> json) =>
      _$TariffModelFromJson(json);

  Map<String, dynamic> toJson() => _$TariffModelToJson(this);
}

// ========== Модель категории тарифа ==========

@JsonSerializable()
class TariffCategoryModel {
  final bool active;
  final String createdAt;
  final String? deletedAt;
  final int? id;
  final String key;
  final String name;
  final int? sortIndex;
  final List<TariffModel>? tariffs;
  final String updatedAt;

  const TariffCategoryModel({
    required this.active,
    required this.createdAt,
    this.deletedAt,
    this.id,
    required this.key,
    required this.name,
    this.sortIndex,
    this.tariffs,
    required this.updatedAt,
  });

  factory TariffCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$TariffCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$TariffCategoryModelToJson(this);
}

// ========== Ответ API ==========

@JsonSerializable()
class TariffCategoriesApiResponse {
  final List<TariffCategoryModel> data;

  const TariffCategoriesApiResponse({required this.data});

  factory TariffCategoriesApiResponse.fromJson(Map<String, dynamic> json) =>
      _$TariffCategoriesApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TariffCategoriesApiResponseToJson(this);
}

typedef TariffCategoriesResponse = List<TariffCategoryModel>;

// ========== Создание тарифа ==========

@JsonSerializable()
class CreateTariffRequest {
  final double additionalCostForFragileCargo;
  final double costPriceOfAirShipment;
  final String description;
  final List<String> fields;
  final double height;
  final int icon;
  final String image;
  final bool isActive;
  final double length;
  final String name;
  final int packageId;
  final int sortIndex;
  final int tariffCategoryId;
  final double volumetricWeight;
  final double weight;
  final double width;

  const CreateTariffRequest({
    required this.additionalCostForFragileCargo,
    required this.costPriceOfAirShipment,
    required this.description,
    required this.fields,
    required this.height,
    required this.icon,
    required this.image,
    required this.isActive,
    required this.length,
    required this.name,
    required this.packageId,
    required this.sortIndex,
    required this.tariffCategoryId,
    required this.volumetricWeight,
    required this.weight,
    required this.width,
  });

  factory CreateTariffRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTariffRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTariffRequestToJson(this);
}

@JsonSerializable()
class CreateTariffResponse {
  final int id;
  final String message;
  final bool success;

  const CreateTariffResponse({
    required this.id,
    required this.message,
    required this.success,
  });

  factory CreateTariffResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTariffResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTariffResponseToJson(this);
}
