import 'package:equatable/equatable.dart';

/// Базовый класс для событий аутентификации
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

/// Событие инициализации аутентификации
class AuthInitialized extends AuthEvent {
  const AuthInitialized();
}

/// Событие отправки номера телефона для получения кода
class AuthSignInRequested extends AuthEvent {
  final String phoneNumber;

  const AuthSignInRequested({required this.phoneNumber});

  @override
  List<Object?> get props => [phoneNumber];
}

/// Событие подтверждения кода
class AuthSignCodeRequested extends AuthEvent {
  final String deviceId;
  final String preAuthSessionId;
  final String code;

  const AuthSignCodeRequested({
    required this.deviceId,
    required this.preAuthSessionId,
    required this.code,
  });

  @override
  List<Object?> get props => [deviceId, preAuthSessionId, code];
}

/// Событие проверки статуса аутентификации
class AuthStatusChecked extends AuthEvent {
  const AuthStatusChecked();
}

/// Событие обновления токена
class AuthTokenRefreshed extends AuthEvent {
  const AuthTokenRefreshed();
}

/// Событие выхода из системы
class AuthSignOutRequested extends AuthEvent {
  const AuthSignOutRequested();
}

/// Событие сброса состояния аутентификации
class AuthReset extends AuthEvent {
  const AuthReset();
}
