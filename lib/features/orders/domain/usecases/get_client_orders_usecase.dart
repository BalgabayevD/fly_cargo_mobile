import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:fly_cargo/features/shared/orders/domain/repositories/orders_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetClientOrdersUseCase {
  final OrdersRepository _ordersRepository;

  GetClientOrdersUseCase(this._ordersRepository);

  Future<List<OrderEntity>> call() async {
    return await _ordersRepository.getClientOrders();
  }
}
