import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_code_result_entity.freezed.dart';

@freezed
sealed class SignCodeResultEntity with _$SignCodeResultEntity {
  const factory SignCodeResultEntity({
    required bool success,
    String? accessToken,
    String? refreshToken,
    String? userId,
  }) = _SignCodeResultEntity;
}
