import 'package:json_annotation/json_annotation.dart';

part 'session_status_response.g.dart';

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

