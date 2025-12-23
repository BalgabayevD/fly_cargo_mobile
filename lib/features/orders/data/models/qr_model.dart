import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_model.freezed.dart';
part 'qr_model.g.dart';

@freezed
sealed class QrModel with _$QrModel {
  const factory QrModel({
    int? id,
    String? createdAt,
    String? updatedAt,
    int? orderId,
    String? target,
    String? uuid,
  }) = _QrModel;

  factory QrModel.fromJson(Map<String, dynamic> json) =>
      _$QrModelFromJson(json);
}
