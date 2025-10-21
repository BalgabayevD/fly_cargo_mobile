// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tariff_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageModel _$PackageModelFromJson(Map<String, dynamic> json) => PackageModel(
  createdAt: json['createdAt'] as String,
  description: json['description'] as String,
  id: (json['id'] as num).toInt(),
  image: json['image'] as String,
  isActive: json['isActive'] as bool,
  name: json['name'] as String,
  price: (json['price'] as num).toDouble(),
  updatedAt: json['updatedAt'] as String,
);

Map<String, dynamic> _$PackageModelToJson(PackageModel instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'description': instance.description,
      'id': instance.id,
      'image': instance.image,
      'isActive': instance.isActive,
      'name': instance.name,
      'price': instance.price,
      'updatedAt': instance.updatedAt,
    };

TariffModel _$TariffModelFromJson(Map<String, dynamic> json) => TariffModel(
  additionalCostForFragileCargo: (json['additionalCostForFragileCargo'] as num)
      .toDouble(),
  costPriceOfAirShipment: (json['costPriceOfAirShipment'] as num).toDouble(),
  createdAt: json['createdAt'] as String,
  description: json['description'] as String,
  fields: (json['fields'] as List<dynamic>).map((e) => e as String).toList(),
  height: (json['height'] as num).toDouble(),
  icon: (json['icon'] as num).toInt(),
  id: (json['id'] as num).toInt(),
  image: json['image'] as String,
  invoiceWeight: (json['invoiceWeight'] as num).toDouble(),
  isActive: json['isActive'] as bool,
  length: (json['length'] as num).toDouble(),
  name: json['name'] as String,
  package: PackageModel.fromJson(json['package'] as Map<String, dynamic>),
  packageId: (json['packageId'] as num).toInt(),
  sortIndex: (json['sortIndex'] as num).toInt(),
  tariffCategory: json['tariffCategory'] as String,
  tariffCategoryId: (json['tariffCategoryId'] as num).toInt(),
  updatedAt: json['updatedAt'] as String,
  volumetricWeight: (json['volumetricWeight'] as num).toDouble(),
  weight: (json['weight'] as num).toDouble(),
  width: (json['width'] as num).toDouble(),
);

Map<String, dynamic> _$TariffModelToJson(TariffModel instance) =>
    <String, dynamic>{
      'additionalCostForFragileCargo': instance.additionalCostForFragileCargo,
      'costPriceOfAirShipment': instance.costPriceOfAirShipment,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'fields': instance.fields,
      'height': instance.height,
      'icon': instance.icon,
      'id': instance.id,
      'image': instance.image,
      'invoiceWeight': instance.invoiceWeight,
      'isActive': instance.isActive,
      'length': instance.length,
      'name': instance.name,
      'package': instance.package,
      'packageId': instance.packageId,
      'sortIndex': instance.sortIndex,
      'tariffCategory': instance.tariffCategory,
      'tariffCategoryId': instance.tariffCategoryId,
      'updatedAt': instance.updatedAt,
      'volumetricWeight': instance.volumetricWeight,
      'weight': instance.weight,
      'width': instance.width,
    };

TariffCategoryModel _$TariffCategoryModelFromJson(Map<String, dynamic> json) =>
    TariffCategoryModel(
      active: json['active'] as bool,
      createdAt: json['createdAt'] as String,
      id: (json['id'] as num).toInt(),
      key: json['key'] as String,
      name: json['name'] as String,
      sortIndex: (json['sortIndex'] as num).toInt(),
      tariffs: (json['tariffs'] as List<dynamic>)
          .map((e) => TariffModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$TariffCategoryModelToJson(
  TariffCategoryModel instance,
) => <String, dynamic>{
  'active': instance.active,
  'createdAt': instance.createdAt,
  'id': instance.id,
  'key': instance.key,
  'name': instance.name,
  'sortIndex': instance.sortIndex,
  'tariffs': instance.tariffs,
  'updatedAt': instance.updatedAt,
};
