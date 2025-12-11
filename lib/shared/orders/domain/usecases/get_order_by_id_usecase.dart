import 'package:fly_cargo/shared/orders/data/models/models.dart';
import 'package:fly_cargo/shared/orders/domain/repositories/orders_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetOrderByIdUseCase {
  final OrdersRepository _ordersRepository;
  GetOrderByIdUseCase(this._ordersRepository);
  
  Future<OrderModel> call(String orderId) async {
    return await _ordersRepository.getOrderById(orderId);
  }
}

