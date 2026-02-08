import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:fly_cargo/features/submit_order/domain/entity/decline_order_entity.dart';
import 'package:fly_cargo/features/submit_order/domain/entity/submit_order_entity.dart';

abstract class CourierOrdersRestRepository {
  Future<List<OrderEntity>> getOrders();
  Future<List<OrderEntity>> getOpenOrders();
  Future<OrderEntity?> getOrderById(int orderId);
  Future<OrderEntity?> getOrderByIdentification(String identification);

  Future<bool?> accept(int orderId, int courierArriveTime);
  Future<bool?> submit(SubmitOrderEntity data);
  Future<bool?> decline(DeclineOrderEntity data);
  Future<bool?> identify(int orderId, String identification);

  Future<bool> deliverToReceiver(int orderId);

  Future<bool> completeOrder(int orderId, String code);
}
