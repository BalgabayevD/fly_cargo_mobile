import 'package:fly_cargo/shared/auth/data/models/auth_models.dart';
import 'package:fly_cargo/shared/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInUseCase {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  /// Выполняет вход в систему по номеру телефона
  Future<SignInResponse> call(String phoneNumber) async {
    if (phoneNumber.isEmpty) {
      throw ArgumentError('Номер телефона не может быть пустым');
    }

    // Валидация номера телефона (можно добавить более сложную логику)
    if (!_isValidPhoneNumber(phoneNumber)) {
      throw ArgumentError('Неверный формат номера телефона');
    }

    return await _authRepository.signIn(phoneNumber);
  }

  /// Проверяет валидность номера телефона
  bool _isValidPhoneNumber(String phoneNumber) {
    // Простая проверка - начинается с + и содержит только цифры
    final phoneRegex = RegExp(r'^\+\d{10,15}$');
    return phoneRegex.hasMatch(phoneNumber);
  }
}
