import 'package:fly_cargo/features/auth/domain/entities/user_session_entity.dart';
import 'package:fly_cargo/features/auth/domain/repositories/authorization_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSessionUseCase {
  final AuthorizationRepository _repository;

  const GetSessionUseCase(this._repository);

  Future<UserSessionInfoEntity?> call() async {
    try {
      var cachedSession = await _repository.getCachedSession();

      if (cachedSession != null) {
        _refreshSessionInBackground();
        return cachedSession;
      }

      final remoteSession = await _repository.getRemoteSession();
      if (remoteSession != null) {
        await _repository.saveSession(remoteSession);
      } else {
      }

      return remoteSession;
    } catch (e) {
      return null;
    }
  }

  void _refreshSessionInBackground() async {
    try {
      final remoteSession = await _repository.getRemoteSession();
      if (remoteSession != null) {
        await _repository.saveSession(remoteSession);
      }
    } catch (_) {
      // Silent fail
    }
  }
}
