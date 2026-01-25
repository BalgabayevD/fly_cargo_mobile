import 'package:fly_cargo/features/orders/domain/repositories/client_orders_persist_repository.dart';
import 'package:fly_cargo/features/orders/domain/repositories/client_orders_rest_repository.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class ClientOrdersUseCase {
  final ClientOrdersRestRepository clientOrdersRest;
  final ClientOrdersPersistRepository clientOrdersPersist;

  ClientOrdersUseCase(this.clientOrdersRest, this.clientOrdersPersist);

  List<OrderEntity> getClientPersistOrders() {
    return clientOrdersPersist.getOrders();
  }

  Future<void> setClientPersistOrders(List<OrderEntity> orders) async {
    return await clientOrdersPersist.setOrders(orders);
  }

  Future<List<OrderEntity>> getClientRestOrders() async {
    return await clientOrdersRest.getOrders();
  }

  Future<OrderEntity?> getClientRestOrder(int orderId) async {
    return await clientOrdersRest.getOrderById(orderId);
  }

  Future<bool> cancelOrder(int orderId) async {
    return await clientOrdersRest.cancelOrder(orderId);
  }
}
