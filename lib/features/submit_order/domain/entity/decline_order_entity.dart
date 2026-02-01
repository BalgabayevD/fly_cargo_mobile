import 'package:freezed_annotation/freezed_annotation.dart';

part 'decline_order_entity.freezed.dart';
part 'decline_order_entity.g.dart';

@freezed
sealed class DeclineOrderEntity with _$DeclineOrderEntity {
  const factory DeclineOrderEntity({
    required int orderId,
    required String decideReason,
    required String decideDescription,
  }) = _DeclineOrderEntity;

  factory DeclineOrderEntity.fromJson(Map<String, Object?> json) =>
      _$DeclineOrderEntityFromJson(json);
}
