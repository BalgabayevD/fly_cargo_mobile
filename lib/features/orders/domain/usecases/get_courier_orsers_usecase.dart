import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:fly_cargo/features/shared/orders/domain/repositories/orders_repository.dart';

class GetCourierOrdersUseCase {
  final OrdersRepository _ordersRepository;

  GetCourierOrdersUseCase(this._ordersRepository);

  Future<List<OrderEntity>> call() async {
    return await _ordersRepository.getCourierOrders();
  }
}
