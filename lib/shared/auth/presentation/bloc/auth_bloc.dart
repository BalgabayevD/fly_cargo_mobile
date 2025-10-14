import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/shared/auth/domain/entities/user_type.dart';
import 'package:fly_cargo/shared/auth/domain/usecases/auth_status_usecase.dart';
import 'package:fly_cargo/shared/auth/domain/usecases/sign_code_usecase.dart';
import 'package:fly_cargo/shared/auth/domain/usecases/sign_in_usecase.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_event.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_state.dart';
import 'package:injectable/injectable.dart';

/// Блок для управления состоянием аутентификации
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

  /// Инициализация аутентификации при запуске приложения
  Future<void> _onInitialized(
    AuthInitialized event,
    Emitter<AuthState> emit,
  ) async {
    await _performAuthCheck(emit, 'инициализации');
  }

  /// Отправка номера телефона для получения кода подтверждения
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

  /// Подтверждение кода и вход в систему
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

  /// Проверка текущего статуса аутентификации
  Future<void> _onStatusChecked(
    AuthStatusChecked event,
    Emitter<AuthState> emit,
  ) async {
    await _performAuthCheck(emit, 'проверки статуса');
  }

  /// Обновление токена доступа
  Future<void> _onTokenRefreshed(
    AuthTokenRefreshed event,
    Emitter<AuthState> emit,
  ) async {
    try {
      // TODO: Реализовать обновление токена через API
      // Пока что просто проверяем текущий статус
      add(const AuthStatusChecked());
    } catch (e) {
      emit(
        AuthError(
          message: 'Ошибка обновления токена: ${_extractErrorMessage(e)}',
        ),
      );
    }
  }

  /// Выход из системы
  Future<void> _onSignOutRequested(
    AuthSignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      // TODO: Реализовать вызов API для выхода
      // Пока что просто сбрасываем состояние
      emit(const AuthUnauthenticated(message: 'Вы вышли из системы'));
    } catch (e) {
      emit(AuthError(message: 'Ошибка выхода: ${_extractErrorMessage(e)}'));
    }
  }

  /// Сброс состояния аутентификации
  Future<void> _onReset(AuthReset event, Emitter<AuthState> emit) async {
    emit(const AuthInitial());
  }

  /// Выполняет проверку статуса аутентификации
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

  /// Определяет тип пользователя на основе доступной информации
  UserType _determineUserType(String? userId) {
    // TODO: Реализовать логику определения типа пользователя
    // Варианты:
    // 1. Анализ JWT токена
    // 2. API вызов для получения роли пользователя
    // 3. Локальное хранение типа пользователя
    // 4. Анализ userId

    // Пока что возвращаем client как дефолт
    return UserType.client;
  }

  /// Извлекает читаемое сообщение об ошибке из исключения
  String _extractErrorMessage(dynamic error) {
    if (error is Exception) {
      return error.toString().replaceFirst('Exception: ', '');
    }
    return error.toString();
  }
}
