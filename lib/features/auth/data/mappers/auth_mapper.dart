import 'package:fly_cargo/features/auth/data/models/sign_code_response.dart';
import 'package:fly_cargo/features/auth/data/models/user_profile.dart';
import 'package:fly_cargo/features/auth/domain/entities/sign_code_result_entity.dart';
import 'package:fly_cargo/features/auth/domain/entities/user_profile_entity.dart';

extension UserProfileMapper on UserProfile {
  UserProfileEntity toEntity() {
    return UserProfileEntity(
      id: id,
      name: name,
      email: email,
      emailVerified: emailVerified,
      createdAt: createdAt,
      updatedAt: updatedAt,
      phoneNumber: phoneNumber,
      phoneNumberVerified: phoneNumberVerified,
      role: role,
      banned: banned,
      image: image,
      banReason: banReason,
      banExpires: banExpires,
      lang: lang,
    );
  }
}

extension SignCodeResponseMapper on SignCodeResponse {
  SignCodeResultEntity toEntity() {
    return SignCodeResultEntity(
      success: success,
      accessToken: accessToken,
      refreshToken: refreshToken,
      userId: userId,
    );
  }
}
