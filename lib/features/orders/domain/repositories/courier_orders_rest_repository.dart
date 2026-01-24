import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';

abstract class CourierOrdersRestRepository {
  Future<List<OrderEntity>> getOrders();
  Future<List<OrderEntity>> getOpenOrders();
  Future<OrderEntity?> getOrderById(int orderId);
  Future<OrderEntity?> getOrderByIdentification(String identification);

  Future<bool?> acceptOrder(int orderId, int courierArriveTime);
}
