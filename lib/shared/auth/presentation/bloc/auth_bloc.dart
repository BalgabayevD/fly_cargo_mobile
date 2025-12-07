import 'dart:developer';

import 'package:flutter_better_auth/flutter_better_auth.dart';
import 'package:flutter_better_auth/plugins/phone/models/verify/verify_phone_body.dart';
import 'package:flutter_better_auth/plugins/phone/phone_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/shared/auth/domain/entities/user_type.dart';
import 'package:fly_cargo/shared/auth/domain/usecases/auth_status_usecase.dart';
import 'package:fly_cargo/shared/auth/domain/usecases/get_user_profile_usecase.dart';
import 'package:fly_cargo/shared/auth/domain/usecases/sign_in_usecase.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_event.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase _signInUseCase;
  final AuthStatusUseCase _authStatusUseCase;
  final GetUserProfileUseCase _getUserProfileUseCase;
  
  AuthBloc(
    this._signInUseCase,
    this._authStatusUseCase,
    this._getUserProfileUseCase,
  ) : super(const AuthInitial()) {
    on<AuthInitialized>(_onInitialized);
    on<AuthRequestOTPRequested>(_onRequestOTP);
    on<AuthVerifyCodeRequested>(_verifyCode);
    on<AuthLoadProfile>(_onLoadProfile);
    on<AuthLogout>(_onLogout);
  }
  Future<void> _onInitialized(
    AuthInitialized event,
    Emitter<AuthState> emit,
  ) async {
    final session = await FlutterBetterAuth.client.getSession();

    if (session.data?.session != null) {
      try {
        final profile = await _authStatusUseCase.getUserProfile();
        final daysSinceCreated = _calculateDaysSinceCreated(profile.createdAt);
        emit(
          AuthAuthenticated(
            userType: profile.role,
            userId: session.data?.session.userId,
            accessToken: session.data?.session.token,
            profile: profile,
            daysSinceCreated: daysSinceCreated,
          ),
        );
      } catch (e) {
        emit(
          AuthAuthenticated(
            userType: UserType.client,
            userId: session.data?.session.userId,
            accessToken: session.data?.session.token,
          ),
        );
      }
      return;
    }

    try {
      final profile = await _authStatusUseCase.getUserProfile();
      final token = await _authStatusUseCase.getCurrentToken();
      final daysSinceCreated = _calculateDaysSinceCreated(profile.createdAt);
      emit(
        AuthAuthenticated(
          userType: profile.role,
          userId: profile.id.toString(),
          accessToken: token,
          profile: profile,
          daysSinceCreated: daysSinceCreated,
        ),
      );
    } catch (e) {
      log(e.toString());
      emit(const AuthUnauthenticated());
    }
  }

  Future<void> _onRequestOTP(
    AuthRequestOTPRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final response = await _signInUseCase(event.phoneNumber);
      if (response != null) {
        emit(
          AuthCodeSent(
            deviceId: response.message,
            preAuthSessionId: response.message,
            phoneNumber: event.phoneNumber,
          ),
        );
      } else {
        emit(const AuthError(message: 'Ошибка отправки кода'));
      }
    } catch (e) {
      emit(AuthError(message: 'Не удалось отправить код: ${e.toString()}'));
    }
  }

  Future<void> _verifyCode(
    AuthVerifyCodeRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      await FlutterBetterAuth.client.phone.verify(
        body: VerifyPhoneBody(phoneNumber: event.phoneNumber, code: event.code),
      );

      await Future.delayed(const Duration(milliseconds: 500));

      final sessionStatus = await _authStatusUseCase.getSessionStatus();

      if (sessionStatus?.session == null) {
        emit(const AuthError(message: 'Не удалось создать сессию'));
        return;
      }

      try {
        final profile = await _authStatusUseCase.getUserProfile();
        final token = await _authStatusUseCase.getCurrentToken();
        final daysSinceCreated = _calculateDaysSinceCreated(profile.createdAt);

        emit(
          AuthAuthenticated(
            userType: profile.role,
            userId: profile.id.toString(),
            accessToken: token,
            profile: profile,
            daysSinceCreated: daysSinceCreated,
          ),
        );
      } catch (profileError) {
        final token = await _authStatusUseCase.getCurrentToken();
        emit(
          AuthAuthenticated(
            userType: UserType.client,
            userId: sessionStatus!.session.userId,
            accessToken: token,
          ),
        );
      }
    } catch (e) {
      emit(AuthError(message: 'Неверный код или ошибка подтверждения'));
    }
  }

  Future<void> _onLogout(AuthLogout event, Emitter<AuthState> emit) async {
    await FlutterBetterAuth.client.signOut();
    emit(const AuthInitial());
  }

  Future<void> _onLoadProfile(
    AuthLoadProfile event,
    Emitter<AuthState> emit,
  ) async {
    final currentState = state;
    if (currentState is! AuthAuthenticated) {
      return;
    }

    // Если профиль уже загружен, не загружаем повторно
    if (currentState.profile != null) {
      return;
    }

    try {
      final profile = await _getUserProfileUseCase();
      final daysSinceCreated = _calculateDaysSinceCreated(profile.createdAt);
      
      emit(
        currentState.copyWith(
          profile: profile,
          daysSinceCreated: daysSinceCreated,
        ),
      );
    } catch (e) {
      log('Failed to load profile: ${e.toString()}');
      // Не меняем состояние при ошибке, просто логируем
    }
  }

  int _calculateDaysSinceCreated(String createdAt) {
    try {
      final createdDate = DateTime.parse(createdAt);
      final now = DateTime.now();
      final difference = now.difference(createdDate);
      return difference.inDays;
    } catch (e) {
      log('Failed to calculate days since created: ${e.toString()}');
      return 0;
    }
  }
}
