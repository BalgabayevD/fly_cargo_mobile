import 'package:freezed_annotation/freezed_annotation.dart';

import 'tariff_model.dart';

part 'tariff_category_model.freezed.dart';
part 'tariff_category_model.g.dart';

@freezed
sealed class TariffCategoryModel with _$TariffCategoryModel {
  const factory TariffCategoryModel({
    required String createdAt,
    required String updatedAt,
    required String name,
    required String key,
    required bool active,
    int? id,
    String? deletedAt,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'sort_index') int? sortIndex,
    List<TariffModel>? tariffs,
  }) = _TariffCategoryModel;

  factory TariffCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$TariffCategoryModelFromJson(json);
}
