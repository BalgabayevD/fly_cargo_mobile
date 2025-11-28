import 'package:fly_cargo/shared/orders/data/models/models.dart';
import 'package:fly_cargo/shared/orders/domain/repositories/orders_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetClientOrdersUseCase {
  final OrdersRepository _ordersRepository;
  GetClientOrdersUseCase(this._ordersRepository);
  Future<List<OrderModel>> call() async {
    try {
      return await _ordersRepository.getClientOrders();
    } catch (e) {
      // throw OrdersUseCaseException('Ошибка при загрузке заказов: $e');
      return [];
    }
  }
}
