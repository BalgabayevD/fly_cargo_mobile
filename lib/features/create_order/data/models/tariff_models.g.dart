// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tariff_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PackageModel _$PackageModelFromJson(Map<String, dynamic> json) =>
    _PackageModel(
      id: (json['id'] as num).toInt(),
      description: json['description'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$PackageModelToJson(_PackageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'image': instance.image,
      'name': instance.name,
    };

_TariffModel _$TariffModelFromJson(Map<String, dynamic> json) => _TariffModel(
  id: (json['id'] as num).toInt(),
  description: json['description'] as String,
  image: json['image'] as String,
  name: json['name'] as String,
  fields: (json['fields'] as List<dynamic>?)?.map((e) => e as String).toList(),
  height: (json['height'] as num?)?.toDouble(),
  invoiceWeight: (json['invoiceWeight'] as num?)?.toDouble(),
  length: (json['length'] as num?)?.toDouble(),
  volumetricWeight: (json['volumetricWeight'] as num?)?.toDouble(),
  weight: (json['weight'] as num?)?.toDouble(),
  width: (json['width'] as num?)?.toDouble(),
);

Map<String, dynamic> _$TariffModelToJson(_TariffModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'image': instance.image,
      'name': instance.name,
      'fields': instance.fields,
      'height': instance.height,
      'invoiceWeight': instance.invoiceWeight,
      'length': instance.length,
      'volumetricWeight': instance.volumetricWeight,
      'weight': instance.weight,
      'width': instance.width,
    };

_TariffCategoryModel _$TariffCategoryModelFromJson(Map<String, dynamic> json) =>
    _TariffCategoryModel(
      id: (json['id'] as num).toInt(),
      key: json['key'] as String,
      name: json['name'] as String,
      tariffs: (json['tariffs'] as List<dynamic>?)
          ?.map((e) => TariffModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TariffCategoryModelToJson(
  _TariffCategoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'key': instance.key,
  'name': instance.name,
  'tariffs': instance.tariffs,
};

_TariffCategoriesApiResponse _$TariffCategoriesApiResponseFromJson(
  Map<String, dynamic> json,
) => _TariffCategoriesApiResponse(
  data: (json['data'] as List<dynamic>)
      .map((e) => TariffCategoryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TariffCategoriesApiResponseToJson(
  _TariffCategoriesApiResponse instance,
) => <String, dynamic>{'data': instance.data};

_CreateTariffRequest _$CreateTariffRequestFromJson(
  Map<String, dynamic> json,
) => _CreateTariffRequest(
  additionalCostForFragileCargo: (json['additionalCostForFragileCargo'] as num)
      .toDouble(),
  costPriceOfAirShipment: (json['costPriceOfAirShipment'] as num).toDouble(),
  description: json['description'] as String,
  fields: (json['fields'] as List<dynamic>).map((e) => e as String).toList(),
  height: (json['height'] as num).toDouble(),
  icon: (json['icon'] as num).toInt(),
  image: json['image'] as String,
  isActive: json['isActive'] as bool,
  length: (json['length'] as num).toDouble(),
  name: json['name'] as String,
  packageId: (json['packageId'] as num).toInt(),
  sortIndex: (json['sortIndex'] as num).toInt(),
  tariffCategoryId: (json['tariffCategoryId'] as num).toInt(),
  volumetricWeight: (json['volumetricWeight'] as num).toDouble(),
  weight: (json['weight'] as num).toDouble(),
  width: (json['width'] as num).toDouble(),
);

Map<String, dynamic> _$CreateTariffRequestToJson(
  _CreateTariffRequest instance,
) => <String, dynamic>{
  'additionalCostForFragileCargo': instance.additionalCostForFragileCargo,
  'costPriceOfAirShipment': instance.costPriceOfAirShipment,
  'description': instance.description,
  'fields': instance.fields,
  'height': instance.height,
  'icon': instance.icon,
  'image': instance.image,
  'isActive': instance.isActive,
  'length': instance.length,
  'name': instance.name,
  'packageId': instance.packageId,
  'sortIndex': instance.sortIndex,
  'tariffCategoryId': instance.tariffCategoryId,
  'volumetricWeight': instance.volumetricWeight,
  'weight': instance.weight,
  'width': instance.width,
};
