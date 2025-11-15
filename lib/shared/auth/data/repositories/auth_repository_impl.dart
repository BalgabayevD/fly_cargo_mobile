import 'package:flutter_better_auth/flutter_better_auth.dart';
import 'package:flutter_better_auth/plugins/jwt/jwt_extension.dart';
import 'package:flutter_better_auth/plugins/phone/models/phone_body.dart';
import 'package:flutter_better_auth/plugins/phone/models/send_otp/send_otp_response.dart';
import 'package:flutter_better_auth/plugins/phone/models/verify/verify_phone_body.dart';
import 'package:flutter_better_auth/plugins/phone/phone_extension.dart';
import 'package:fly_cargo/shared/auth/data/auth_remote_source.dart';
import 'package:fly_cargo/shared/auth/data/models/auth_models.dart';
import 'package:fly_cargo/shared/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource _remoteSource;
  AuthRepositoryImpl(this._remoteSource);
  @override
  Future<SendOTPResponse?> signIn(String phoneNumber) async {
    try {
      final response = await FlutterBetterAuth.client.phone.sendOtp(
        body: PhoneBody(phoneNumber: phoneNumber),
      );
      return response.data;
    } catch (e) {
      throw AuthException('Ошибка при отправке кода: $e');
    }
  }
  @override
  Future<SignUpResponse?> signCode({
    required String phoneNumber,
    required String code,
  }) async {
    try {
      final response = await FlutterBetterAuth.client.phone.verify(
        body: VerifyPhoneBody(phoneNumber: phoneNumber, code: code),
      );
      return response.data;
    } catch (e) {
      throw AuthException('Ошибка при подтверждении кода: $e');
    }
  }
  @override
  Future<SessionResponse?> getSessionStatus() async {
    try {
      final response = await FlutterBetterAuth.client.getSession();
      return response.data;
    } catch (e) {
      throw AuthException('Ошибка при проверке сессии: $e');
    }
  }
  @override
  Future<void> signOut() async {
    try {
      await FlutterBetterAuth.client.signOut();
    } catch (e) {
      throw AuthException('Ошибка при выходе из системы: $e');
    }
  }
  @override
  Future<bool> isAuthenticated() async {
    try {
      final session = await FlutterBetterAuth.client.getSession();
      return session.data?.session != null;
    } catch (e) {
      return false;
    }
  }
  @override
  Future<String?> getCurrentToken() async {
    try {
      final token = await FlutterBetterAuth.client.jwt.token();
      return token.data?.token;
    } catch (e) {
      throw AuthException('Ошибка при получении токена: $e');
    }
  }
  @override
  Future<SignCodeResponse> refreshToken() {
    throw UnimplementedError();
  }
  @override
  Future<UserProfile> getUserProfile() async {
    try {
      final response = await _remoteSource.getUserProfile();
      return response.data;
    } catch (e) {
      throw AuthException('Ошибка при получении профиля: $e');
    }
  }
}
class AuthException implements Exception {
  final String message;
  const AuthException(this.message);
  @override
  String toString() => 'AuthException: $message';
}
