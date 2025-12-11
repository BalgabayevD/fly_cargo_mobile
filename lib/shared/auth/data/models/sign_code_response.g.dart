// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_code_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignCodeResponse _$SignCodeResponseFromJson(Map<String, dynamic> json) =>
    SignCodeResponse(
      success: json['success'] as bool,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$SignCodeResponseToJson(SignCodeResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'userId': instance.userId,
      'success': instance.success,
    };
