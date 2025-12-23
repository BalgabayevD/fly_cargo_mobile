import 'package:json_annotation/json_annotation.dart';

part 'sign_code_request.g.dart';

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

