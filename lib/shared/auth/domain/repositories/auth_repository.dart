import 'package:flutter_better_auth/core/api/default/sign_up/models/sign_up_response/sign_up_response.dart';
import 'package:flutter_better_auth/core/api/models/session/session_response.dart';
import 'package:flutter_better_auth/plugins/phone/models/send_otp/send_otp_response.dart';
import 'package:fly_cargo/shared/auth/data/models/sign_code_response.dart';
import 'package:fly_cargo/shared/auth/data/models/user_profile.dart';
abstract class AuthRepository {
  Future<SendOTPResponse?> signIn(String phoneNumber);
  Future<SignUpResponse?> signCode({
    required String phoneNumber,
    required String code,
  });
  Future<SessionResponse?> getSessionStatus();
  Future<SignCodeResponse> refreshToken();
  Future<void> signOut();
  Future<bool> isAuthenticated();
  Future<String?> getCurrentToken();
  Future<UserProfile> getUserProfile();
}
