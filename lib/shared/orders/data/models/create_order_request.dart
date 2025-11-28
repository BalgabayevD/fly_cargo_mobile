import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_order_request.freezed.dart';
part 'create_order_request.g.dart';

@freezed
sealed class CreateOrderRequest with _$CreateOrderRequest {
  const factory CreateOrderRequest({
    required bool isDefect,
    required bool isFragile,
    required String category,
    required String comment,
    required List<String> contentPhotos,
    required String description,
    required String fromAddress,
    required String fromApartment,
    required int fromCityId,
    required String fromEntrance,
    required String fromFloor,
    required double fromLatitude,
    required double fromLongitude,
    required double height,
    required double length,
    required List<String> photos,
    required int tariffId,
    required String toAddress,
    required String toApartment,
    required int toCityId,
    required String toEntrance,
    required String toFloor,
    required double toLatitude,
    required double toLongitude,
    required String toName,
    required String toPhone,
    required double volumetricWeight,
    required double weight,
    required double width,
  }) = _CreateOrderRequest;

  factory CreateOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderRequestFromJson(json);
}

