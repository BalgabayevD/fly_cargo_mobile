import 'dart:io';

import 'package:fly_cargo/shared/orders/data/models/models.dart';

abstract class OrdersRepository {
  Future<OrderResult> createOrder(OrderData orderData);
  Future<PriceCalculationModel> calculateOrderPrice({
    required int tariffId,
    required int fromCityId,
    required int toCityId,
    required String toPhone,
  });
  Future<String> uploadOrderPhoto(File photoFile);
  Future<List<OrderModel>> getClientOrders();
  Future<List<OrderModel>> getCourierOrders();
}
