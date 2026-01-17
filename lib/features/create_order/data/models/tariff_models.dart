import 'package:freezed_annotation/freezed_annotation.dart';

part 'tariff_models.freezed.dart';
part 'tariff_models.g.dart';

@freezed
abstract class PackageModel with _$PackageModel {
  const factory PackageModel({
    required int id,
    required String description,
    required String image,
    required String name,
  }) = _PackageModel;

  factory PackageModel.fromJson(Map<String, Object?> json) =>
      _$PackageModelFromJson(json);
}

@freezed
abstract class TariffModel with _$TariffModel {
  const factory TariffModel({
    required int id,
    required String description,
    required String image,
    required String name,
    List<String>? fields,
    double? height,
    double? invoiceWeight,
    double? length,
    double? volumetricWeight,
    double? weight,
    double? width,
  }) = _TariffModel;

  factory TariffModel.fromJson(Map<String, Object?> json) =>
      _$TariffModelFromJson(json);
}

@freezed
abstract class TariffCategoryModel with _$TariffCategoryModel {
  const factory TariffCategoryModel({
    required int id,
    required String key,
    required String name,
    List<TariffModel>? tariffs,
  }) = _TariffCategoryModel;

  factory TariffCategoryModel.fromJson(Map<String, Object?> json) =>
      _$TariffCategoryModelFromJson(json);
}

@freezed
abstract class TariffCategoriesApiResponse with _$TariffCategoriesApiResponse {
  const factory TariffCategoriesApiResponse({
    required List<TariffCategoryModel> data,
  }) = _TariffCategoriesApiResponse;

  factory TariffCategoriesApiResponse.fromJson(Map<String, Object?> json) =>
      _$TariffCategoriesApiResponseFromJson(json);
}

typedef TariffCategoriesResponse = List<TariffCategoryModel>;

@freezed
abstract class CreateTariffRequest with _$CreateTariffRequest {
  const factory CreateTariffRequest({
    required double additionalCostForFragileCargo,
    required double costPriceOfAirShipment,
    required String description,
    required List<String> fields,
    required double height,
    required int icon,
    required String image,
    required bool isActive,
    required double length,
    required String name,
    required int packageId,
    required int sortIndex,
    required int tariffCategoryId,
    required double volumetricWeight,
    required double weight,
    required double width,
  }) = _CreateTariffRequest;

  factory CreateTariffRequest.fromJson(Map<String, Object?> json) =>
      _$CreateTariffRequestFromJson(json);
}
