import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_model.freezed.dart';
part 'package_model.g.dart';

@freezed
sealed class PackageModel with _$PackageModel {
  const factory PackageModel({
    required String createdAt,
    required String updatedAt,
    required bool isActive,
    required String name,
    required String description,
    required String image,
    int? id,
    String? deletedAt,
    double? price,
  }) = _PackageModel;

  factory PackageModel.fromJson(Map<String, dynamic> json) =>
      _$PackageModelFromJson(json);
}
