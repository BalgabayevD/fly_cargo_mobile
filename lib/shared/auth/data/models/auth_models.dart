import 'package:json_annotation/json_annotation.dart';

part 'auth_models.g.dart';

@JsonSerializable()
class SignInRequest {
  final String phoneNumber;

  const SignInRequest({required this.phoneNumber});

  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignInRequestToJson(this);
}

@JsonSerializable()
class SignInResponse {
  final String deviceId;
  final String preAuthSessionId;

  const SignInResponse({
    required this.deviceId,
    required this.preAuthSessionId,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}

@JsonSerializable()
class SignCodeRequest {
  final String deviceId;
  final String preAuthSessionId;
  final String userInputCode;

  const SignCodeRequest({
    required this.deviceId,
    required this.preAuthSessionId,
    required this.userInputCode,
  });

  factory SignCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$SignCodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignCodeRequestToJson(this);
}

@JsonSerializable()
class SignCodeResponse {
  final String? accessToken;
  final String? refreshToken;
  final String? userId;
  final bool success;

  const SignCodeResponse({
    this.accessToken,
    this.refreshToken,
    this.userId,
    required this.success,
  });

  factory SignCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$SignCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignCodeResponseToJson(this);
}

@JsonSerializable()
class SessionStatusResponse {
  final bool exists;
  final String? userId;
  final DateTime? expiresAt;

  const SessionStatusResponse({
    required this.exists,
    this.userId,
    this.expiresAt,
  });

  factory SessionStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$SessionStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SessionStatusResponseToJson(this);
}
