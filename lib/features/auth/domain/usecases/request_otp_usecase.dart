import 'package:fly_cargo/features/auth/domain/repositories/authorization_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RequestOtpUseCase {
  final AuthorizationRepository _repository;

  const RequestOtpUseCase(this._repository);

  Future<void> call(String phoneNumber) async {
    return _repository.requestOTP(phoneNumber);
  }
}
