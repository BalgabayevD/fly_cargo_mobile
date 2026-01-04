import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_entity.freezed.dart';

@freezed
sealed class CityEntity with _$CityEntity {
  const CityEntity._();

  const factory CityEntity({
    required String id,
    required String name,
    String? region,
  }) = _CityEntity;

  String get displayName {
    if (region != null) {
      return '$name, $region';
    }
    return name;
  }
}
