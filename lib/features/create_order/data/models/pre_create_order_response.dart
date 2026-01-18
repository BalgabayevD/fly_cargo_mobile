import 'package:freezed_annotation/freezed_annotation.dart';

part 'pre_create_order_response.freezed.dart';
part 'pre_create_order_response.g.dart';

enum AnalysisStatus {
  @JsonValue('NONE')
  none, // Достаточно фото

  @JsonValue('MORE_PHOTO_INSIDE')
  morePhotoInside, // Нужно больше фото содержимого

  @JsonValue('MORE_PHOTO_OUTSIDE')
  morePhotoOutside, // Нужно больше фото снаружи
}

@freezed
sealed class PreCreateOrderData with _$PreCreateOrderData {
  const factory PreCreateOrderData({
    required String description,
    required int tariffId,
    required double weight,
    required double height,
    required double length,
    required double width,
  }) = _PreCreateOrderData;

  factory PreCreateOrderData.fromJson(Map<String, dynamic> json) =>
      _$PreCreateOrderDataFromJson(json);
}

@freezed
sealed class PreCreateOrderResult with _$PreCreateOrderResult {
  const factory PreCreateOrderResult({
    required AnalysisStatus status,
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
