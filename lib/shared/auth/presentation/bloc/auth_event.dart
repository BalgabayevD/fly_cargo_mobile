import 'package:equatable/equatable.dart';


abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}


class AuthInitialized extends AuthEvent {
  const AuthInitialized();
}


class AuthRequestOTPRequested extends AuthEvent {
  final String phoneNumber;

  const AuthRequestOTPRequested({required this.phoneNumber});

  @override
  List<Object?> get props => [phoneNumber];
}


class AuthVerifyCodeRequested extends AuthEvent {
  final String code, phoneNumber;

  const AuthVerifyCodeRequested({
    required this.phoneNumber,
    required this.code,
  });

  @override
  List<Object?> get props => [code, phoneNumber];
}


class AuthLogout extends AuthEvent {
  const AuthLogout();
}
