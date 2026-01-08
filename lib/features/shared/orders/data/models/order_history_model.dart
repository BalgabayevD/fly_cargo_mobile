import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_model.freezed.dart';
part 'order_history_model.g.dart';

@freezed
sealed class OrderHistoryModel with _$OrderHistoryModel {
  const factory OrderHistoryModel({
    int? id,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    int? orderId,
    String? status,
    String? userId,
    String? comment,
    String? description,
    String? parameters,
  }) = _OrderHistoryModel;

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryModelFromJson(json);
}

