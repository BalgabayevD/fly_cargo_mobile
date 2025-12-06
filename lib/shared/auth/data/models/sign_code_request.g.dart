// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_code_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
