import 'dart:convert';

import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/requestable.dart';
import 'package:fly_cargo/features/orders/domain/repositories/client_orders_persist_repository.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: ClientOrdersPersistRepository)
class ClientOrdersPersistRepositoryImpl
    implements ClientOrdersPersistRepository {
  final Requestable requestable;
  final Configuration configuration;

  const ClientOrdersPersistRepositoryImpl(this.requestable, this.configuration);

  static String key = 'persist:client/orders';

  SharedPreferences get sharedPreferences =>
      configuration.package.sharedPreferences;

  @override
  List<OrderEntity> getOrders() {
    final orders = sharedPreferences.getStringList(key);

    if (orders == null) {
      return const <OrderEntity>[];
    }

    return orders.map((order) {
      final Map<String, dynamic> map = json.decode(order);
      return OrderEntity.fromJson(map);
    }).toList();
  }

  @override
  Future<void> setOrders(List<OrderEntity> orders) async {
    final list = orders.map((order) => json.encode(order.toJson())).toList();
    await sharedPreferences.setStringList(key, list);
  }
}
