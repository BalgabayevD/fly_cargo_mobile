import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/requestable.dart';
import 'package:fly_cargo/features/auth/data/models/user_session_model.dart';
import 'package:fly_cargo/features/auth/domain/repositories/authorization_repository.dart';
import 'package:fly_cargo/shared/utils/helper.dart';
import 'package:injectable/injectable.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

@injectable
class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  final AuthorizationRepository authorizationRepository;
  final Configuration configuration;
  final Requestable requestable;

  AuthorizationBloc({
    required this.authorizationRepository,
    required this.configuration,
    required this.requestable,
  }) : super(
         InitialAuthorizationState(
           configuration.isShowOnboarding,
           configuration.isAuthenticated,
         ),
       ) {
    on<AuthorizationGetSessionEvent>(_getSession);
    on<AuthorizationRequestOtpEvent>(_requestOtp);
    on<AuthorizationConfirmOtpEvent>(_confirmOtp);
    on<AuthorizationSignOutEvent>(_signOut);
  }

  FutureOr<void> _getSession(
    AuthorizationGetSessionEvent event,
    Emitter<AuthorizationState> emit,
  ) async {
    try {
      emit(AuthorizationLoadingState());

      final session = await authorizationRepository.getSession();

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

      await authorizationRepository.requestOTP(unmaskPhone(event.phoneNumber));

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

      final token = await authorizationRepository.confirmOTP(
        unmaskPhone(event.phoneNumber),
        event.code,
      );

      if (token != null) {
        configuration.package.setAccessToken(token);
        requestable.addAuthorizationHeader(token);
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
      await authorizationRepository.signOut();
      await configuration.package.removeAccessToken();
      requestable.removeAuthorizationHeader();
      emit(UnauthorizedState());
    } catch (_) {
      emit(UnauthorizedState());
    }
  }
}
