import 'package:fly_cargo/shared/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthStatusUseCase {
  final AuthRepository _authRepository;

  AuthStatusUseCase(this._authRepository);

  /// Проверяет, авторизован ли пользователь
  Future<bool> isAuthenticated() async {
    return await _authRepository.isAuthenticated();
  }

  /// Получает текущий токен пользователя
  Future<String?> getCurrentToken() async {
    return await _authRepository.getCurrentToken();
  }

  /// Получает статус сессии через API
  Future<Map<String, dynamic>> getSessionStatus() async {
    try {
      // Используем реальный API вызов для проверки статуса сессии
      final sessionResponse = await _authRepository.getSessionStatus();

      return {
        'isAuthenticated': sessionResponse.exists,
        'hasToken': sessionResponse.exists,
        'tokenLength': sessionResponse.exists
            ? 100
            : 0, // Примерная длина токена
        'userId': sessionResponse.userId,
        'expiresAt': sessionResponse.expiresAt?.toIso8601String(),
      };
    } catch (e) {
      // Если API вызов не удался, возвращаем локальное состояние
      final isAuth = await isAuthenticated();
      final token = await getCurrentToken();

      return {
        'isAuthenticated': isAuth,
        'hasToken': token != null,
        'tokenLength': token?.length ?? 0,
        'error': e.toString(),
      };
    }
  }
}
