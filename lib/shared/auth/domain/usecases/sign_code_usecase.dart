import 'package:fly_cargo/shared/auth/data/models/auth_models.dart';
import 'package:fly_cargo/shared/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignCodeUseCase {
  final AuthRepository _authRepository;

  SignCodeUseCase(this._authRepository);

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

    return SignCodeResponse(
      accessToken: response.user.id,
      refreshToken: null,
      userId: response.user.id,
      success: true,
    );
  }

  bool _isValidCode(String code) {
    final codeRegex = RegExp(r'^\d{4,6}$');
    return codeRegex.hasMatch(code);
  }
}
