import 'package:fly_cargo/features/orders/data/models/models.dart';
import 'package:fly_cargo/features/orders/domain/repositories/orders_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCourierOrdersUseCase {
  final OrdersRepository _ordersRepository;
  GetCourierOrdersUseCase(this._ordersRepository);
  Future<List<OrderModel>> call() async {
    return await _ordersRepository.getCourierOrders();
  }
}
