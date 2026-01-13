import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:fly_cargo/features/shared/orders/domain/repositories/orders_repository.dart';

class GetCreatedOrdersUseCase {
  final OrdersRepository _ordersRepository;

  GetCreatedOrdersUseCase(this._ordersRepository);

  Future<List<OrderEntity>> call() async {
    return await _ordersRepository.getCreatedOrders();
  }
}
