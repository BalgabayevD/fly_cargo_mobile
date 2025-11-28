import 'package:freezed_annotation/freezed_annotation.dart';
import 'tariff_model.dart';

part 'tariff_category_model.freezed.dart';
part 'tariff_category_model.g.dart';

@freezed
sealed class TariffCategoryModel with _$TariffCategoryModel {
  const factory TariffCategoryModel({
    int? id,
    required String createdAt,
    required String updatedAt,
    String? deletedAt,
    required String name,
    required String key,
    int? sortIndex,
    required bool active,
    List<TariffModel>? tariffs,
  }) = _TariffCategoryModel;

  factory TariffCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$TariffCategoryModelFromJson(json);
}

