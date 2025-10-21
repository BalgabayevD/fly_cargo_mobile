import 'package:json_annotation/json_annotation.dart';

part 'tariff_models.g.dart';

// ========== Модель пакета ==========

@JsonSerializable()
class PackageModel {
  final String createdAt;
  final String description;
  final int id;
  final String image;
  final bool isActive;
  final String name;
  final double price;
  final String updatedAt;

  const PackageModel({
    required this.createdAt,
    required this.description,
    required this.id,
    required this.image,
    required this.isActive,
    required this.name,
    required this.price,
    required this.updatedAt,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) =>
      _$PackageModelFromJson(json);

  Map<String, dynamic> toJson() => _$PackageModelToJson(this);
}

// ========== Модель тарифа ==========

@JsonSerializable()
class TariffModel {
  final double additionalCostForFragileCargo;
  final double costPriceOfAirShipment;
  final String createdAt;
  final String description;
  final List<String> fields;
  final double height;
  final int icon;
  final int id;
  final String image;
  final double invoiceWeight;
  final bool isActive;
  final double length;
  final String name;
  final PackageModel package;
  final int packageId;
  final int sortIndex;
  final String tariffCategory;
  final int tariffCategoryId;
  final String updatedAt;
  final double volumetricWeight;
  final double weight;
  final double width;

  const TariffModel({
    required this.additionalCostForFragileCargo,
    required this.costPriceOfAirShipment,
    required this.createdAt,
    required this.description,
    required this.fields,
    required this.height,
    required this.icon,
    required this.id,
    required this.image,
    required this.invoiceWeight,
    required this.isActive,
    required this.length,
    required this.name,
    required this.package,
    required this.packageId,
    required this.sortIndex,
    required this.tariffCategory,
    required this.tariffCategoryId,
    required this.updatedAt,
    required this.volumetricWeight,
    required this.weight,
    required this.width,
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
  final int id;
  final String key;
  final String name;
  final int sortIndex;
  final List<TariffModel> tariffs;
  final String updatedAt;

  const TariffCategoryModel({
    required this.active,
    required this.createdAt,
    required this.id,
    required this.key,
    required this.name,
    required this.sortIndex,
    required this.tariffs,
    required this.updatedAt,
  });

  factory TariffCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$TariffCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$TariffCategoryModelToJson(this);
}

// ========== Ответ API ==========

typedef TariffCategoriesResponse = List<TariffCategoryModel>;
