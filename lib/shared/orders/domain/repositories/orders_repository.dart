import 'dart:io';

import 'package:fly_cargo/shared/orders/data/models/orders_models.dart';


abstract class OrdersRepository {

  Future<OrderResult> createOrder(OrderData orderData);


  Future<String> uploadOrderPhoto(File photoFile);
}
