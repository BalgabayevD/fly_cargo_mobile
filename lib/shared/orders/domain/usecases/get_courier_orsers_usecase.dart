import 'package:fly_cargo/shared/orders/data/models/orders_models.dart';
import 'package:fly_cargo/shared/orders/domain/repositories/orders_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCourierOrdersUseCase {
  final OrdersRepository _ordersRepository;
  GetCourierOrdersUseCase(this._ordersRepository);
  Future<List<OrderModel>> call() async {
    try {
      return await _ordersRepository.getCourierOrders();
    } catch (e) {
      // throw OrdersUseCaseException('Ошибка при загрузке заказов: $e');
      return [];
    }
  }
}
