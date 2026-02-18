import 'package:fly_cargo/features/auth/domain/repositories/authorization_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConfirmOtpUseCase {
  final AuthorizationRepository _repository;

  const ConfirmOtpUseCase(this._repository);

  Future<String?> call(String phoneNumber, String code) async {
    return _repository.confirmOTP(phoneNumber, code);
  }
}
