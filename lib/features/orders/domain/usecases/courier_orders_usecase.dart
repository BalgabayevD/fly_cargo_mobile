import 'package:fly_cargo/features/orders/domain/repositories/courier_orders_persist_repository.dart';
import 'package:fly_cargo/features/orders/domain/repositories/courier_orders_rest_repository.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:fly_cargo/features/submit_order/domain/entity/decline_order_entity.dart';
import 'package:fly_cargo/features/submit_order/domain/entity/submit_order_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class CourierOrdersUseCase {
  final CourierOrdersRestRepository courierOrdersRest;
  final CourierOrdersPersistRepository courierOrdersPersist;

  CourierOrdersUseCase(this.courierOrdersRest, this.courierOrdersPersist);

  List<OrderEntity> getPersistOrders() {
    return courierOrdersPersist.getOrders();
  }

  List<OrderEntity> getPersistOpenOrders() {
    return courierOrdersPersist.getOpenOrders();
  }

  Future<List<OrderEntity>> getOrders() async {
    final orders = await courierOrdersRest.getOrders();
    await courierOrdersPersist.setOrders(orders);
    return orders;
  }

  Future<List<OrderEntity>> getOpenOrders() async {
    final orders = await courierOrdersRest.getOpenOrders();
    await courierOrdersPersist.setOpenOrders(orders);
    return orders;
  }

  Future<OrderEntity?> getOrderById(int orderId) async {
    return await courierOrdersRest.getOrderById(orderId);
  }

  Future<OrderEntity?> getOrderByIdentification(String identification) async {
    return await courierOrdersRest.getOrderByIdentification(identification);
  }

  Future<OrderEntity?> accept(
    int orderId,
    int courierArriveTime,
  ) async {
    try {
      await courierOrdersRest.accept(orderId, courierArriveTime);
      return getOrderById(orderId);
    } catch (_) {
      return null;
    }
  }

  Future<OrderEntity?> submit(SubmitOrderEntity data) async {
    try {
      await courierOrdersRest.submit(data);
      return getOrderById(data.orderId);
    } catch (_) {
      return null;
    }
  }

  Future<OrderEntity?> decline(DeclineOrderEntity data) async {
    try {
      await courierOrdersRest.decline(data);
      return getOrderById(data.orderId);
    } catch (_) {
      return null;
    }
  }

  Future<bool> identify(int orderId, String identification) async {
    try {
      await courierOrdersRest.identify(orderId, identification);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<OrderEntity?> deliverToReceiver(int orderId) async {
    try {
      await courierOrdersRest.deliverToReceiver(orderId);
      return getOrderById(orderId);
    } catch (_) {
      return null;
    }
  }

  Future<OrderEntity?> completeOrder(int orderId, String code) async {
    try {
      await courierOrdersRest.completeOrder(orderId, code);
      return getOrderById(orderId);
    } catch (_) {
      return null;
    }
  }
}
