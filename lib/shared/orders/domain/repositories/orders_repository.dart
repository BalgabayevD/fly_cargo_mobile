import 'dart:io';

import 'package:fly_cargo/client/create_order/data/models/pre_create_order_response.dart';
import 'package:fly_cargo/shared/orders/data/models/models.dart';

abstract class OrdersRepository {
  Future<OrderResult> createOrder(OrderData orderData);
  Future<PreCreateOrderData> preCreateOrder(List<File> images);
  Future<PriceCalculationModel> calculateOrderPrice({
    required int tariffId,
    required int fromCityId,
    required int toCityId,
    required String toPhone,
  });
  Future<String> uploadOrderPhoto(File photoFile);
  Future<List<OrderModel>> getClientOrders();
  Future<List<OrderModel>> getCourierOrders();
  Future<List<OrderModel>> getCreatedOrders();
  Future<OrderModel> getOrderById(String orderId);
}
