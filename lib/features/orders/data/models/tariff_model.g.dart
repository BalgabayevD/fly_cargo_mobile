// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tariff_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TariffModel _$TariffModelFromJson(Map<String, dynamic> json) => _TariffModel(
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  isActive: json['isActive'] as bool,
  name: json['name'] as String,
  description: json['description'] as String,
  image: json['image'] as String,
  id: (json['id'] as num?)?.toInt(),
  deletedAt: json['deletedAt'] as String?,
  icon: (json['icon'] as num?)?.toInt(),
  sortIndex: (json['sortIndex'] as num?)?.toInt(),
  fields: (json['fields'] as List<dynamic>?)?.map((e) => e as String).toList(),
  tariffCategoryId: (json['tariffCategoryId'] as num?)?.toInt(),
  length: (json['length'] as num?)?.toDouble(),
  height: (json['height'] as num?)?.toDouble(),
  width: (json['width'] as num?)?.toDouble(),
  volumetricWeight: (json['volumetricWeight'] as num?)?.toDouble(),
  weight: (json['weight'] as num?)?.toDouble(),
  invoiceWeight: (json['invoiceWeight'] as num?)?.toDouble(),
  costPriceOfAirShipment: (json['costPriceOfAirShipment'] as num?)?.toDouble(),
  packageId: (json['packageId'] as num?)?.toInt(),
  additionalCostForFragileCargo: (json['additionalCostForFragileCargo'] as num?)
      ?.toDouble(),
  tariffCategory: json['tariffCategory'] == null
      ? null
      : TariffCategoryModel.fromJson(
          json['tariffCategory'] as Map<String, dynamic>,
        ),
  package: json['package'] == null
      ? null
      : PackageModel.fromJson(json['package'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TariffModelToJson(_TariffModel instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isActive': instance.isActive,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'id': instance.id,
      'deletedAt': instance.deletedAt,
      'icon': instance.icon,
      'sortIndex': instance.sortIndex,
      'fields': instance.fields,
      'tariffCategoryId': instance.tariffCategoryId,
      'length': instance.length,
      'height': instance.height,
      'width': instance.width,
      'volumetricWeight': instance.volumetricWeight,
      'weight': instance.weight,
      'invoiceWeight': instance.invoiceWeight,
      'costPriceOfAirShipment': instance.costPriceOfAirShipment,
      'packageId': instance.packageId,
      'additionalCostForFragileCargo': instance.additionalCostForFragileCargo,
      'tariffCategory': instance.tariffCategory,
      'package': instance.package,
    };
