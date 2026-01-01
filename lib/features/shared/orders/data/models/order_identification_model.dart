import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_identification_model.freezed.dart';
part 'order_identification_model.g.dart';

@freezed
sealed class OrderIdentificationModel with _$OrderIdentificationModel {
  const factory OrderIdentificationModel({
    int? id,
    String? createdAt,
    String? updatedAt,
    int? orderId,
    String? target,
    String? uuid,
  }) = _OrderIdentificationModel;

  factory OrderIdentificationModel.fromJson(Map<String, dynamic> json) =>
      _$OrderIdentificationModelFromJson(json);
}

