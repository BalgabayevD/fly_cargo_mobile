import 'package:fly_cargo/shared/auth/data/models/auth_models.dart';
import 'package:fly_cargo/shared/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserProfileUseCase {
  final AuthRepository _authRepository;

  GetUserProfileUseCase(this._authRepository);

  Future<UserProfile> call() async {
    return await _authRepository.getUserProfile();
  }
}
