// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tariff_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageModel _$PackageModelFromJson(Map<String, dynamic> json) => PackageModel(
  createdAt: json['createdAt'] as String,
  description: json['description'] as String,
  image: json['image'] as String,
  isActive: json['isActive'] as bool,
  name: json['name'] as String,
  updatedAt: json['updatedAt'] as String,
  deletedAt: json['deletedAt'] as String?,
  id: (json['id'] as num?)?.toInt(),
  price: (json['price'] as num?)?.toDouble(),
);

Map<String, dynamic> _$PackageModelToJson(PackageModel instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'deletedAt': instance.deletedAt,
      'description': instance.description,
      'id': instance.id,
      'image': instance.image,
      'isActive': instance.isActive,
      'name': instance.name,
      'price': instance.price,
      'updatedAt': instance.updatedAt,
    };

TariffModel _$TariffModelFromJson(Map<String, dynamic> json) => TariffModel(
  createdAt: json['createdAt'] as String,
  description: json['description'] as String,
  id: (json['id'] as num).toInt(),
  image: json['image'] as String,
  isActive: json['isActive'] as bool,
  name: json['name'] as String,
  updatedAt: json['updatedAt'] as String,
  additionalCostForFragileCargo: (json['additionalCostForFragileCargo'] as num?)
      ?.toDouble(),
  costPriceOfAirShipment: (json['costPriceOfAirShipment'] as num?)?.toDouble(),
  deletedAt: json['deletedAt'] as String?,
  fields: (json['fields'] as List<dynamic>?)?.map((e) => e as String).toList(),
  height: (json['height'] as num?)?.toDouble(),
  icon: (json['icon'] as num?)?.toInt(),
  invoiceWeight: (json['invoiceWeight'] as num?)?.toDouble(),
  length: (json['length'] as num?)?.toDouble(),
  package: json['package'] == null
      ? null
      : PackageModel.fromJson(json['package'] as Map<String, dynamic>),
  packageId: (json['packageId'] as num?)?.toInt(),
  sortIndex: (json['sortIndex'] as num?)?.toInt(),
  tariffCategory: json['tariffCategory'] == null
      ? null
      : TariffCategoryModel.fromJson(
          json['tariffCategory'] as Map<String, dynamic>,
        ),
  tariffCategoryId: (json['tariffCategoryId'] as num?)?.toInt(),
  volumetricWeight: (json['volumetricWeight'] as num?)?.toDouble(),
  weight: (json['weight'] as num?)?.toDouble(),
  width: (json['width'] as num?)?.toDouble(),
);

Map<String, dynamic> _$TariffModelToJson(TariffModel instance) =>
    <String, dynamic>{
      'additionalCostForFragileCargo': instance.additionalCostForFragileCargo,
      'costPriceOfAirShipment': instance.costPriceOfAirShipment,
      'createdAt': instance.createdAt,
      'deletedAt': instance.deletedAt,
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
      key: json['key'] as String,
      name: json['name'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String?,
      id: (json['id'] as num?)?.toInt(),
      sortIndex: (json['sortIndex'] as num?)?.toInt(),
      tariffs: (json['tariffs'] as List<dynamic>?)
          ?.map((e) => TariffModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TariffCategoryModelToJson(
  TariffCategoryModel instance,
) => <String, dynamic>{
  'active': instance.active,
  'createdAt': instance.createdAt,
  'deletedAt': instance.deletedAt,
  'id': instance.id,
  'key': instance.key,
  'name': instance.name,
  'sortIndex': instance.sortIndex,
  'tariffs': instance.tariffs,
  'updatedAt': instance.updatedAt,
};

TariffCategoriesApiResponse _$TariffCategoriesApiResponseFromJson(
  Map<String, dynamic> json,
) => TariffCategoriesApiResponse(
  data: (json['data'] as List<dynamic>)
      .map((e) => TariffCategoryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TariffCategoriesApiResponseToJson(
  TariffCategoriesApiResponse instance,
) => <String, dynamic>{'data': instance.data};

CreateTariffRequest _$CreateTariffRequestFromJson(
  Map<String, dynamic> json,
) => CreateTariffRequest(
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
  CreateTariffRequest instance,
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

CreateTariffResponse _$CreateTariffResponseFromJson(
  Map<String, dynamic> json,
) => CreateTariffResponse(
  id: (json['id'] as num).toInt(),
  message: json['message'] as String,
  success: json['success'] as bool,
);

Map<String, dynamic> _$CreateTariffResponseToJson(
  CreateTariffResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'message': instance.message,
  'success': instance.success,
};
