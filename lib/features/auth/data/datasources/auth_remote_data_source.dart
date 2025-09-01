import '../../../../core/errors/exceptions.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(
    String email,
    String password,
    String name,
    String phone,
  );
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final String baseUrl;

  AuthRemoteDataSourceImpl({required this.baseUrl});

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      if (email == 'test@test.com' && password == 'password') {
        return UserModel(
          id: '1',
          email: 'test@test.com',
          name: 'Тестовый пользователь',
          phone: '+7 777 777 77 77',
          createdAt: DateTime.now(),
          isVerified: true,
        );
      } else {
        throw AuthException('Неверный email или пароль');
      }
    } catch (e) {
      throw ServerException('Ошибка при входе: $e');
    }
  }

  @override
  Future<UserModel> register(
    String email,
    String password,
    String name,
    String phone,
  ) async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      return UserModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        email: email,
        name: name,
        phone: phone,
        createdAt: DateTime.now(),
        isVerified: false,
      );
    } catch (e) {
      throw ServerException('Ошибка при регистрации: $e');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      throw ServerException('Ошибка при выходе: $e');
    }
  }
}
