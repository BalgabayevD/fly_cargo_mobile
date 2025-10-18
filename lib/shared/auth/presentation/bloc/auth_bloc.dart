import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/shared/auth/domain/entities/user_type.dart';
import 'package:fly_cargo/shared/auth/domain/usecases/auth_status_usecase.dart';
import 'package:fly_cargo/shared/auth/domain/usecases/sign_code_usecase.dart';
import 'package:fly_cargo/shared/auth/domain/usecases/sign_in_usecase.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_event.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase _signInUseCase;
  final SignCodeUseCase _signCodeUseCase;
  final AuthStatusUseCase _authStatusUseCase;

  AuthBloc(this._signInUseCase, this._signCodeUseCase, this._authStatusUseCase)
    : super(const AuthInitial()) {
    on<AuthInitialized>(_onInitialized);
    on<AuthSignInRequested>(_onSignInRequested);
    on<AuthSignCodeRequested>(_onSignCodeRequested);
    on<AuthStatusChecked>(_onStatusChecked);
    on<AuthTokenRefreshed>(_onTokenRefreshed);
    on<AuthSignOutRequested>(_onSignOutRequested);
    on<AuthReset>(_onReset);
  }

  Future<void> _onInitialized(
    AuthInitialized event,
    Emitter<AuthState> emit,
  ) async {
    await _performAuthCheck(emit, 'инициализации');
  }

  Future<void> _onSignInRequested(
    AuthSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      final response = await _signInUseCase(event.phoneNumber);

      emit(
        AuthCodeSent(
          deviceId: response.deviceId,
          preAuthSessionId: response.preAuthSessionId,
          phoneNumber: event.phoneNumber,
        ),
      );
    } catch (e) {
      emit(
        AuthError(
          message: 'Не удалось отправить код: ${_extractErrorMessage(e)}',
        ),
      );
    }
  }

  Future<void> _onSignCodeRequested(
    AuthSignCodeRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      final response = await _signCodeUseCase(
        deviceId: event.deviceId,
        preAuthSessionId: event.preAuthSessionId,
        code: event.code,
      );

      if (response.success) {
        final userType = _determineUserType(response.userId);
        emit(
          AuthAuthenticated(
            userType: userType,
            userId: response.userId,
            accessToken: response.accessToken,
          ),
        );
      } else {
        emit(const AuthError(message: 'Неверный код подтверждения'));
      }
    } catch (e) {
      emit(
        AuthError(
          message: 'Ошибка подтверждения кода: ${_extractErrorMessage(e)}',
        ),
      );
    }
  }

  Future<void> _onStatusChecked(
    AuthStatusChecked event,
    Emitter<AuthState> emit,
  ) async {
    await _performAuthCheck(emit, 'проверки статуса');
  }

  Future<void> _onTokenRefreshed(
    AuthTokenRefreshed event,
    Emitter<AuthState> emit,
  ) async {
    try {
      add(const AuthStatusChecked());
    } catch (e) {
      emit(
        AuthError(
          message: 'Ошибка обновления токена: ${_extractErrorMessage(e)}',
        ),
      );
    }
  }

  Future<void> _onSignOutRequested(
    AuthSignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      emit(const AuthUnauthenticated(message: 'Вы вышли из системы'));
    } catch (e) {
      emit(AuthError(message: 'Ошибка выхода: ${_extractErrorMessage(e)}'));
    }
  }

  Future<void> _onReset(AuthReset event, Emitter<AuthState> emit) async {
    emit(const AuthInitial());
  }

  Future<void> _performAuthCheck(
    Emitter<AuthState> emit,
    String context,
  ) async {
    emit(const AuthLoading());

    try {
      final sessionStatus = await _authStatusUseCase.getSessionStatus();
      final isAuthenticated =
          sessionStatus['isAuthenticated'] as bool? ?? false;

      if (isAuthenticated) {
        final token = await _authStatusUseCase.getCurrentToken();
        final userType = _determineUserType(sessionStatus['userId'] as String?);

        emit(
          AuthAuthenticated(
            userType: userType,
            userId: sessionStatus['userId'] as String?,
            accessToken: token,
          ),
        );
      } else {
        emit(const AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(message: 'Ошибка $context: ${_extractErrorMessage(e)}'));
    }
  }

  UserType _determineUserType(String? userId) {
    return UserType.client;
  }

  String _extractErrorMessage(dynamic error) {
    if (error is Exception) {
      return error.toString().replaceFirst('Exception: ', '');
    }
    return error.toString();
  }
}
