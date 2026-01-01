import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_model.freezed.dart';
part 'city_model.g.dart';

@freezed
sealed class CityModel with _$CityModel {
  const factory CityModel({
    required String name,
    required String country,
    required String createdAt,
    required String updatedAt,
    int? id,
    String? deletedAt,
    List<dynamic>? RoutesFrom,
    List<dynamic>? RoutesTo,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}
