import 'package:json_annotation/json_annotation.dart';

import 'order_model.dart';

part 'orders_response.g.dart';

@JsonSerializable()
class OrdersResponse {
  final List<OrderModel> data;

  const OrdersResponse({required this.data});

  factory OrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$OrdersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersResponseToJson(this);
}
