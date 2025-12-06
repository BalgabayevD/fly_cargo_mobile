// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
