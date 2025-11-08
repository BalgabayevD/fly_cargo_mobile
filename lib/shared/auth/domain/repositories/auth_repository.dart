import 'package:flutter_better_auth/core/api/default/sign_up/models/sign_up_response/sign_up_response.dart';
import 'package:flutter_better_auth/core/api/models/session/session_response.dart';
import 'package:flutter_better_auth/plugins/phone/models/send_otp/send_otp_response.dart';
import 'package:fly_cargo/shared/auth/data/models/auth_models.dart';

/// Абстракция для репозитория аутентификации
abstract class AuthRepository {
  /// Отправка номера телефона для получения кода
  Future<SendOTPResponse?> signIn(String phoneNumber);

  /// Подтверждение кода и вход в систему
  Future<SignUpResponse?> signCode({
    required String phoneNumber,
    required String code,
  });

  /// Проверка статуса сессии
  Future<SessionResponse?> getSessionStatus();

  /// Обновление токена
  Future<SignCodeResponse> refreshToken();

  /// Выход из системы
  Future<void> signOut();

  /// Проверка, авторизован ли пользователь
  Future<bool> isAuthenticated();

  /// Получение текущего токена
  Future<String?> getCurrentToken();

  /// Получение профиля пользователя
  Future<UserProfile> getUserProfile();
}
