import 'package:flutter_better_auth/core/api/default/sign_up/models/sign_up_response/sign_up_response.dart';
import 'package:flutter_better_auth/core/api/models/session/session_response.dart';
import 'package:flutter_better_auth/plugins/phone/models/send_otp/send_otp_response.dart';
import 'package:fly_cargo/features/auth/domain/entities/sign_code_result_entity.dart';
import 'package:fly_cargo/features/auth/domain/entities/user_profile_entity.dart';

abstract class AuthRepository {
  Future<SendOTPResponse?> signIn(String phoneNumber);
  Future<SignUpResponse?> signCode({
    required String phoneNumber,
    required String code,
  });
  Future<SessionResponse?> getSessionStatus();
  Future<SignCodeResultEntity> refreshToken();
  Future<void> signOut();
  Future<bool> isAuthenticated();
  Future<String?> getCurrentToken();
  Future<UserProfileEntity> getUserProfile();
}
