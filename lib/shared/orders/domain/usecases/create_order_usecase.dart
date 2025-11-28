import 'package:fly_cargo/shared/orders/data/models/models.dart';
import 'package:fly_cargo/shared/orders/domain/repositories/orders_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateOrderUseCase {
  final OrdersRepository _ordersRepository;
  CreateOrderUseCase(this._ordersRepository);
  Future<OrderResult> call(OrderData orderData) async {
    try {
      _validateOrderData(orderData);
      return await _ordersRepository.createOrder(orderData);
    } catch (e) {
      throw OrdersUseCaseException('Ошибка при создании заказа: $e');
    }
  }

  void _validateOrderData(OrderData orderData) {
    if (orderData.fromAddress.isEmpty) {
      throw ArgumentError('Адрес отправки не может быть пустым');
    }
    if (orderData.toAddress.isEmpty) {
      throw ArgumentError('Адрес доставки не может быть пустым');
    }
    if (orderData.fromCityId <= 0) {
      throw ArgumentError('ID города отправки должен быть больше 0');
    }
    if (orderData.toCityId <= 0) {
      throw ArgumentError('ID города доставки должен быть больше 0');
    }
    if (orderData.weight <= 0) {
      throw ArgumentError('Вес должен быть больше 0');
    }
    if (orderData.tariffId <= 0) {
      throw ArgumentError('ID тарифа должен быть больше 0');
    }
  }
}

class OrdersUseCaseException implements Exception {
  final String message;
  const OrdersUseCaseException(this.message);
  @override
  String toString() => 'OrdersUseCaseException: $message';
}
