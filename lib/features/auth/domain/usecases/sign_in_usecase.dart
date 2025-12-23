import 'package:flutter_better_auth/plugins/phone/models/send_otp/send_otp_response.dart';
import 'package:fly_cargo/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class SignInUseCase {
  final AuthRepository _authRepository;
  SignInUseCase(this._authRepository);
  Future<SendOTPResponse?> call(String phoneNumber) async {
    if (phoneNumber.isEmpty) {
      throw ArgumentError('Номер телефона не может быть пустым');
    }
    if (!_isValidPhoneNumber(phoneNumber)) {
      throw ArgumentError('Неверный формат номера телефона');
    }
    return await _authRepository.signIn(phoneNumber);
  }
  bool _isValidPhoneNumber(String phoneNumber) {
    final phoneRegex = RegExp(r'^\+\d{10,15}$');
    return phoneRegex.hasMatch(phoneNumber);
  }
}
