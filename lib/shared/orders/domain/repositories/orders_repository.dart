import 'dart:io';

import 'package:fly_cargo/shared/orders/data/models/orders_models.dart';

/// Абстракция для репозитория работы с заказами
abstract class OrdersRepository {
  /// Создание нового заказа
  Future<OrderResult> createOrder(OrderData orderData);

  /// Загрузка фотографии заказа
  Future<String> uploadOrderPhoto(File photoFile);
}
