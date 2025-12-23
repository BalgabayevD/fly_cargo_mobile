// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PackageModel _$PackageModelFromJson(Map<String, dynamic> json) =>
    _PackageModel(
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      isActive: json['isActive'] as bool,
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      id: (json['id'] as num?)?.toInt(),
      deletedAt: json['deletedAt'] as String?,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PackageModelToJson(_PackageModel instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isActive': instance.isActive,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'id': instance.id,
      'deletedAt': instance.deletedAt,
      'price': instance.price,
    };
