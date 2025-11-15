import 'package:equatable/equatable.dart';
import 'package:fly_cargo/shared/auth/domain/entities/user_type.dart';
abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}
class AuthInitial extends AuthState {
  const AuthInitial();
}
class AuthLoading extends AuthState {
  const AuthLoading();
}
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
class AuthUnauthenticated extends AuthState {
  final String? message;
  const AuthUnauthenticated({this.message});
  @override
  List<Object?> get props => [message];
}
class AuthError extends AuthState {
  final String message;
  final String? errorCode;
  const AuthError({required this.message, this.errorCode});
  @override
  List<Object?> get props => [message, errorCode];
}
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
