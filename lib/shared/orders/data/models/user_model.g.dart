// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
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
  role: json['role'] as String,
  id: (json['id'] as num?)?.toInt(),
  deletedAt: json['deletedAt'] as String?,
  access: json['access'],
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
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
      'role': instance.role,
      'id': instance.id,
      'deletedAt': instance.deletedAt,
      'access': instance.access,
    };
