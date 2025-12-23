import 'package:fly_cargo/features/auth/data/models/user_profile.dart';
import 'package:fly_cargo/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetUserProfileUseCase {
  final AuthRepository _authRepository;
  GetUserProfileUseCase(this._authRepository);
  Future<UserProfile> call() async {
    return await _authRepository.getUserProfile();
  }
}
