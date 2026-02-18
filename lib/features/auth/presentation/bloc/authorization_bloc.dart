import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/requestable.dart';
import 'package:fly_cargo/features/auth/domain/entities/user_session_entity.dart';
import 'package:fly_cargo/features/auth/domain/usecases/confirm_otp_usecase.dart';
import 'package:fly_cargo/features/auth/domain/usecases/get_session_usecase.dart';
import 'package:fly_cargo/features/auth/domain/usecases/request_otp_usecase.dart';
import 'package:fly_cargo/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:fly_cargo/features/auth/domain/usecases/update_profile_usecase.dart';
import 'package:fly_cargo/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:fly_cargo/shared/utils/helper.dart';
import 'package:injectable/injectable.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

@injectable
class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  final GetSessionUseCase _getSessionUseCase;
  final RequestOtpUseCase _requestOtpUseCase;
  final ConfirmOtpUseCase _confirmOtpUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  final SignOutUseCase _signOutUseCase;
  final Configuration _configuration;
  final Requestable _requestable;

  AuthorizationBloc({
    required GetSessionUseCase getSessionUseCase,
    required RequestOtpUseCase requestOtpUseCase,
    required ConfirmOtpUseCase confirmOtpUseCase,
    required UpdateProfileUseCase updateProfileUseCase,
    required SignOutUseCase signOutUseCase,
    required Configuration configuration,
    required Requestable requestable,
  })  : _getSessionUseCase = getSessionUseCase,
        _requestOtpUseCase = requestOtpUseCase,
        _confirmOtpUseCase = confirmOtpUseCase,
        _updateProfileUseCase = updateProfileUseCase,
        _signOutUseCase = signOutUseCase,
        _configuration = configuration,
        _requestable = requestable,
        super(
          InitialAuthorizationState(
            configuration.getInitialPath ?? OnboardingScreen.location(),
          ),
        ) {
    on<AuthorizationGetSessionEvent>(_getSession);
    on<AuthorizationRequestOtpEvent>(_requestOtp);
    on<AuthorizationConfirmOtpEvent>(_confirmOtp);
    on<AuthorizationSignOutEvent>(_signOut);
    on<AuthorizationUpdateProfileEvent>(_update);
  }

  FutureOr<void> _update(
    AuthorizationUpdateProfileEvent event,
    Emitter<AuthorizationState> emit,
  ) async {
    try {
      final session = await _updateProfileUseCase(event.name);

      if (session != null) {
        emit(AuthorizedState(session));
      }
    } catch (_) {}
  }

  FutureOr<void> _getSession(
    AuthorizationGetSessionEvent event,
    Emitter<AuthorizationState> emit,
  ) async {
    try {
      final session = await _getSessionUseCase();

      if (session != null) {
        emit(AuthorizedState(session));
      } else {
        emit(UnauthorizedState());
      }
    } catch (_) {
      emit(UnauthorizedState());
    }
  }

  FutureOr<void> _requestOtp(
    AuthorizationRequestOtpEvent event,
    Emitter<AuthorizationState> emit,
  ) async {
    try {
      emit(AuthorizationOtpRequestingState(event.phoneNumber));

      await _requestOtpUseCase(unmaskPhone(event.phoneNumber));

      emit(AuthorizationOtpRequestedState(event.phoneNumber));
    } catch (_) {
      emit(AuthorizationOtpRequestFailureState(event.phoneNumber));
    }
  }

  FutureOr<void> _confirmOtp(
    AuthorizationConfirmOtpEvent event,
    Emitter<AuthorizationState> emit,
  ) async {
    try {
      emit(AuthorizationOtpConfirmingState(event.phoneNumber, event.code));

      final token = await _confirmOtpUseCase(
        unmaskPhone(event.phoneNumber),
        event.code,
      );

      if (token != null) {
        await _configuration.package.setAccessToken(token);
        _requestable.addAuthorizationHeader(token);
      }

      emit(AuthorizationOtpConfirmedState(event.phoneNumber, event.code));
    } catch (_) {
      emit(AuthorizationOtpConfirmFailureState(event.phoneNumber, event.code));
    }
  }

  FutureOr<void> _signOut(
    AuthorizationSignOutEvent event,
    Emitter<AuthorizationState> emit,
  ) async {
    try {
      await _signOutUseCase();
      await _configuration.package.removeAccessToken();
      await _requestable.clearCookies();
      _requestable.removeAuthorizationHeader();
      emit(UnauthorizedState());
      _configuration.setInitialPath(OnboardingScreen.location());
    } catch (_) {
      emit(UnauthorizedState());
    }
  }
}
