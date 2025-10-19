import 'package:fly_cargo/shared/orders/data/models/orders_models.dart';
import 'package:fly_cargo/shared/orders/data/orders_remote_source.dart';
import 'package:fly_cargo/shared/orders/domain/repositories/orders_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OrdersRepository)
class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersRemoteSource _remoteSource;

  OrdersRepositoryImpl(this._remoteSource);

  @override
  Future<OrderResult> createOrder(OrderData orderData) async {
    try {
      final request = orderData.toCreateOrderRequest();
      final response = await _remoteSource.createOrder(request);

      return OrderResult(
        orderId: response.orderId,
        status: response.status,
        message: response.message,
      );
    } catch (e) {
      throw OrdersException('Ошибка при создании заказа: $e');
    }
  }
}

class OrdersException implements Exception {
  final String message;

  const OrdersException(this.message);

  @override
  String toString() => 'OrdersException: $message';
}
