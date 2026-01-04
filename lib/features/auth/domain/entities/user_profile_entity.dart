import 'package:fly_cargo/features/auth/domain/entities/user_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_entity.freezed.dart';

@freezed
sealed class UserProfileEntity with _$UserProfileEntity {
  const factory UserProfileEntity({
    required String id,
    required String name,
    required String email,
    required bool emailVerified,
    required String createdAt,
    required String updatedAt,
    required String phoneNumber,
    required bool phoneNumberVerified,
    required UserType role,
    required bool banned,
    String? image,
    String? banReason,
    String? banExpires,
    String? lang,
  }) = _UserProfileEntity;
}
