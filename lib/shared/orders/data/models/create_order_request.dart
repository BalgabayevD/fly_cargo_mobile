import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_order_request.freezed.dart';
part 'create_order_request.g.dart';

@freezed
sealed class CreateOrderRequest with _$CreateOrderRequest {
  const CreateOrderRequest._();

  const factory CreateOrderRequest({
    required bool isDefect,
    required bool isFragile,
    required String comment,
    required List<String> contentPhotos,
    required String description,
    required String fromAddress,
    required String fromApartment,
    required int fromCityId,
    required String fromEntrance,
    required double height,
    required double length,
    required List<String> photos,
    required int tariffId,
    required String toAddress,
    required String toApartment,
    required int toCityId,
    required String toEntrance,
    required String toName,
    required String toPhone,
    required double weight,
    required double width,
    @JsonKey(includeIfNull: false) String? category,
    @JsonKey(includeIfNull: false) String? fromFloor,
    @JsonKey(includeIfNull: false) double? fromLatitude,
    @JsonKey(includeIfNull: false) double? fromLongitude,
    @JsonKey(includeIfNull: false) String? toFloor,
    @JsonKey(includeIfNull: false) double? toLatitude,
    @JsonKey(includeIfNull: false) double? toLongitude,
    @JsonKey(includeIfNull: false) double? volumetricWeight,
  }) = _CreateOrderRequest;

  factory CreateOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    final json = _$CreateOrderRequestToJson(this as _CreateOrderRequest);
    // Удаляем null значения для опциональных полей
    json.removeWhere((key, value) => value == null);
    return json;
  }
}
