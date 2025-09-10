import 'package:supertokens_flutter/supertokens.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  /// Проверяет, есть ли активная сессия пользователя
  Future<bool> isAuthenticated() async {
    try {
      return await SuperTokens.doesSessionExist();
    } catch (e) {
      print('Ошибка проверки сессии: $e');
      return false;
    }
  }

  /// Получает информацию о текущем пользователе
  Future<String?> getCurrentUser() async {
    try {
      if (await isAuthenticated()) {
        return await SuperTokens.getUserId();
      }
      return null;
    } catch (e) {
      print('Ошибка получения пользователя: $e');
      return null;
    }
  }

  /// Выход из системы
  Future<void> signOut() async {
    try {
      await SuperTokens.signOut();
    } catch (e) {
      print('Ошибка выхода: $e');
    }
  }
}
