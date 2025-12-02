import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';

part 'participant_model.freezed.dart';
part 'participant_model.g.dart';

@freezed
sealed class ParticipantModel with _$ParticipantModel {
  const factory ParticipantModel({
    int? id,
    required String createdAt,
    required String updatedAt,
    String? deletedAt,
    int? orderId,
    String? userId,
    UserModel? user,
    required String target,
  }) = _ParticipantModel;

  factory ParticipantModel.fromJson(Map<String, dynamic> json) =>
      _$ParticipantModelFromJson(json);
}
