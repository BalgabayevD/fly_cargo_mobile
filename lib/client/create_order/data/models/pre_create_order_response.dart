import 'package:freezed_annotation/freezed_annotation.dart';

part 'pre_create_order_response.freezed.dart';
part 'pre_create_order_response.g.dart';

@freezed
sealed class PreCreateOrderData with _$PreCreateOrderData {
  const factory PreCreateOrderData({
    required double weight,
    required int tariffId,
    required String description,
    required int height,
    required int length,
    required int width,
  }) = _PreCreateOrderData;

  factory PreCreateOrderData.fromJson(Map<String, dynamic> json) =>
      _$PreCreateOrderDataFromJson(json);
}

@freezed
sealed class PreCreateOrderResult with _$PreCreateOrderResult {
  const factory PreCreateOrderResult({
    required String status,
    required bool success,
    required PreCreateOrderData result,
  }) = _PreCreateOrderResult;

  factory PreCreateOrderResult.fromJson(Map<String, dynamic> json) =>
      _$PreCreateOrderResultFromJson(json);
}

@freezed
sealed class PreCreateOrderResponse with _$PreCreateOrderResponse {
  const factory PreCreateOrderResponse({
    required bool success,
    required int code,
    required String description,
    PreCreateOrderResult? data,
  }) = _PreCreateOrderResponse;

  factory PreCreateOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$PreCreateOrderResponseFromJson(json);
}