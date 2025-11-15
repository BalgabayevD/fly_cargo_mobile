part of 'auth_models.dart';





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

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
  id: (json['id'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  deletedAt: json['deletedAt'] as String?,
  uuid: json['uuid'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  middleName: json['middleName'] as String,
  birthDay: json['birthDay'] as String,
  photo: json['photo'] as String,
  city: json['city'] as String,
  type: json['type'] as String,
  iin: json['iin'] as String,
  bin: json['bin'] as String,
  access: json['access'],
  role: json['role'] as String,
);

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'uuid': instance.uuid,
      'email': instance.email,
      'phone': instance.phone,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'birthDay': instance.birthDay,
      'photo': instance.photo,
      'city': instance.city,
      'type': instance.type,
      'iin': instance.iin,
      'bin': instance.bin,
      'access': instance.access,
      'role': instance.role,
    };

UserProfileResponse _$UserProfileResponseFromJson(Map<String, dynamic> json) =>
    UserProfileResponse(
      data: UserProfile.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileResponseToJson(
  UserProfileResponse instance,
) => <String, dynamic>{'data': instance.data};
