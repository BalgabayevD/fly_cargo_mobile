import 'package:fly_cargo/features/auth/domain/repositories/authorization_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignOutUseCase {
  final AuthorizationRepository _repository;

  const SignOutUseCase(this._repository);

  Future<void> call() async {
    await _repository.signOut();
    await _repository.clearSession();
  }
}
