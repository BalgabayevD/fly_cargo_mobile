import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';

part 'accumulator_entity.freezed.dart';
part 'accumulator_entity.g.dart';

@JsonEnum(valueField: 'value')
enum AccumulatorStatus {
  open('open'),
  close('close'),
  arrived('arrived'),
  ;

  final String value;

  const AccumulatorStatus(this.value);
}

@freezed
sealed class AccumulatorEntity with _$AccumulatorEntity {
  const factory AccumulatorEntity({
    required int id,
    required String createdAt,
    required String updatedAt,
    required int fromCityId,
    required int toCityId,
    required String status,
    required String identification,
    String? deletedAt,
    String? pickUpTime,
    String? receiveTime,
    OrderCityEntity? fromCity,
    OrderCityEntity? toCity,
    @Default([]) List<OrderEntity> orders,
  }) = _AccumulatorEntity;

  factory AccumulatorEntity.fromJson(Map<String, Object?> json) =>
      _$AccumulatorEntityFromJson(json);
}
