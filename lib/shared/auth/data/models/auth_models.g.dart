// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInRequest _$SignInRequestFromJson(Map<String, dynamic> json) =>
    SignInRequest(phoneNumber: json['phoneNumber'] as String);

Map<String, dynamic> _$SignInRequestToJson(SignInRequest instance) =>
    <String, dynamic>{'phoneNumber': instance.phoneNumber};

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) =>
    SignInResponse(
      deviceId: json['deviceId'] as String,
      preAuthSessionId: json['preAuthSessionId'] as String,
    );

Map<String, dynamic> _$SignInResponseToJson(SignInResponse instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'preAuthSessionId': instance.preAuthSessionId,
    };

SignCodeRequest _$SignCodeRequestFromJson(Map<String, dynamic> json) =>
    SignCodeRequest(
      deviceId: json['deviceId'] as String,
      preAuthSessionId: json['preAuthSessionId'] as String,
      userInputCode: json['userInputCode'] as String,
    );

Map<String, dynamic> _$SignCodeRequestToJson(SignCodeRequest instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'preAuthSessionId': instance.preAuthSessionId,
      'userInputCode': instance.userInputCode,
    };

SignCodeResponse _$SignCodeResponseFromJson(Map<String, dynamic> json) =>
    SignCodeResponse(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      userId: json['userId'] as String?,
      success: json['success'] as bool,
    );

Map<String, dynamic> _$SignCodeResponseToJson(SignCodeResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'userId': instance.userId,
      'success': instance.success,
    };

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
