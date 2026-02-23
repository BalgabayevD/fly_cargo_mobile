// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShiftEntity _$ShiftEntityFromJson(Map<String, dynamic> json) => _ShiftEntity(
  isActive: json['isActive'] as bool,
  openedAt: json['openedAt'] as String?,
  closedAt: json['closedAt'] as String?,
);

Map<String, dynamic> _$ShiftEntityToJson(_ShiftEntity instance) =>
    <String, dynamic>{
      'isActive': instance.isActive,
      'openedAt': instance.openedAt,
      'closedAt': instance.closedAt,
    };
