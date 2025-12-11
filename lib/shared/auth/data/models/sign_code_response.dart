import 'package:json_annotation/json_annotation.dart';

part 'sign_code_response.g.dart';

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

