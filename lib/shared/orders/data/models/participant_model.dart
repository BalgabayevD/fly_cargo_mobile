import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_model.dart';

part 'participant_model.freezed.dart';
part 'participant_model.g.dart';

@freezed
sealed class ParticipantModel with _$ParticipantModel {
  const factory ParticipantModel({
    required String createdAt,
    required String updatedAt,
    required String target,
    int? id,
    String? deletedAt,
    int? orderId,
    String? userId,
    UserModel? user,
  }) = _ParticipantModel;

  factory ParticipantModel.fromJson(Map<String, dynamic> json) =>
      _$ParticipantModelFromJson(json);
}
