import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';

abstract class ClientOrdersRestRepository {
  Future<List<OrderEntity>> getOrders();
  Future<OrderEntity?> getOrderById(int orderId);
  // Future<bool> cancelOrder(int orderId);
  // Future<bool> payOrder(int orderId);
}
