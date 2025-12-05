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
    required this.success,
    this.accessToken,
    this.refreshToken,
    this.userId,
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

@JsonSerializable()
class UserProfile {
  final String id;
  final String name;
  final String email;
  final bool emailVerified;
  final String? image;
  final String createdAt;
  final String updatedAt;
  final String phoneNumber;
  final bool phoneNumberVerified;
  final String role;
  final bool banned;
  final String? banReason;
  final String? banExpires;
  final String? lang;

  const UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerified,
    required this.createdAt,
    required this.updatedAt,
    required this.phoneNumber,
    required this.phoneNumberVerified,
    required this.role,
    required this.banned,
    this.image,
    this.banReason,
    this.banExpires,
    this.lang,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}

@JsonSerializable()
class UserProfileResponse {
  final UserProfile data;
  const UserProfileResponse({required this.data});
  factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileResponseToJson(this);
}
