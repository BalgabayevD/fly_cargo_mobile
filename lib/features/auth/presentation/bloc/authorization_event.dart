part of 'authorization_bloc.dart';

sealed class AuthorizationEvent {}

class AuthorizationGetSessionEvent extends AuthorizationEvent {}

class AuthorizationRequestOtpEvent extends AuthorizationEvent {
  final String phoneNumber;

  AuthorizationRequestOtpEvent(this.phoneNumber);
}

class AuthorizationConfirmOtpEvent extends AuthorizationEvent {
  final String phoneNumber;
  final String code;

  AuthorizationConfirmOtpEvent(this.phoneNumber, this.code);
}

class AuthorizationSignOutEvent extends AuthorizationEvent {}
