import 'package:flutter_better_auth/core/api/models/session/session_response.dart';
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
  Future<SessionResponse?> getSessionStatus() async {
    return await _authRepository.getSessionStatus();
  }
}
