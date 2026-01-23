import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';

abstract class ClientOrdersPersistRepository {
  List<OrderEntity> getOrders();
  Future<void> setOrders(List<OrderEntity> orders);
}
