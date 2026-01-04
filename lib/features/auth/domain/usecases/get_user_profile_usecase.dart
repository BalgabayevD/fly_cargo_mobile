import 'package:fly_cargo/features/auth/domain/entities/user_profile_entity.dart';
import 'package:fly_cargo/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserProfileUseCase {
  final AuthRepository _authRepository;

  GetUserProfileUseCase(this._authRepository);

  Future<UserProfileEntity> call() async {
    return await _authRepository.getUserProfile();
  }
}
