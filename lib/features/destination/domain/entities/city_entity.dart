import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_entity.freezed.dart';
part 'city_entity.g.dart';

@freezed
sealed class CityEntity with _$CityEntity {
  const CityEntity._();

  const factory CityEntity({
    required int id,
    required String name,
    String? region,
  }) = _CityEntity;

  factory CityEntity.fromJson(Map<String, dynamic> json) =>
      _$CityEntityFromJson(json);
}
