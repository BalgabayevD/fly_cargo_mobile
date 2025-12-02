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
    
    @JsonKey(includeIfNull: false) String? category,
    @JsonKey(includeIfNull: false) String? comment,
    @JsonKey(includeIfNull: false) String? fromApartment,
    @JsonKey(includeIfNull: false) String? fromEntrance,
    @JsonKey(includeIfNull: false) String? fromFloor,
    @JsonKey(includeIfNull: false) double? fromLatitude,
    @JsonKey(includeIfNull: false) double? fromLongitude,
    @JsonKey(includeIfNull: false) String? toApartment,
    @JsonKey(includeIfNull: false) String? toEntrance,
    @JsonKey(includeIfNull: false) String? toFloor,
    @JsonKey(includeIfNull: false) double? toLatitude,
    @JsonKey(includeIfNull: false) double? toLongitude,
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
