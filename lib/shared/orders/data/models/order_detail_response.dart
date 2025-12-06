import 'package:json_annotation/json_annotation.dart';
import 'order_model.dart';

part 'order_detail_response.g.dart';

@JsonSerializable()
class OrderDetailResponse {
  final OrderModel data;

  const OrderDetailResponse({required this.data});

  factory OrderDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailResponseToJson(this);
}

