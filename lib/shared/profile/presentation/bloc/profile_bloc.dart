import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/shared/auth/domain/usecases/get_user_profile_usecase.dart';
import 'package:fly_cargo/shared/profile/presentation/bloc/profile_event.dart';
import 'package:fly_cargo/shared/profile/presentation/bloc/profile_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserProfileUseCase _getUserProfileUseCase;

  ProfileBloc(this._getUserProfileUseCase)
    : super(const ProfileState.initial()) {
    on<LoadProfile>(_onLoadProfile);
  }

  Future<void> _onLoadProfile(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());

    try {
      final profile = await _getUserProfileUseCase();

      final createdAt = DateTime.parse(profile.createdAt);
      final now = DateTime.now();
      final difference = now.difference(createdAt);
      final daysSinceCreated = difference.inDays;

      emit(
        ProfileState.loaded(
          profile: profile,
          daysSinceCreated: daysSinceCreated,
        ),
      );
    } catch (e) {
      emit(
        ProfileState.error(
          message: 'Не удалось загрузить профиль: ${e.toString()}',
        ),
      );
    }
  }
}
