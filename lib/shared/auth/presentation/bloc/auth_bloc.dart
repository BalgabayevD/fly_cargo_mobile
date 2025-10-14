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

  /// Инициализация аутентификации
  Future<void> _onInitialized(
    AuthInitialized event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      final isAuthenticated = await _authStatusUseCase.isAuthenticated();

      if (isAuthenticated) {
        final token = await _authStatusUseCase.getCurrentToken();
        // Здесь можно определить тип пользователя по токену или API
        // Пока что используем client как дефолт
        emit(AuthAuthenticated(userType: UserType.client, accessToken: token));
      } else {
        emit(const AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(message: 'Ошибка инициализации: $e'));
    }
  }

  /// Отправка номера телефона для получения кода
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
      emit(AuthError(message: 'Ошибка отправки кода: $e'));
    }
  }

  /// Подтверждение кода
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
        // Определяем тип пользователя (можно добавить логику определения)
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
      emit(AuthError(message: 'Ошибка подтверждения кода: $e'));
    }
  }

  /// Проверка статуса аутентификации
  Future<void> _onStatusChecked(
    AuthStatusChecked event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final isAuthenticated = await _authStatusUseCase.isAuthenticated();

      if (isAuthenticated) {
        final token = await _authStatusUseCase.getCurrentToken();
        // Определяем тип пользователя
        final userType = _determineUserType(null);

        emit(AuthAuthenticated(userType: userType, accessToken: token));
      } else {
        emit(const AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(message: 'Ошибка проверки статуса: $e'));
    }
  }

  /// Обновление токена
  Future<void> _onTokenRefreshed(
    AuthTokenRefreshed event,
    Emitter<AuthState> emit,
  ) async {
    try {
      // Здесь можно добавить логику обновления токена
      // Пока что просто проверяем статус
      add(const AuthStatusChecked());
    } catch (e) {
      emit(AuthError(message: 'Ошибка обновления токена: $e'));
    }
  }

  /// Выход из системы
  Future<void> _onSignOutRequested(
    AuthSignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      // Здесь можно добавить вызов API для выхода
      // Пока что просто сбрасываем состояние
      emit(const AuthUnauthenticated(message: 'Вы вышли из системы'));
    } catch (e) {
      emit(AuthError(message: 'Ошибка выхода: $e'));
    }
  }

  /// Сброс состояния
  Future<void> _onReset(AuthReset event, Emitter<AuthState> emit) async {
    emit(const AuthInitial());
  }

  /// Определение типа пользователя
  /// В реальном приложении это может быть API вызов или анализ токена
  UserType _determineUserType(String? userId) {
    // Здесь можно добавить логику определения типа пользователя
    // Например, по userId, по данным в токене, или по API вызову

    // Пока что возвращаем client как дефолт
    // В будущем можно добавить:
    // - Анализ JWT токена
    // - API вызов для получения роли пользователя
    // - Локальное хранение типа пользователя

    return UserType.client;
  }
}
