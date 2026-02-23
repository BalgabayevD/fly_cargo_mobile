import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift_entity.freezed.dart';
part 'shift_entity.g.dart';

@freezed
sealed class ShiftEntity with _$ShiftEntity {
  const factory ShiftEntity({
    required bool isActive,
    String? openedAt,
    String? closedAt,
  }) = _ShiftEntity;

  factory ShiftEntity.fromJson(Map<String, Object?> json) =>
      _$ShiftEntityFromJson(json);
}
