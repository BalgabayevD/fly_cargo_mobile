import 'package:flutter_better_auth/core/api/models/session/session_response.dart';
import 'package:fly_cargo/features/auth/domain/entities/user_profile_entity.dart';
import 'package:fly_cargo/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthStatusUseCase {
  final AuthRepository _authRepository;

  AuthStatusUseCase(this._authRepository);

  Future<bool> isAuthenticated() async {
    return await _authRepository.isAuthenticated();
  }

  Future<String?> getCurrentToken() async {
    return await _authRepository.getCurrentToken();
  }

  Future<SessionResponse?> getSessionStatus() async {
    return await _authRepository.getSessionStatus();
  }

  Future<UserProfileEntity> getUserProfile() async {
    return await _authRepository.getUserProfile();
  }
}
