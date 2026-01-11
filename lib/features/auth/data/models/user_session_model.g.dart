// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSessionInfoModel _$UserSessionInfoModelFromJson(
  Map<String, dynamic> json,
) => _UserSessionInfoModel(
  session: UserSessionModel.fromJson(json['session'] as Map<String, dynamic>),
  user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
  accessToken: json['accessToken'] as String?,
);

Map<String, dynamic> _$UserSessionInfoModelToJson(
  _UserSessionInfoModel instance,
) => <String, dynamic>{
  'session': instance.session,
  'user': instance.user,
  'accessToken': instance.accessToken,
};

_UserSessionModel _$UserSessionModelFromJson(Map<String, dynamic> json) =>
    _UserSessionModel(
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      expiresAt: json['expiresAt'] as String,
      token: json['token'] as String,
      ipAddress: json['ipAddress'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$UserSessionModelToJson(_UserSessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'expiresAt': instance.expiresAt,
      'token': instance.token,
      'ipAddress': instance.ipAddress,
      'userId': instance.userId,
    };

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  name: json['name'] as String?,
  email: json['email'] as String?,
  emailVerified: json['emailVerified'] as bool,
  image: json['image'] as String?,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  phoneNumber: json['phoneNumber'] as String?,
  phoneNumberVerified: json['phoneNumberVerified'] as bool,
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  banned: json['banned'] as bool,
  banReason: json['banReason'] as String?,
  banExpires: json['banExpires'] as String?,
  lang: json['lang'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  middleName: json['middleName'] as String?,
  birthDay: json['birthDay'] as String?,
  city: json['city'] as String?,
  type: json['type'] as String?,
  iin: json['iin'] as String?,
  bin: json['bin'] as String?,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
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
      'role': _$UserRoleEnumMap[instance.role]!,
      'banned': instance.banned,
      'banReason': instance.banReason,
      'banExpires': instance.banExpires,
      'lang': instance.lang,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'birthDay': instance.birthDay,
      'city': instance.city,
      'type': instance.type,
      'iin': instance.iin,
      'bin': instance.bin,
    };

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.courier: 'courier',
  UserRole.operator: 'operator',
  UserRole.user: 'user',
};
