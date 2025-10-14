import 'package:fly_cargo/shared/auth/data/models/auth_models.dart';
import 'package:fly_cargo/shared/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignCodeUseCase {
  final AuthRepository _authRepository;

  SignCodeUseCase(this._authRepository);

  /// Подтверждает код и выполняет вход в систему
  Future<SignCodeResponse> call({
    required String deviceId,
    required String preAuthSessionId,
    required String code,
  }) async {
    if (deviceId.isEmpty) {
      throw ArgumentError('Device ID не может быть пустым');
    }

    if (preAuthSessionId.isEmpty) {
      throw ArgumentError('PreAuth Session ID не может быть пустым');
    }

    if (code.isEmpty) {
      throw ArgumentError('Код подтверждения не может быть пустым');
    }

    // Валидация кода (обычно 4-6 цифр)
    if (!_isValidCode(code)) {
      throw ArgumentError('Неверный формат кода подтверждения');
    }

    return await _authRepository.signCode(
      deviceId: deviceId,
      preAuthSessionId: preAuthSessionId,
      code: code,
    );
  }

  /// Проверяет валидность кода подтверждения
  bool _isValidCode(String code) {
    // Код должен содержать только цифры и быть длиной 4-6 символов
    final codeRegex = RegExp(r'^\d{4,6}$');
    return codeRegex.hasMatch(code);
  }
}
