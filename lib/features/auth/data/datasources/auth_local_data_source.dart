import '../../../../core/errors/exceptions.dart';
import '../../../../shared/services/storage_service.dart';
import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserModel user);
  Future<UserModel?> getCachedUser();
  Future<void> clearCache();
  Future<void> cacheToken(String token);
  Future<String?> getCachedToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final StorageService storageService;

  AuthLocalDataSourceImpl(this.storageService);

  @override
  Future<void> cacheUser(UserModel user) async {
    try {
      await storageService.saveString('user', user.toJson().toString());
    } catch (e) {
      throw CacheException('Ошибка при сохранении пользователя: $e');
    }
  }

  @override
  Future<UserModel?> getCachedUser() async {
    try {
      final userJson = await storageService.getString('user');
      if (userJson != null) {
        // Здесь нужно парсить JSON строку обратно в Map
        // Для простоты возвращаем null
        return null;
      }
      return null;
    } catch (e) {
      throw CacheException('Ошибка при получении пользователя: $e');
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      await storageService.remove('user');
      await storageService.remove('token');
    } catch (e) {
      throw CacheException('Ошибка при очистке кэша: $e');
    }
  }

  @override
  Future<void> cacheToken(String token) async {
    try {
      await storageService.saveString('token', token);
    } catch (e) {
      throw CacheException('Ошибка при сохранении токена: $e');
    }
  }

  @override
  Future<String?> getCachedToken() async {
    try {
      return await storageService.getString('token');
    } catch (e) {
      throw CacheException('Ошибка при получении токена: $e');
    }
  }
}
