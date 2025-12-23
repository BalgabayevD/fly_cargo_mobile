import 'package:fly_cargo/features/orders/data/models/models.dart';
import 'package:fly_cargo/features/orders/domain/repositories/orders_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetOrderByIdUseCase {
  final OrdersRepository _ordersRepository;
  GetOrderByIdUseCase(this._ordersRepository);
  
  Future<OrderModel> call(String orderId) async {
    return await _ordersRepository.getOrderById(orderId);
  }
}

