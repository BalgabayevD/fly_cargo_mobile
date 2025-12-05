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

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  emailVerified: json['emailVerified'] as bool,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  phoneNumber: json['phoneNumber'] as String,
  phoneNumberVerified: json['phoneNumberVerified'] as bool,
  role: json['role'] as String,
  banned: json['banned'] as bool,
  image: json['image'] as String?,
  banReason: json['banReason'] as String?,
  banExpires: json['banExpires'] as String?,
  lang: json['lang'] as String?,
);

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'emailVerified': instance.emailVerified,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'phoneNumber': instance.phoneNumber,
      'phoneNumberVerified': instance.phoneNumberVerified,
      'role': instance.role,
      'banned': instance.banned,
      'banReason': instance.banReason,
      'banExpires': instance.banExpires,
      'lang': instance.lang,
    };

UserProfileResponse _$UserProfileResponseFromJson(Map<String, dynamic> json) =>
    UserProfileResponse(
      data: UserProfile.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileResponseToJson(
  UserProfileResponse instance,
) => <String, dynamic>{'data': instance.data};
