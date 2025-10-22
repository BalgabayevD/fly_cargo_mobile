import 'package:fly_cargo/shared/auth/data/models/auth_models.dart';
import 'package:fly_cargo/shared/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignCodeUseCase {
  final AuthRepository _authRepository;

  SignCodeUseCase(this._authRepository);

  /// Подтверждает код и выполняет вход в систему
  Future<SignCodeResponse> call({
    required String phoneNumber,
    required String code,
  }) async {
    if (phoneNumber.isEmpty) {
      throw ArgumentError('Номер телефона не может быть пустым');
    }

    if (code.isEmpty) {
      throw ArgumentError('Код подтверждения не может быть пустым');
    }

    // Валидация кода (обычно 4-6 цифр)
    if (!_isValidCode(code)) {
      throw ArgumentError('Неверный формат кода подтверждения');
    }

    final response = await _authRepository.signCode(
      phoneNumber: phoneNumber,
      code: code,
    );

    if (response == null) {
      throw Exception('Ошибка подтверждения кода');
    }

    // Преобразуем SignUpResponse в SignCodeResponse
    return SignCodeResponse(
      accessToken: response.user.id, // или другое поле из response
      refreshToken: null,
      userId: response.user.id,
      success: true,
    );
  }

  /// Проверяет валидность кода подтверждения
  bool _isValidCode(String code) {
    // Код должен содержать только цифры и быть длиной 4-6 символов
    final codeRegex = RegExp(r'^\d{4,6}$');
    return codeRegex.hasMatch(code);
  }
}
