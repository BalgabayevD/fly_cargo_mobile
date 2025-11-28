// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tariff_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TariffCategoryModel _$TariffCategoryModelFromJson(Map<String, dynamic> json) =>
    _TariffCategoryModel(
      id: (json['id'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String?,
      name: json['name'] as String,
      key: json['key'] as String,
      sortIndex: (json['sortIndex'] as num?)?.toInt(),
      active: json['active'] as bool,
      tariffs: (json['tariffs'] as List<dynamic>?)
          ?.map((e) => TariffModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TariffCategoryModelToJson(
  _TariffCategoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'deletedAt': instance.deletedAt,
  'name': instance.name,
  'key': instance.key,
  'sortIndex': instance.sortIndex,
  'active': instance.active,
  'tariffs': instance.tariffs,
};
