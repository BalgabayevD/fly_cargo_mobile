import 'package:fly_cargo/features/auth/domain/entities/user_session_entity.dart';
import 'package:fly_cargo/features/auth/domain/repositories/authorization_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateProfileUseCase {
  final AuthorizationRepository _repository;

  const UpdateProfileUseCase(this._repository);

  Future<UserSessionInfoEntity?> call(String name) async {
    final isSuccess = await _repository.updateProfile(name);

    if (!isSuccess) {
      return null;
    }

    final session = await _repository.getRemoteSession();

    if (session != null) {
      await _repository.saveSession(session);
    }

    return session;
  }
}
