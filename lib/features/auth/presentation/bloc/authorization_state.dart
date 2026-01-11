part of 'authorization_bloc.dart';

sealed class AuthorizationState {}

class InitialAuthorizationState extends AuthorizationState {}

class AuthorizationOtpRequestingState extends AuthorizationState {
  final String phoneNumber;

  AuthorizationOtpRequestingState(this.phoneNumber);
}

class AuthorizationOtpRequestedState extends AuthorizationState {
  final String phoneNumber;

  AuthorizationOtpRequestedState(this.phoneNumber);
}

class AuthorizationOtpRequestFailureState extends AuthorizationState {
  final String phoneNumber;

  AuthorizationOtpRequestFailureState(this.phoneNumber);
}

class AuthorizationOtpConfirmingState extends AuthorizationState {
  final String phoneNumber;
  final String code;

  AuthorizationOtpConfirmingState(this.phoneNumber, this.code);
}

class AuthorizationOtpConfirmedState extends AuthorizationState {
  final String phoneNumber;
  final String code;

  AuthorizationOtpConfirmedState(this.phoneNumber, this.code);
}

class AuthorizationOtpConfirmFailureState extends AuthorizationState {
  final String phoneNumber;
  final String code;

  AuthorizationOtpConfirmFailureState(this.phoneNumber, this.code);
}

class AuthorizedState extends AuthorizationState {
  final UserSessionInfoModel sessionInfo;

  AuthorizedState(this.sessionInfo);
}

class UnauthorizedState extends AuthorizationState {}
