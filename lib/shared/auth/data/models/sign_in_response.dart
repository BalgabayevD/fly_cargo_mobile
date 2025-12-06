import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response.g.dart';

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

