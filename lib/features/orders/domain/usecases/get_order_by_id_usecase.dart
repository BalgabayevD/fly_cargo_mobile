import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:fly_cargo/features/shared/orders/domain/repositories/orders_repository.dart';

class GetOrderByIdUseCase {
  final OrdersRepository _ordersRepository;

  GetOrderByIdUseCase(this._ordersRepository);

  Future<OrderEntity> call(String orderId) async {
    return await _ordersRepository.getOrderById(orderId);
  }
}

