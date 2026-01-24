import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';

abstract class CourierOrdersPersistRepository {
  List<OrderEntity> getOrders();
  List<OrderEntity> getOpenOrders();
  Future<void> setOrders(List<OrderEntity> orders);
  Future<void> setOpenOrders(List<OrderEntity> orders);
}
