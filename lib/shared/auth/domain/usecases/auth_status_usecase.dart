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

  /// Получает статус сессии
  Future<Map<String, dynamic>> getSessionStatus() async {
    final isAuth = await isAuthenticated();
    final token = await getCurrentToken();

    return {
      'isAuthenticated': isAuth,
      'hasToken': token != null,
      'tokenLength': token?.length ?? 0,
    };
  }
}
