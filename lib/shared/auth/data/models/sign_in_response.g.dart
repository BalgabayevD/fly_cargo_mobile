// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
