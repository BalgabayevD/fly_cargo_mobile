import 'package:fly_cargo/features/shared/orders/data/models/models.dart';
import 'package:fly_cargo/features/shared/orders/domain/repositories/orders_repository.dart';

class GetCreatedOrdersUseCase {
  final OrdersRepository _ordersRepository;
  GetCreatedOrdersUseCase(this._ordersRepository);
  Future<List<OrderModel>> call() async {
    return await _ordersRepository.getCreatedOrders();
  }
}
