import 'package:fly_cargo/shared/auth/domain/entities/user_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile {
  final String id;
  final String name;
  final String email;
  final bool emailVerified;
  final String? image;
  final String createdAt;
  final String updatedAt;
  final String phoneNumber;
  final bool phoneNumberVerified;
  final UserType role;
  final bool banned;
  final String? banReason;
  final String? banExpires;
  final String? lang;

  const UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerified,
    required this.createdAt,
    required this.updatedAt,
    required this.phoneNumber,
    required this.phoneNumberVerified,
    required this.role,
    required this.banned,
    this.image,
    this.banReason,
    this.banExpires,
    this.lang,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
