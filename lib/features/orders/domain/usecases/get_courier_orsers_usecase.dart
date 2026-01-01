import 'package:fly_cargo/features/shared/orders/data/models/models.dart';
import 'package:fly_cargo/features/shared/orders/domain/repositories/orders_repository.dart';

class GetCourierOrdersUseCase {
  final OrdersRepository _ordersRepository;
  GetCourierOrdersUseCase(this._ordersRepository);
  Future<List<OrderModel>> call() async {
    return await _ordersRepository.getCourierOrders();
  }
}
