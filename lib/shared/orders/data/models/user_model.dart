import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
sealed class UserModel with _$UserModel {
  const factory UserModel({
    int? id,
    required String createdAt,
    required String updatedAt,
    String? deletedAt,
    required String uuid,
    required String email,
    required String phone,
    required String firstName,
    required String lastName,
    required String middleName,
    required String birthDay,
    required String photo,
    required String city,
    required String type,
    required String iin,
    required String bin,
    dynamic access,
    required String role,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
