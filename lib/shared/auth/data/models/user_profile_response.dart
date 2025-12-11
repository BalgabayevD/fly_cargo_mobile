import 'package:json_annotation/json_annotation.dart';

import 'user_profile.dart';

part 'user_profile_response.g.dart';

@JsonSerializable()
class UserProfileResponse {
  final UserProfile data;
  const UserProfileResponse({required this.data});
  factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileResponseToJson(this);
}
