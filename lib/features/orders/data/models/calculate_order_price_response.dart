import 'package:freezed_annotation/freezed_annotation.dart';

import 'price_calculation_model.dart';

part 'calculate_order_price_response.freezed.dart';
part 'calculate_order_price_response.g.dart';

@freezed
sealed class CalculateOrderPriceResponse with _$CalculateOrderPriceResponse {
  const factory CalculateOrderPriceResponse({
    required PriceCalculationModel data,
  }) = _CalculateOrderPriceResponse;

  factory CalculateOrderPriceResponse.fromJson(Map<String, dynamic> json) =>
      _$CalculateOrderPriceResponseFromJson(json);
}
