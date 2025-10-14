import 'package:equatable/equatable.dart';
import 'package:fly_cargo/shared/auth/domain/entities/user_type.dart';

/// Базовый класс для состояний аутентификации
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// Начальное состояние
class AuthInitial extends AuthState {
  const AuthInitial();
}

/// Состояние загрузки
class AuthLoading extends AuthState {
  const AuthLoading();
}

/// Состояние успешной аутентификации
class AuthAuthenticated extends AuthState {
  final UserType userType;
  final String? userId;
  final String? accessToken;

  const AuthAuthenticated({
    required this.userType,
    this.userId,
    this.accessToken,
  });

  @override
  List<Object?> get props => [userType, userId, accessToken];

  /// Создать копию состояния с обновленными полями
  AuthAuthenticated copyWith({
    UserType? userType,
    String? userId,
    String? accessToken,
  }) {
    return AuthAuthenticated(
      userType: userType ?? this.userType,
      userId: userId ?? this.userId,
      accessToken: accessToken ?? this.accessToken,
    );
  }
}

/// Состояние неавторизованного пользователя
class AuthUnauthenticated extends AuthState {
  final String? message;

  const AuthUnauthenticated({this.message});

  @override
  List<Object?> get props => [message];
}

/// Состояние ошибки
class AuthError extends AuthState {
  final String message;
  final String? errorCode;

  const AuthError({required this.message, this.errorCode});

  @override
  List<Object?> get props => [message, errorCode];
}

/// Состояние успешной отправки кода
class AuthCodeSent extends AuthState {
  final String deviceId;
  final String preAuthSessionId;
  final String phoneNumber;

  const AuthCodeSent({
    required this.deviceId,
    required this.preAuthSessionId,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [deviceId, preAuthSessionId, phoneNumber];
}
