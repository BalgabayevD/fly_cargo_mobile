import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_order_entity.freezed.dart';
part 'submit_order_entity.g.dart';

@freezed
sealed class SubmitOrderEntity with _$SubmitOrderEntity {
  const factory SubmitOrderEntity({
    required int orderId,
    required int tariffId,
    required bool isDefect,
    required List<String> defectPhotos,

    required double weight,
  }) = _SubmitOrderEntity;

  factory SubmitOrderEntity.fromJson(Map<String, Object?> json) =>
      _$SubmitOrderEntityFromJson(json);
}
