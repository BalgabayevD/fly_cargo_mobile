import 'package:fly_cargo/features/create_order/data/models/pre_create_order_response.dart';
import 'package:fly_cargo/features/create_order/domain/enitites/create_order_entity.dart';
import 'package:fly_cargo/features/create_order/domain/repositories/create_orders_repository.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateOrdersUseCase {
  final CreateOrdersRestRepository createOrdersRest;

  const CreateOrdersUseCase(this.createOrdersRest);

  Future<PreCreateOrderResult?> checkOrderByPhotos(
    List<String> fingerprints,
  ) async {
    try {
      final response = await createOrdersRest.checkOrderByPhotos(fingerprints);

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<double> getPrice(CreateOrderEntity data) async {
    try {
      return await createOrdersRest.getPrice(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<OrderEntity?> createOrder(CreateOrderEntity data) async {
    try {
      return await createOrdersRest.createOrder(data);
    } catch (e) {
      rethrow;
    }
  }
}
