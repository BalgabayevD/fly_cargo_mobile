import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_order_request.freezed.dart';
part 'create_order_request.g.dart';

@freezed
sealed class CreateOrderRequest with _$CreateOrderRequest {
  const CreateOrderRequest._();

  const factory CreateOrderRequest({
    required bool isDefect,
    required bool isFragile,
    required List<String> contentPhotos,
    required String description,
    required String fromAddress,
    required int fromCityId,
    required double height,
    required double length,
    required List<String> photos,
    required int tariffId,
    required String toAddress,
    required int toCityId,
    required String toName,
    required String toPhone,
    required double weight,
    required double width,
    String? category,
    String? comment,
    String? fromApartment,
    String? fromEntrance,
    String? fromFloor,
    double? fromLatitude,
    double? fromLongitude,
    String? toApartment,
    String? toEntrance,
    String? toFloor,
    double? toLatitude,
    double? toLongitude,
  }) = _CreateOrderRequest;

  factory CreateOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    final json = _$CreateOrderRequestToJson(this as _CreateOrderRequest);
    json.removeWhere((key, value) => value == null);
    return json;
  }
}
