import 'package:fly_cargo/features/shared/orders/data/models/order_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_order_response.freezed.dart';
part 'create_order_response.g.dart';

@freezed
sealed class CreateOrderResponse with _$CreateOrderResponse {
  const factory CreateOrderResponse({
    required OrderModel data,
  }) = _CreateOrderResponse;

  factory CreateOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderResponseFromJson(json);
}
