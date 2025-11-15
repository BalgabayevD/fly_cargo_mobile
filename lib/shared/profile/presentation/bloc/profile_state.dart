import 'package:fly_cargo/shared/auth/data/models/auth_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_state.freezed.dart';
@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileInitial;
  const factory ProfileState.loading() = ProfileLoading;
  const factory ProfileState.loaded({
    required UserProfile profile,
    required int daysSinceCreated,
  }) = ProfileLoaded;
  const factory ProfileState.error({required String message}) = ProfileError;
}
