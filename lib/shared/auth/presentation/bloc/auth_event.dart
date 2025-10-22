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
class AuthRequestOTPRequested extends AuthEvent {
  final String phoneNumber;

  const AuthRequestOTPRequested({required this.phoneNumber});

  @override
  List<Object?> get props => [phoneNumber];
}

/// Событие подтверждения кода
class AuthVerifyCodeRequested extends AuthEvent {
  final String code, phoneNumber;

  const AuthVerifyCodeRequested({
    required this.phoneNumber,
    required this.code,
  });

  @override
  List<Object?> get props => [code, phoneNumber];
}

/// Событие выхода из системы
class AuthLogout extends AuthEvent {
  const AuthLogout();
}
