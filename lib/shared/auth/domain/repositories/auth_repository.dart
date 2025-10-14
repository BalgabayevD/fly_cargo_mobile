import 'package:fly_cargo/shared/auth/data/models/auth_models.dart';

/// Абстракция для репозитория аутентификации
abstract class AuthRepository {
  /// Отправка номера телефона для получения кода
  Future<SignInResponse> signIn(String phoneNumber);

  /// Подтверждение кода и вход в систему
  Future<SignCodeResponse> signCode({
    required String deviceId,
    required String preAuthSessionId,
    required String code,
  });

  /// Проверка статуса сессии
  Future<SessionStatusResponse> getSessionStatus();

  /// Обновление токена
  Future<SignCodeResponse> refreshToken();

  /// Выход из системы
  Future<void> signOut();

  /// Проверка, авторизован ли пользователь
  Future<bool> isAuthenticated();

  /// Получение текущего токена
  Future<String?> getCurrentToken();
}
