import 'package:fly_cargo/core/network/domain/behaviors/get_sid_behavior.dart';
import 'package:fly_cargo/shared/auth/data/auth_remote_source.dart';
import 'package:fly_cargo/shared/auth/data/models/auth_models.dart';
import 'package:fly_cargo/shared/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supertokens_flutter/supertokens.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource _remoteSource;
  final GetSessionIdBehavior _sessionBehavior;

  AuthRepositoryImpl(
    this._remoteSource,
    @Named('super-tokens-session-behavior') this._sessionBehavior,
  );

  @override
  Future<SignInResponse> signIn(String phoneNumber) async {
    try {
      final request = SignInRequest(phoneNumber: phoneNumber);
      final response = await _remoteSource.signIn(request);
      return response;
    } catch (e) {
      throw AuthException('Ошибка при отправке кода: $e');
    }
  }

  @override
  Future<SignCodeResponse> signCode({
    required String deviceId,
    required String preAuthSessionId,
    required String code,
  }) async {
    try {
      final request = SignCodeRequest(
        deviceId: deviceId,
        preAuthSessionId: preAuthSessionId,
        userInputCode: code,
      );
      final response = await _remoteSource.signCode(request);

      if (response.success) {
        // Здесь можно сохранить токены в SuperTokens
        // SuperTokens уже обрабатывает это автоматически
      }

      return response;
    } catch (e) {
      throw AuthException('Ошибка при подтверждении кода: $e');
    }
  }

  @override
  Future<SessionStatusResponse> getSessionStatus() async {
    try {
      final response = await _remoteSource.getSessionStatus();
      return response;
    } catch (e) {
      throw AuthException('Ошибка при проверке сессии: $e');
    }
  }

  @override
  Future<SignCodeResponse> refreshToken() async {
    try {
      final response = await _remoteSource.refreshToken();
      return response;
    } catch (e) {
      throw AuthException('Ошибка при обновлении токена: $e');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _remoteSource.signOut();
      // SuperTokens автоматически очистит сессию
    } catch (e) {
      throw AuthException('Ошибка при выходе из системы: $e');
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    try {
      return await SuperTokens.doesSessionExist();
    } catch (e) {
      return false;
    }
  }

  @override
  Future<String?> getCurrentToken() async {
    try {
      return await _sessionBehavior.getSessionId();
    } catch (e) {
      return null;
    }
  }
}

/// Исключение для ошибок аутентификации
class AuthException implements Exception {
  final String message;

  const AuthException(this.message);

  @override
  String toString() => 'AuthException: $message';
}
