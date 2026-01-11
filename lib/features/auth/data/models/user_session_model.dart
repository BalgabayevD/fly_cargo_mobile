import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_session_model.freezed.dart';
part 'user_session_model.g.dart';

@freezed
abstract class UserSessionInfoModel with _$UserSessionInfoModel {
  const factory UserSessionInfoModel({
    required UserSessionModel session,
    required UserModel user,
    required String? accessToken,
  }) = _UserSessionInfoModel;

  factory UserSessionInfoModel.fromJson(Map<String, Object?> json) =>
      _$UserSessionInfoModelFromJson(json);
}

@freezed
abstract class UserSessionModel with _$UserSessionModel {
  const factory UserSessionModel({
    required String id,
    required String createdAt,
    required String updatedAt,
    required String expiresAt,
    required String token,
    required String ipAddress,
    required String userId,
  }) = _UserSessionModel;

  factory UserSessionModel.fromJson(Map<String, Object?> json) =>
      _$UserSessionModelFromJson(json);
}

enum UserRole {
  admin('admin'),
  courier('courier'),
  operator('operator'),
  user('user')
  ;

  const UserRole(this.value);

  final String value;
}

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String? name,
    required String? email,
    required bool emailVerified,
    required String? image,
    required String createdAt,
    required String updatedAt,
    required String? phoneNumber,
    required bool phoneNumberVerified,
    required UserRole role,
    required bool banned,
    required String? banReason,
    required String? banExpires,
    required String? lang,
    required String? firstName,
    required String? lastName,
    required String? middleName,
    required String? birthDay,
    required String? city,
    required String? type,
    required String? iin,
    required String? bin,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
