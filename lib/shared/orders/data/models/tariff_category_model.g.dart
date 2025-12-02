// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tariff_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TariffCategoryModel _$TariffCategoryModelFromJson(Map<String, dynamic> json) =>
    _TariffCategoryModel(
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      name: json['name'] as String,
      key: json['key'] as String,
      active: json['active'] as bool,
      id: (json['id'] as num?)?.toInt(),
      deletedAt: json['deletedAt'] as String?,
      sortIndex: (json['sort_index'] as num?)?.toInt(),
      tariffs: (json['tariffs'] as List<dynamic>?)
          ?.map((e) => TariffModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TariffCategoryModelToJson(
  _TariffCategoryModel instance,
) => <String, dynamic>{
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'name': instance.name,
  'key': instance.key,
  'active': instance.active,
  'id': instance.id,
  'deletedAt': instance.deletedAt,
  'sort_index': instance.sortIndex,
  'tariffs': instance.tariffs,
};
