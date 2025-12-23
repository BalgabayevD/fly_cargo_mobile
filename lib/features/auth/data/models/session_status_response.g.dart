// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionStatusResponse _$SessionStatusResponseFromJson(
  Map<String, dynamic> json,
) => SessionStatusResponse(
  exists: json['exists'] as bool,
  userId: json['userId'] as String?,
  expiresAt: json['expiresAt'] == null
      ? null
      : DateTime.parse(json['expiresAt'] as String),
);

Map<String, dynamic> _$SessionStatusResponseToJson(
  SessionStatusResponse instance,
) => <String, dynamic>{
  'exists': instance.exists,
  'userId': instance.userId,
  'expiresAt': instance.expiresAt?.toIso8601String(),
};
