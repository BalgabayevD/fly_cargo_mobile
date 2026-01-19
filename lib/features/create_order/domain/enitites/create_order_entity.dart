import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_order_entity.freezed.dart';
part 'create_order_entity.g.dart';

@freezed
abstract class CreateOrderEntity with _$CreateOrderEntity {
  const factory CreateOrderEntity({
    @Default('') String comment,
    @Default('') String description,
    @Default(false) bool isDefect,
    @Default(false) bool isFragile,
    @Default(<String>[]) List<String> photos,
    @Default(<String>[]) List<String> contentPhotos,
    @Default(0) int tariffId,
    @Default(0.0) double height,
    @Default(0.0) double length,
    double? volumetricWeight,
    @Default(0.0) double weight,
    @Default(0.0) double width,
    @Default(0) int fromCityId,
    @Default('') String fromAddress,
    @Default('') String fromApartment,

    @Default(0) int toCityId,
    @Default('') String toAddress,
    @Default('') String toApartment,
    @Default('') String toEntrance,

    @Default('') String toName,
    @Default('+7') String toPhone,
    @Default('') String fromEntrance,
    @Default('') String fromFloor,
    double? fromLatitude,
    double? fromLongitude,
    @Default('') String toFloor,
    double? toLatitude,
    double? toLongitude,
    @Default('') category,
  }) = _CreateOrderEntity;

  factory CreateOrderEntity.fromJson(Map<String, Object?> json) =>
      _$CreateOrderEntityFromJson(json);
}
