import 'dart:io';

import 'package:fly_cargo/features/create_order/data/models/order_data.dart';
import 'package:fly_cargo/features/create_order/data/models/pre_create_order_response.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';

abstract class OrdersRepository {
  Future<OrderResultEntity> createOrder(OrderData orderData);
  Future<PreCreateOrderResult> preCreateOrder(List<File> images);
  Future<PriceCalculationEntity> calculateOrderPrice({
    required int tariffId,
    required int fromCityId,
    required int toCityId,
    required String toPhone,
  });
  Future<String> uploadOrderPhoto(File photoFile);
  Future<List<OrderEntity>> getClientOrders();
  Future<List<OrderEntity>> getCourierOrders();
  Future<List<OrderEntity>> getCreatedOrders();
  Future<OrderEntity> getOrderById(String orderId);
}
